import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cross_file/src/types/interface.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:projek_pbm/page/rs/layananrs.dart';
import 'package:projek_pbm/page/rs/signup%20rs.dart';
import 'package:projek_pbm/page/user/login.dart';
import 'identrs.dart';

// File image = imageFile!;
Map<String, dynamic> jambkrs = {};
Map<String, dynamic> jamtprs = {};

class jamRs extends StatefulWidget {
  const jamRs({super.key, required String igd, required double lat, required double long, required String not, required String ugd, File? pict, required String rsidd, required String alamatrsu});

  @override
  State<jamRs> createState() => _jamRsState();
}

TextEditingController bukasenin = TextEditingController();
TextEditingController bukaselasa = TextEditingController();
TextEditingController bukarabu = TextEditingController();
TextEditingController bukakamis = TextEditingController();
TextEditingController bukajumat = TextEditingController();
TextEditingController bukasabtu = TextEditingController();
TextEditingController bukaminggu = TextEditingController();
TextEditingController tutupsenin = TextEditingController();
TextEditingController tutupselasa = TextEditingController();
TextEditingController tutuprabu = TextEditingController();
TextEditingController tutupkamis = TextEditingController();
TextEditingController tutupjumat = TextEditingController();
TextEditingController tutupsabtu = TextEditingController();
TextEditingController tutupminggu = TextEditingController();


class _jamRsState extends State<jamRs> {
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
              Text("Isi jam buka rumah sakit setiap harinya".toUpperCase(), style: TextStyle(fontSize: screenWidth*0.05, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85)), textAlign: TextAlign.center,),
              Padding
              (padding: EdgeInsets.only(left: screenWidth*0.05, top:screenWidth*0.07), child:
                Row(
                  children: [
                    Container(
                      width: screenWidth*0.3,
                      child: Text('Hari', style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85))),
                      // Text("Hari"),
                    ),
                    Container(
                      width: screenWidth*0.25,
                      child: Text('Jam Buka', style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85))),
                      // Text("Jam Buka"),
                    ),
                    Container(
                      width: screenWidth*0.1,
                    ),
                    Container(
                      width: screenWidth*0.25,
                      child: Text('Jam Tutup', style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85))),
                      // Text("Jam Tutup"),
                    ),
                  ],
                )
              ),
              Padding
              (padding: EdgeInsets.only(left: screenWidth*0.05), child:
                Row(
                  children: [
                    Container(
                      width: screenWidth*0.3,
                      child: Text('Senin', style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85))),
                      // Text("Senin"),
                    ),
                    Container(
                      width: screenWidth*0.25,
                      child: TextField(
                        controller: bukasenin,
                      ),
                    ),
                    Container(
                      width: screenWidth*0.1,
                    ),
                    Container(
                      width: screenWidth*0.25,
                      child: TextFormField(
                        controller: tutupsenin,
                      ),
                    ),
                  ],
                )
              ),
              Padding
              (padding: EdgeInsets.only(left: screenWidth*0.05), child:
                Row(
                  children: [
                    Container(
                      width: screenWidth*0.3,
                      child: Text('Selasa', style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85))),
                      // Text("selasa"),
                    ),
                    Container(
                      width: screenWidth*0.25,
                      child: TextField(
                        controller: bukaselasa,
                      ),
                    ),
                    Container(
                      width: screenWidth*0.1,
                    ),
                    Container(
                      width: screenWidth*0.25,
                      child: TextFormField(
                        controller: tutupselasa,
                      ),
                    ),
                  ],
                )
              ),
              Padding
              (padding: EdgeInsets.only(left: screenWidth*0.05), child:
                Row(
                  children: [
                    Container(
                      width: screenWidth*0.3,
                      child: Text('Rabu', style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85))),
                      // Text("rabu"),
                    ),
                    Container(
                      width: screenWidth*0.25,
                      child: TextField(
                        controller: bukarabu,
                      ),
                    ),
                    Container(
                      width: screenWidth*0.1,
                    ),
                    Container(
                      width: screenWidth*0.25,
                      child: TextFormField(
                        controller: tutuprabu,
                      ),
                    ),
                  ],
                )
              ),
              Padding
              (padding: EdgeInsets.only(left: screenWidth*0.05), child:
                Row(
                  children: [
                    Container(
                      width: screenWidth*0.3,
                      child: Text('Kamis', style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85))),
                      // Text("kamis"),
                    ),
                    Container(
                      width: screenWidth*0.25,
                      child: TextField(
                        controller: bukakamis,
                      ),
                    ),
                    Container(
                      width: screenWidth*0.1,
                    ),
                    Container(
                      width: screenWidth*0.25,
                      child: TextFormField(
                        controller: tutupkamis,
                      ),
                    ),
                  ],
                )
              ),
              Padding
              (padding: EdgeInsets.only(left: screenWidth*0.05), child:
                Row(
                  children: [
                    Container(
                      width: screenWidth*0.3,
                      child: Text('Jumat', style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85))),
                      // Text("jumat"),
                    ),
                    Container(
                      width: screenWidth*0.25,
                      child: TextField(
                        controller: bukajumat,
                      ),
                    ),
                    Container(
                      width: screenWidth*0.1,
                    ),
                    Container(
                      width: screenWidth*0.25,
                      child: TextFormField(
                        controller: tutupjumat,
                      ),
                    ),
                  ],
                )
              ),
              Padding
              (padding: EdgeInsets.only(left: screenWidth*0.05), child:
                Row(
                  children: [
                    Container(
                      width: screenWidth*0.3,
                      child: Text('Sabtu', style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85))),
                      // Text("sabtu"),
                    ),
                    Container(
                      width: screenWidth*0.25,
                      child: TextField(
                        controller: bukasabtu,
                      ),
                    ),
                    Container(
                      width: screenWidth*0.1,
                    ),
                    Container(
                      width: screenWidth*0.25,
                      child: TextFormField(
                        controller: tutupsabtu,
                      ),
                    ),
                  ],
                )
              ),
              Padding
              (padding: EdgeInsets.only(left: screenWidth*0.05), child:
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: screenHeight*0.045),
                      width: screenWidth*0.3,
                      child: Text('Minggu', style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85))),
                      // Text("minggu"),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: screenHeight*0.045),
                      width: screenWidth*0.25,
                      child: TextField(
                        controller: bukaminggu,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: screenHeight*0.045),
                      width: screenWidth*0.1,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: screenHeight*0.045),
                      width: screenWidth*0.25,
                      child: TextFormField(
                        controller: tutupminggu,
                      ),
                    ),
                  ],
                )
              ),
              ElevatedButton(onPressed: ()
                {
                  jambkrs = 
                  { 
                    'senin': bukasenin.text, 
                    'selasa':bukaselasa.text, 
                    'rabu': bukarabu.text,
                    'kamis': bukakamis.text,
                    'jumat': bukajumat.text,
                    'sabtu': bukasabtu.text,
                    'minggu': bukaminggu.text
                  };
                  jamtprs = 
                  {
                    'senin': tutupsenin.text, 
                    'selasa':tutupselasa.text, 
                    'rabu': tutuprabu.text,
                    'kamis': tutupkamis.text,
                    'jumat': tutupjumat.text,
                    'sabtu': tutupsabtu.text,
                    'minggu': tutupminggu.text
                  };
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => layananRS(
                                                        rsiddd: rsid,
                                                        nott: notelp, 
                                                        latt: lat, 
                                                        longg: long, 
                                                        ugdd: dropdownUgd, 
                                                        igdd: dropdownIgd, 
                                                        pictt: imageFile,
                                                        jambkrs: jambkrs,
                                                        jamtprs: jamtprs,
                                                        alamatrsuu: alamatrsu               
                                                    )
                    ),
                  );
                  bukasenin.text = "";
                  bukaselasa.text = "";
                  bukarabu.text = "";
                  bukakamis.text = "";
                  bukajumat.text = "";
                  bukasabtu.text = "";
                  bukaminggu.text = "";

                  tutupsenin.text = "";
                  tutupselasa.text = "";
                  tutuprabu.text = "";
                  tutupkamis.text = "";
                  tutupjumat.text = "";
                  tutupsabtu.text = "";
                  tutupminggu.text = "";
                }, 
                child: Text("Selanjutnya"))
            ],
          ),
        ),
      ),
    );
  }
}