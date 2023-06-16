// import 'package:camera/camera.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:projek_pbm/page/rs/jamrs.dart';
import 'package:projek_pbm/page/rs/signup%20rs.dart';

String dropdownIgd = 'Tidak Ada';
String dropdownUgd = 'Tidak Ada';
String notelp = '';
String alamatrsu = '';
double lat = 0;
double long = 0;
File? imageFile;

class identRs extends StatefulWidget {
  const identRs({super.key, required String rsid});

  @override
  State<identRs> createState() => _identRsState();
}

TextEditingController notelpcontroller = TextEditingController();
TextEditingController latcontroller = TextEditingController();
TextEditingController longcontroller = TextEditingController();
TextEditingController alamatcontroller = TextEditingController();



class _identRsState extends State<identRs> {

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
      }
    });
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
      body:Center(child: 
        SingleChildScrollView(
          child: Column( children:[
              // Text("Isi Identitas Rumah Sakit Dengan Benar". toUpperCase()),
              Text("Isi Identitas Rumah Sakit Dengan Benar".toUpperCase(), style: TextStyle(fontSize: screenWidth*0.05, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85)), textAlign: TextAlign.center,),
              Container(
                padding: EdgeInsets.only(top: screenHeight*0.05),
                width: screenWidth*0.7,
                child:
                   Text("Alamat", style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85))),
                  // Text('Alamat')
              ),
              Container(
                margin: EdgeInsets.only(bottom: screenHeight*0.03),
                width: screenWidth*0.7,
                child:
                  TextFormField(
                    controller: alamatcontroller,
                  )
              ),
              Container(
                width: screenWidth*0.7,
                child:
                  Text('Nomer Telpon', style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85))),
                  // Text('Nomer Telpon')
              ),
              Container(
                margin: EdgeInsets.only(bottom: screenHeight*0.03),
                width: screenWidth*0.7,
                child:
                  TextFormField(
                    controller: notelpcontroller,
                  )
              ),
              Container(
                width: screenWidth*0.7,
                child:
                  Text('Detail Lokasi (copy latitude dan longitude melalui googlee maps!)', style: TextStyle(fontSize: screenWidth*0.025, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85))),
                  // Text('Detail Lokasi (copy latitude dan longitude melalui googlee maps!)')
              ),
              Padding( padding: EdgeInsets.only(left: screenWidth*0.15, top: screenWidth*0.01), child:
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: screenWidth*0.3,
                          child:
                            Text("Latitude", style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85))),
                            // Text('latitude')
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: screenHeight*0.03),
                          width: screenWidth*0.3,
                          child:
                            TextFormField(
                              controller: latcontroller,
                            )
                        ),
                      ],
                    ),
                    SizedBox(
                      width: screenWidth*0.1,
                    ),
                    Column(
                      children: [
                        Container(
                          width: screenWidth*0.3,
                          child:
                            Text("Longitude", style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85))),
                            // Text('longitude')
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: screenHeight*0.03),
                          width: screenWidth*0.3,
                          child:
                            TextFormField(
                              controller:  longcontroller,
                            )
                        ),
                      ],
                    )
                  ],
                )
              ),
              Padding( padding: EdgeInsets.only(left: screenWidth*0.15), child:
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: screenWidth*0.3,
                          child:
                            Text("UGD", style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85))),
                            // Text('ugd')
                        ),
                        Container(
                          width: screenWidth*0.3,
                          child:
                            DropdownButtonFormField<String>(
                              value: dropdownUgd,
                              items: <String>['Ada', 'Tidak Ada']
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
                                  dropdownUgd = newValue!;
                                });
                              },
                            ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: screenWidth*0.1,
                    ),
                    Column(
                      children: [
                        Container(
                          width: screenWidth*0.3,
                          child:
                            Text("IGD", style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85))),
                            // Text('igd')
                        ),
                        Container(
                          width: screenWidth*0.3,
                          child:
                            DropdownButtonFormField<String>(
                              value: dropdownIgd,
                              items: <String>['Ada', 'Tidak Ada']
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
                                  dropdownIgd = newValue!;
                                });
                              },
                            ),
                        ),
                      ],
                    )
                  ],
                )
              ),
              Container(
                margin: EdgeInsets.only(top: screenHeight*0.03),
                width: screenWidth*0.6,
                child:
                  Text("Foto Rumah Sakit", style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85)), textAlign: TextAlign.center,)
              ),
              Container(
                margin: EdgeInsets.only(bottom: screenHeight*0.03),
                width: screenWidth*0.6,
                child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (imageFile != null)
                        Image.file(imageFile!),
                      InkWell(
                        onTap: () => _pickImage(ImageSource.gallery),
                        child: 
                          // Text('Pick Image'),
                          Icon(
                            Icons.image_search,
                            color: Color.fromARGB(255, 60, 98, 85),
                            size: 40.0,
                          ),
                      ),
                    ],
                  ),
              ),
              ElevatedButton
              (
                onPressed: (){
                  notelp = notelpcontroller.text;
                  lat = double.parse(latcontroller.text);
                  long = double.parse(longcontroller.text);
                  alamatrsu = alamatcontroller.text;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => jamRs(not: notelp, lat: lat, long: long, ugd: dropdownUgd, igd: dropdownIgd, pict: imageFile, rsidd: rsid, alamatrsu: alamatrsu), 
                    ),
                  );
                  notelpcontroller.text = "";
                  latcontroller.text = "";
                  longcontroller.text = "";
                  alamatcontroller.text = "";
                  // imageFile = null;
                }, 
                child: Text("Lanjutkan")
              )
            ]
          ),
        )
      )
    );
  }
}