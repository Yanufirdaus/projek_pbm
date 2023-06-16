import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:projek_pbm/page/user/carirs.dart';
import 'package:projek_pbm/page/user/login.dart';
import 'package:projek_pbm/page/user/qrcode.dart';


String dokumenid = "";

class BookRs extends StatefulWidget {
  const BookRs({super.key, required String namers, required String accname, required String uidacc});

  @override
  State<BookRs> createState() => _BookRsState();
}

TextEditingController namecontroller = TextEditingController();
TextEditingController alamatcontroller = TextEditingController();
TextEditingController umurcontroller = TextEditingController();
TextEditingController nohpcontroller = TextEditingController();
TextEditingController keluhancontroller = TextEditingController();

String dropdownValue = 'Pria';


class _BookRsState extends State<BookRs> {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Position? _currentPosition;

  Future<void> _submitForm() async {
    String nameps = namecontroller.text;
    String address = alamatcontroller.text;
    int age = int.tryParse(umurcontroller.text) ?? 0;
    String phoneNumber = nohpcontroller.text;
    String gender = dropdownValue;
    String keluhan = keluhancontroller.text;

    await _getCurrentPosition();

    double latitude = _currentPosition?.latitude ?? 0.0;
    double longitude = _currentPosition?.longitude ?? 0.0;

    User? user = FirebaseAuth.instance.currentUser;

    if(user != null){
      String uid = user.uid;
      DocumentReference docRef = await _firestore.collection('data_pasien').add({
        'passien_name': nameps,
        'p_address': address,
        'age': age,
        'p_numberphone': phoneNumber,
        'gender': gender,
        'keluhan': keluhan,
        'p_location': GeoPoint(latitude, longitude),
        'rs_name' : namers,
        'acc_name' : uid,
        'status': 'belum diproses'
      });
      String documentId = docRef.id;
      setState(() {
        dokumenid = documentId;
      });
    }


    

    print(dokumenid);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Form submitted successfully')),
    );
  }

  Future<void> _getCurrentPosition() async {
    bool hasPermission = await _handleLocationPermission();
    if (hasPermission) {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentPosition = position;
      });
    }
  }

  Future<bool> _handleLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location permissions are denied')),
        );
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    if (screenHeight<screenWidth) {
      screenHeight=MediaQuery.of(context).size.width;
      screenWidth=MediaQuery.of(context).size.height;
    }
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 231, 177),
      body: Center(child:
          SingleChildScrollView(
            child: Container(
              width: screenWidth*0.85,
              height: screenHeight*0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 246, 241, 233)
              ),
              child: Column(children: [
                Padding(padding: EdgeInsets.only(top: screenHeight*0.02, bottom: screenHeight*0.02), 
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    height: 40.0,
                    alignment: Alignment.center,
                    child: 
                    Align(alignment: Alignment.topLeft,
                      child: 
                        InkWell(
                          child: 
                            Icon(
                              Icons.arrow_circle_left,
                              color: Color.fromARGB(255, 60, 98, 85),
                              size: 38.0,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                        )
                    )
                )),
                Text("Isikan Formulir Biodata".toUpperCase(), style: TextStyle(fontSize: screenWidth*0.05, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85)), textAlign: TextAlign.center,),
                Padding(padding: EdgeInsets.only(top: screenWidth*0.07),
                  child:
                    SizedBox(width: screenWidth*0.7,
                      child:
                        Text("Nama", style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85))),
                    ),
                ),
                Container(
                  width: screenWidth*0.7,
                  child:
                    TextFormField(
                      controller: namecontroller,
                    )
                ),
                Row(children: [
                  Column(children: [
                    Padding(padding: EdgeInsets.only(top: screenWidth*0.07, left: screenWidth*0.07),
                      child:
                        SizedBox(width: screenWidth*0.45,
                          child:
                            Text("Alamat", style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85))),
                        ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: screenWidth*0.05),
                      width: screenWidth*0.45,
                      child:
                        TextFormField(
                          controller: alamatcontroller,
                        )
                    ),
                  ],),
                  Column(children: [
                    Padding(padding: EdgeInsets.only(top: screenWidth*0.07),
                      child:
                        SizedBox(width: screenWidth*0.20,
                          child:
                            Text("Umur", style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85))),
                        ),
                    ),
                    Container(
                      // padding: EdgeInsets.only(left: screenWidth*0.2),
                      width: screenWidth*0.20,
                      child:
                        TextFormField(
                          controller: umurcontroller,
                        )
                    ),
                  ],)
                ]),
                Row(children: [
                  Column(children: [
                    Padding(padding: EdgeInsets.only(top: screenWidth*0.07, left: screenWidth*0.07),
                      child:
                        SizedBox(width: screenWidth*0.45,
                          child:
                            Text("Nomer Handphone", style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85))),
                        ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: screenWidth*0.05),
                      width: screenWidth*0.45,
                      child:
                        TextFormField(
                          controller: nohpcontroller,
                        )
                    ),
                  ],),
                  Column(children: [
                    Padding(padding: EdgeInsets.only(top: screenWidth*0.07),
                      child:
                        SizedBox(width: screenWidth*0.20,
                          child:
                            Text("Gender", style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85))),
                        ),
                    ),
                    Container(
                      // padding: EdgeInsets.only(left: screenWidth*0.2),
                      width: screenWidth*0.20,
                      child:
                        DropdownButtonFormField<String>(
                          value: dropdownValue,
                          items: <String>['Pria', 'Wanita']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                              value: value ,
                              child: Text(
                                value, 
                                style: TextStyle(fontSize: screenHeight*0.015, color: Color.fromARGB(255, 60, 98, 85)),
                              ),
                            );
                          }).toList(), 
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                        ),
                    ),
                  ],)
                ]),
                Padding(padding: EdgeInsets.only(top: screenWidth*0.07),
                  child:
                    SizedBox(width: screenWidth*0.7,
                      child:
                        Text("Keluhan (isi jika perlu)", style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85))),
                    ),
                ),
                Container(
                  width: screenWidth*0.7,
                  child:
                    TextFormField(
                      controller: keluhancontroller,
                    )
                ),
                Padding( padding: EdgeInsets.only(top:screenHeight*0.05),
                  child:
                    ElevatedButton(onPressed: () async{
                      await _submitForm();
                      // await _getCurrentPosition();
                      // debugPrint(_currentPosition?.longitude.toString());
                      // debugPrint(_currentPosition?.latitude.toString());
                      namecontroller.text = "";
                      alamatcontroller.text = "";
                      umurcontroller.text = "";
                      nohpcontroller.text = "";
                      dropdownValue = "Pria";
                      keluhancontroller.text = "";
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QrDisplay(dokid: dokumenid)
                        ),
                      );
                    }, 
                      child: Text("Submit")
                    )
                )
              ],)
            ),
          )
        )
      // Text("ini page buat booking"),
    );
  }
}
