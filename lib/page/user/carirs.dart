import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:projek_pbm/page/user/bookingrs.dart';
import 'package:projek_pbm/page/user/detailrs.dart';
import 'package:intl/intl.dart';
import 'package:projek_pbm/page/user/login.dart';

String ugds = '';
String igds = '';
String now = "";
String status = "";
String namers = "";
String jambkn = "";
String jamtpn = "";
String alamatrs = "";
String emailrs = "";
String telp = "";
String imagesrs = "";
Map<String, dynamic> jambk = {};
Map<String, dynamic> layanan = {};
Map<String, dynamic> jamtp = {};
String searchQuery = '';
int openours = 0;
int closeours = 0;
DateTime day = DateTime.now();
String dateFormat = "";


class CariRs extends StatefulWidget {
  const CariRs({super.key, required String uname, required String uidd});

  @override
  State<CariRs> createState() => _CariRsState();
  
}



class _CariRsState extends State<CariRs> {
  final rsList = FirebaseFirestore.instance.collection('user').snapshots();
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    if (screenHeight<screenWidth) {
      screenHeight=MediaQuery.of(context).size.width;
      screenWidth=MediaQuery.of(context).size.height;
    }

    now = DateTime.now().toString().substring(11,16);
    
    
    debugPrint(dateFormat);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 241, 233),
      body: SingleChildScrollView(child:
        Column( children: <Widget>[
          Center(
          child: 
            Padding( padding: EdgeInsets.only(top: screenHeight*0.06),
              child:
              Container(
                width: screenWidth*0.95,
                height: screenHeight*0.3,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 60, 98, 85),
                  borderRadius: BorderRadius.circular(50)
                ),
                child: 
                  Center(
                    child:
                    Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: screenHeight*0.035),
                          width: screenWidth*0.85,
                          child:
                            Center(child:
                              Text("TICKETS", style: TextStyle(fontSize: screenWidth*0.1, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177))),
                            )
                        ),
                        
                        Container(
                          padding: EdgeInsets.only(top: screenHeight*0.1),
                          width: screenWidth*0.85,
                          child:
                            Center(child:
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: "cari rumah sakit",
                                  hintStyle: TextStyle(fontSize: screenHeight * 0.019),
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 246, 241, 233),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(50)),
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    searchQuery = value;
                                  });
                                },
                              )
                            )
                        )
                      ],
                    )
                  ),
              )
            ),
          ),
          Container(
            // height: screenHeight*0.5,
            child: Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child : 
                InkWell(
                  child: 
                    Container(
                      // color: Colors.black,
                      height: screenHeight*0.52,
                      width: screenWidth*0.95,
                      child: 
                        RefreshIndicator
                        ( 
                          onRefresh: () async {
                            
                          },
                          child:
                          StreamBuilder(
                          stream: rsList,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting){
                              return const Center(child: Text("loading..."));
                            }
                            var list = snapshot.data!.docs;
                            list.sort((a, b) =>
                                b['names'].compareTo(a['names']));
                            var rslist = list.where((user) => user['role'] == 'Rumah Sakit').toList();

                            
                            return ListView.builder(
                              itemCount: rslist.length,
                              itemBuilder: (context, index){
                                if (rslist[index]['names'].toString().toLowerCase().contains(searchQuery.toLowerCase())) {
                                  
                                  // debugPrint(layanan.toString());
                                   if (rslist[index]['ugd']==true){
                                      ugds = "Available";
                                    }
                                    else if (rslist[index]['ugd']==false){
                                      ugds = "Unavailable";
                                    }
                                    if (rslist[index]['igd']==true){
                                      igds = "Available";
                                    }
                                    else if (rslist[index]['igd']==false){
                                      igds = "Unavailable";
                                    }
                                    int nowours = int.parse(now.substring(0,2));
                                    // if(dateFormat == 'Saturday'){
                                    jambk = rslist[index]['jam_buka'];
                                    jamtp = rslist[index]['jam_tutup'];
                                    // }
                                    dateFormat = DateFormat('EEEE').format(day);
                                    if(dateFormat == 'Saturday'){
                                      jambkn = jambk['sabtu'];
                                      jamtpn = jamtp['sabtu'];
                                      closeours = int.parse(jamtpn.substring(0,2));
                                      openours = int.parse(jambkn.substring(0,2));
                                    }
                                    else if(dateFormat == 'Sunday'){
                                      jambkn = jambk['minggu'];
                                      jamtpn = jamtp['minggu'];
                                      closeours = int.parse(jamtpn.substring(0,2));
                                      openours = int.parse(jambkn.substring(0,2));
                                    }
                                    else if(dateFormat == 'Monday'){
                                      jambkn = jambk['senin'];
                                      jamtpn = jamtp['senin'];
                                      closeours = int.parse(jamtpn.substring(0,2));
                                      openours = int.parse(jambkn.substring(0,2));
                                    }
                                    else if(dateFormat == 'Tuesday'){
                                      jambkn = jambk['senin'];
                                      jamtpn = jamtp['senin'];
                                      closeours = int.parse(jamtpn.substring(0,2));
                                      openours = int.parse(jambkn.substring(0,2));
                                    }
                                    else if(dateFormat == 'Wednesday'){
                                      jambkn = jambk['senin'];
                                      jamtpn = jamtp['senin'];
                                      closeours = int.parse(jamtpn.substring(0,2));
                                      openours = int.parse(jambkn.substring(0,2));
                                    }
                                    else if(dateFormat == 'Thursday'){
                                      jambkn = jambk['senin'];
                                      jamtpn = jamtp['senin'];
                                      closeours = int.parse(jamtpn.substring(0,2));
                                      openours = int.parse(jambkn.substring(0,2));
                                    }
                                    else if(dateFormat == 'Friday'){
                                      jambkn = jambk['senin'];
                                      jamtpn = jamtp['senin'];
                                      closeours = int.parse(jamtpn.substring(0,2));
                                      openours = int.parse(jambkn.substring(0,2));
                                    }
                                    
                                    if(nowours >= closeours || nowours < openours){
                                      status = "tutup";
                                    }
                                    else if(nowours < closeours || nowours >= openours){
                                      status = "buka";
                                    }
                                    
                                    
                                    return 
                                        Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        child:
                                        Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromARGB(105, 0, 0, 0).withOpacity(0.2),
                                                spreadRadius: 2,
                                                blurRadius: 3,
                                                offset: Offset(0, 3), 
                                              ),
                                            ],
                                            borderRadius: BorderRadius.circular(10),
                                            color: Color.fromARGB(255, 166, 187, 141),
                                            
                                          ),
                                          width: screenWidth*0.2,
                                          height: screenHeight*0.17,
                                          child: 
                                            Row(children: <Widget> [
                                              Container(
                                                height: screenHeight*0.2,
                                                width: screenWidth*0.37,
                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(500)),
                                                child: 
                                                  Column(children: 
                                                    [
                                                      Padding(padding : EdgeInsets.all(screenHeight*0.01),
                                                        child: AspectRatio(
                                                        aspectRatio: 487 / 310,
                                                          child: new Container(
                                                            padding: EdgeInsets.all(screenHeight*0.1),
                                                            decoration: new BoxDecoration(
                                                              borderRadius: BorderRadius.circular(10),
                                                              image: new DecorationImage(
                                                                fit: BoxFit.fitWidth,
                                                                alignment: FractionalOffset.topCenter,
                                                                image: new NetworkImage(rslist[index]['gambar'].toString()),
                                                              )
                                                            ),
                                                          ),
                                                      )),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            margin: EdgeInsets.only(left: screenHeight*0.01),
                                                            width: screenWidth*0.15,
                                                            height: screenHeight*0.025,
                                                            child: 
                                                              ElevatedButton(onPressed: (){
                                                                namers = rslist[index]['names'];
                                                                imagesrs = rslist[index]['gambar'];
                                                                jambk = rslist[index]['jam_buka'];
                                                                jamtp = rslist[index]['jam_tutup'];
                                                                layanan = rslist[index]['layanan'];
                                                                alamatrs = rslist[index]['alamat'];
                                                                emailrs = rslist[index]['email'];
                                                                telp = rslist[index]['no_telp'];
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder: (context) => DetailRs(namers: namers, layananv: layanan, jambk: jambk, jamtp: jamtp, alamatrs: alamatrs, emailrs: emailrs, telp: telp, imagesrs: imagesrs), 
                                                                  ),
                                                                );
                                                              }, 
                                                                child: Text("Detail", style: TextStyle(fontSize: screenHeight*0.01)),
                                                              ),
                                                          ),
                                                        ],
                                                      )
                                                    ]
                                                  ),
                                              ),
                                              Column(children: [
                                                
                                                Row(children:
                                                  [
                                                    Container(
                                                      padding: EdgeInsets.only(bottom: screenWidth*0.007, top: screenWidth*0.015),
                                                      width: screenWidth*0.15,
                                                      child: Text("Nama",textAlign: TextAlign.left, style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700,color: Color.fromARGB(255, 60, 98, 85)),),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(bottom: screenWidth*0.007, top: screenWidth*0.015),
                                                      width: screenWidth*0.015,
                                                      child: Text(" : ", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700,color: Color.fromARGB(255, 60, 98, 85)),),
                                                    ),
                                                    Container(
                                                      width: screenWidth*0.35,
                                                      padding: EdgeInsets.only(left: screenWidth*0.025, bottom: screenWidth*0.007, top: screenWidth*0.015),
                                                      child: Text(rslist[index]['names'].toString().toUpperCase(), style: TextStyle(fontSize: screenHeight*0.012,color: Color.fromARGB(255, 60, 98, 85)),)
                                                    )
                                                  ]
                                                ),
                                                Row(children:
                                                  [
                                                    Container(
                                                      padding: EdgeInsets.only(bottom: screenWidth*0.007),
                                                      width: screenWidth*0.15,
                                                      child: Text("Alamat", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700,color: Color.fromARGB(255, 60, 98, 85)),),
                                                    ),
                                                    Container(
                                                      width: screenWidth*0.015,
                                                      child: Text(" : ", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700,color: Color.fromARGB(255, 60, 98, 85)),),
                                                    ),
                                                    Container(
                                                      width: screenWidth*0.35,
                                                      padding: EdgeInsets.fromLTRB(screenWidth*0.025, 0, 0, 0),
                                                      child: Text(rslist[index]['alamat'], style: TextStyle(fontSize: screenHeight*0.012,color: Color.fromARGB(255, 60, 98, 85))),
                                                    )
                                                  ]
                                                ),
                                                Row(children:
                                                  [
                                                    Container(
                                                      padding: EdgeInsets.only(bottom: screenWidth*0.007),
                                                      width: screenWidth*0.15,
                                                      child: Text("Jam Operasi", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700,color: Color.fromARGB(255, 60, 98, 85)),),
                                                    ),
                                                    Container(
                                                      width: screenWidth*0.015,
                                                      child: Text(" : ", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700,color: Color.fromARGB(255, 60, 98, 85)),),
                                                    ),
                                                    Container(
                                                      width: screenWidth*0.35,
                                                      padding: EdgeInsets.fromLTRB(screenWidth*0.025, 0, 0, 0),
                                                      child: Text(jambkn+' - '+jamtpn, style: TextStyle(fontSize: screenHeight*0.012,color: Color.fromARGB(255, 60, 98, 85))),
                                                    )
                                                  ]
                                                ),
                                                Row(children:
                                                  [
                                                    Container(
                                                      padding: EdgeInsets.only(bottom: screenWidth*0.007),
                                                      width: screenWidth*0.15,
                                                      child: Text("UGD", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700,color: Color.fromARGB(255, 60, 98, 85)),),
                                                    ),
                                                    Container(
                                                      width: screenWidth*0.015,
                                                      child: Text(" : ", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700,color: Color.fromARGB(255, 60, 98, 85)),),
                                                    ),
                                                    Container(
                                                      width: screenWidth*0.35,
                                                      padding: EdgeInsets.fromLTRB(screenWidth*0.025, 0, 0, 0),
                                                      child: Text(ugds, style: TextStyle(fontSize: screenHeight*0.012,color: Color.fromARGB(255, 60, 98, 85))),
                                                    )
                                                  ]
                                                ),
                                                Row(children:
                                                  [
                                                    Container(
                                                      padding: EdgeInsets.only(bottom: screenWidth*0.007),
                                                      width: screenWidth*0.15,
                                                      child: Text("IGD", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700,color: Color.fromARGB(255, 60, 98, 85)),),
                                                    ),
                                                    Container(
                                                      width: screenWidth*0.015,
                                                      child: Text(" : ", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700,color: Color.fromARGB(255, 60, 98, 85)),),
                                                    ),
                                                    Container(
                                                      width: screenWidth*0.35,
                                                      padding: EdgeInsets.fromLTRB(screenWidth*0.025, 0, 0, 0),
                                                      child: Text(igds, style: TextStyle(fontSize: screenHeight*0.012,color: Color.fromARGB(255, 60, 98, 85))),
                                                    )
                                                  ]
                                                ),
                                                Row(children:
                                                  [
                                                    Container(
                                                      padding: EdgeInsets.only(bottom: screenWidth*0.007),
                                                      width: screenWidth*0.15,
                                                      child: Text("Status", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700,color: Color.fromARGB(255, 60, 98, 85)),),
                                                    ),
                                                    Container(
                                                      width: screenWidth*0.015,
                                                      child: Text(" : ", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700,color: Color.fromARGB(255, 60, 98, 85)),),
                                                    ),
                                                    Container(
                                                      width: screenWidth*0.35,
                                                      padding: EdgeInsets.fromLTRB(screenWidth*0.025, 0, 0, 0),
                                                      child: Text(status, style: TextStyle(fontSize: screenHeight*0.012,color: Color.fromARGB(255, 60, 98, 85))),
                                                    )
                                                  ]
                                                ),
                                                SizedBox(
                                                  width: screenWidth*0.515,
                                                  child:
                                                    Container(
                                                      alignment: Alignment.bottomRight,
                                                      margin: EdgeInsets.only(top: screenHeight*0.015),
                                                      width: screenWidth*0.17,
                                                      height: screenHeight*0.025,
                                                      child: 
                                                        ElevatedButton(onPressed: (){
                                                          namers = rslist[index]['names'];
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => BookRs( namers: namers, accname: name, uidacc: uidp ), 
                                                            ),
                                                          );
                                                        }, 
                                                          child: Text("Register", style: TextStyle(fontSize: screenHeight*0.01),)
                                                        ),
                                                    )
                                                ),
                                              ]),
                                              
                                            ]
                                            ),
                                            
                                        )
                                      );
                                } else {
                                  return SizedBox(); 
                                }
                              }
                            );
                          }
                        ))
                    ),
                  onTap: () {
                  },
                )
              ),
          )
        ]
        )
      )
    );
  }
}