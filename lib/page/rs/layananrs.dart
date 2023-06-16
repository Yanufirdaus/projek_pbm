import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:projek_pbm/page/rs/identrs.dart';
import 'package:projek_pbm/page/rs/jamrs.dart';
import 'package:projek_pbm/page/rs/signup%20rs.dart';
import 'package:projek_pbm/page/user/login.dart';

bool ugdstat= false;
bool igdstat= false;
bool isLoading= false;

Map<String, dynamic> layananrs = {};

class layananRS extends StatefulWidget {
  const layananRS({super.key, required String rsiddd, required String nott, required double latt, required double longg, required String ugdd, required String igdd, File? pictt, required Map<String, dynamic> jambkrs, required Map<String, dynamic> jamtprs, required String alamatrsuu});

  @override
  State<layananRS> createState() => _layananRSState();
}

TextEditingController layanan1 = TextEditingController();
TextEditingController layanan2 = TextEditingController();
TextEditingController layanan3 = TextEditingController();
TextEditingController layanan4 = TextEditingController();
TextEditingController layanan5 = TextEditingController();

class _layananRSState extends State<layananRS> {


  


  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    if (screenHeight<screenWidth) {
      screenHeight=MediaQuery.of(context).size.width;
      screenWidth=MediaQuery.of(context).size.height;
    }

    return Scaffold(
      backgroundColor:Color.fromARGB(255, 234, 231, 177),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: screenWidth*0.7,
                child: 
                  Text("Masukkan 5 Layanan Unggulan Rumah Sakit".toUpperCase(), style: TextStyle(fontSize: screenWidth*0.05, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85)), textAlign: TextAlign.center,),
                  // Text('Masukkan 5 Layanan Unggulan Rumah Sakit'),
              ),
              Padding(padding: EdgeInsets.only(left: screenWidth*0.15, top: screenHeight*0.03),
                child: 
                  Row(
                    children: [
                      Container(
                        width: screenWidth*0.25,
                        child: Text('Layanan 1 :', style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85))),
                        // Text("layanan 1 :"),
                      ),
                      Container(
                        width: screenWidth*0.45,
                        child: TextFormField(
                          controller: layanan1,
                        )
                      )
                    ],
                  ),
              ),
              Padding(padding: EdgeInsets.only(left: screenWidth*0.15),
                child: 
                  Row(
                    children: [
                      Container(
                        width: screenWidth*0.25,
                        child: Text('Layanan 2 :', style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85))),
                        // Text("layanan 2 :"),
                      ),
                      Container(
                        width: screenWidth*0.45,
                        child: TextFormField(
                          controller: layanan2,
                        )
                      )
                    ],
                  ),
              ),
              Padding(padding: EdgeInsets.only(left: screenWidth*0.15),
                child: 
                  Row(
                    children: [
                      Container(
                        width: screenWidth*0.25,
                        child: Text('Layanan 3 :', style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85))),
                        // Text("layanan 3 :"),
                      ),
                      Container(
                        width: screenWidth*0.45,
                        child: TextFormField(
                          controller: layanan3,
                        )
                      )
                    ],
                  ),
              ),
              Padding(padding: EdgeInsets.only(left: screenWidth*0.15),
                child: 
                  Row(
                    children: [
                      Container(
                        width: screenWidth*0.25,
                        child: Text('Layanan 4 :', style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85))),
                        // Text("layanan 4 :"),
                      ),
                      Container(
                        width: screenWidth*0.45,
                        child: TextFormField(
                          controller: layanan4,
                        )
                      )
                    ],
                  ),
              ),
              Padding(padding: EdgeInsets.only(left: screenWidth*0.15),
                child: 
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: screenHeight*0.035),
                        width: screenWidth*0.25,
                        child: Text('Layanan 5 :', style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85))),
                        // Text("layanan 5 :"),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: screenHeight*0.035),
                        width: screenWidth*0.45,
                        child: TextFormField(
                          controller: layanan5,
                        )
                      )
                    ],
                  ),
              ),
              ElevatedButton(onPressed: ()
                async {
                  if(dropdownUgd == 'Ada'){
                    ugdstat = true;
                  }
                  if(dropdownIgd == "Ada"){
                    igdstat = true;
                  }
                  layananrs = {'layanan1': layanan1.text, 'layanan2': layanan2.text, 'layanan3': layanan3.text, 'layanan4': layanan4.text, 'layanan5': layanan5.text};


                  String uniqueFileName =
                      DateTime.now().millisecondsSinceEpoch.toString();

                  Reference referenceRoot = FirebaseStorage.instance.ref();
                  Reference referenceDirImages =
                      referenceRoot.child('images rs');

                  Reference referenceImageToUpload =
                      referenceDirImages.child(rsid);
                    
                  setState(() {
                    isLoading = true;
                  });
                  try {
                    await referenceImageToUpload.putFile(File(imageFile!.path));
                    //Success: get the download URL
                    var imageUrl = await referenceImageToUpload.getDownloadURL();
                    debugPrint(imageUrl);
                    var collection = FirebaseFirestore.instance.collection('user');
                    collection 
                        .doc(rsid) 
                        .update({
                          'jam_buka' : jambkrs,
                          'jam_tutup' : jamtprs,
                          'layanan' : layananrs,
                          'lokasi' : GeoPoint(lat, long),
                          'no_telp' : notelp,
                          'ugd' : ugdstat,
                          'igd' : igdstat,
                          'gambar': imageUrl,
                          'alamat': alamatrsu
                        })
                        .then((_) => debugPrint('Success'))
                          .catchError((error) => print('Failed: $error'));
                          setState(() {
                            isLoading = false;
                          });
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  LoginPage()
                            ),
                          );
                          
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Berhasil Menyimpan"), backgroundColor: Color.fromARGB(255, 0, 255, 8),)
                          );
                          layanan1.text = "";
                          layanan2.text = "";
                          layanan3.text = "";
                          layanan4.text = "";
                          layanan5.text = "";
                          
                  } catch (error) {
                    debugPrint;
                  }
                }, 
                child: isLoading?
                LoadingAnimationWidget.staggeredDotsWave(
                  color: Color.fromARGB(255, 60, 98, 85),
                  size: screenHeight*0.04,
                ):
                Text("Submit")
              )
            ],
          ),
        ),
      ),
    );
  }
}