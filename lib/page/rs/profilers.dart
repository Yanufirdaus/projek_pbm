import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:projek_pbm/page/rs/home.dart';
import 'package:projek_pbm/page/user/carirs.dart';
import 'package:projek_pbm/page/user/login.dart';

class ProfileRS extends StatefulWidget {
  const ProfileRS({super.key, required String imagerusak, required String uidrusak, required String namerusak, required String emailrusak, required String alamatrusak, required String nomerrusak, required Map<String, dynamic> jambukarusak, required Map<String, dynamic> jamtutuprusak, required Map<String, dynamic> layananrusak, required int selectednavbars});

  @override
  State<ProfileRS> createState() => _ProfileRSState();
}

class _ProfileRSState extends State<ProfileRS> {

  late Future<Map<String, dynamic>> userdataFuture;

  @override
  void initState() {
    super.initState();
    userdataFuture = fetchUserData();
  }

  Future<Map<String, dynamic>> fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    Map<String, dynamic> userData = {};

    if (user != null) {
      var snapshot = await FirebaseFirestore.instance
          .collection('user')
          .doc(user.uid)
          .get();

      if (snapshot.exists) {
        userData = snapshot.data()!;
      }
    }

    return userData;
  }

  @override
  Widget build(BuildContext context) {
    
    void signOutUser() async{
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.signOut();
    }

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    if (screenHeight<screenWidth) {
      screenHeight=MediaQuery.of(context).size.width;
      screenWidth=MediaQuery.of(context).size.height;
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 241, 233),
      body:
        FutureBuilder<Map<String, dynamic>>(
            future: fetchUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                var userData = snapshot.data!;
                var username = userData['names'];
                var emailrumahsakit = userData['email'];
                var telponrumahsakit = userData['no_telp'];
                var alamatuser = userData['alamat'];
                var jambukars = userData['jam_buka'];
                var jamtutuprs = userData['jam_tutup'];
                var layananrsk = userData['layanan'];
                List<dynamic> valuesList = layananrsk.values.toList();
                // var genderuser = userData['gender'];
                // var goldaruser = userData['goldar'];
                // var usiauser = userData['usia'];

                return Center
            ( child:
              SingleChildScrollView(
                child: Column(
                  children: [Padding(padding: EdgeInsets.only(top: screenHeight*0.04),child:
                    Container(
                      width: screenWidth*0.9,
                      height: screenHeight*0.8,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 60, 98, 85),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: 
                        Column( children:
                          [
                          Padding(padding: EdgeInsets.only(top: screenHeight*0.015, bottom: screenHeight*0.015), 
                            child: Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              height: 40.0,
                              alignment: Alignment.center,
                              child: 
                              Align(alignment: Alignment.topRight,
                                child: 
                                  InkWell(
                                    child: 
                                      Icon(
                                        Icons.logout,
                                        color: Color.fromARGB(255, 234, 231, 177),
                                        size: 35.0,
                                      ),
                                      onTap: () {
                                        signOutUser();
                                        selectednavbars = 0;
                                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                                            return LoginPage();
                                        }), (r){
                                          return false;
                                        });
                                      },
                                  )
                              )
                          )),
                          Row(
                            children:
                              [
                                Container(
                                  // height: screenHeight*0.5,
                                  width: screenWidth*0.4,
                                  child:
                                    Padding(padding : EdgeInsets.all(screenHeight*0.01),
                                      child: 
                                      AspectRatio(
                                        aspectRatio: 487 / 310,
                                          child: new Container(
                                            padding: EdgeInsets.all(screenHeight*0.1),
                                            decoration: new BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              image: new DecorationImage(
                                                fit: BoxFit.fitWidth,
                                                alignment: FractionalOffset.topCenter,
                                                image: new NetworkImage(imager),
                                              )
                                            ),
                                          ),
                                      )
                                    )
                                ),
                                Column( children:
                                  [
                                    Container(
                                      // height: screenHeight*0.1,
                                      width: screenWidth*0.45,
                                      child: 
                                        Text(username.toUpperCase(), textAlign: TextAlign.left, style: TextStyle(fontSize: screenWidth*0.05, color: Color.fromARGB(255, 234, 231, 177), fontWeight: FontWeight.w900),),
                                    ),
                                    Container(
                                      // height: screenHeight*0.1,
                                      width: screenWidth*0.45,
                                      child: 
                                        Text(alamatuser, style: TextStyle(color: Color.fromARGB(255, 234, 231, 177)),)
                                    )
                                    
                                  ]
                                )
                            ]
                          ),
                          Column(
                            children:
                            [
                              Padding( padding:EdgeInsets.only(left: screenWidth*0.055, top: screenHeight*0.02), child:
                                Row(children:
                                  [
                                    Container(
                                      margin: EdgeInsets.only(right: screenWidth*0.015),
                                      width: screenWidth*0.25,
                                      height: screenHeight*0.1,
                                      // color: Color.fromARGB(255, 234, 231, 177),
                                      child: 
                                        Column(
                                          children: [
                                            Row(children: [
                                              Text("senin", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)),),
                                              Text(":  ", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177))),
                                              Text(jambukars['senin']+' - '+jamtutuprs['senin'], style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)))
                                            ]),
                                            Row(children: [
                                              Text("", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700),),
                                              Text("", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700)),
                                              Text('', style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700))
                                            ]),
                                            Row(children: [
                                              Text("selasa", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)),),
                                              Text(":  ", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177))),
                                              Text(jambukars['selasa']+' - '+jamtutuprs['selasa'], style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)))
                                            ]),
                                            Row(children: [
                                              Text("", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700),),
                                              Text("", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700)),
                                              Text('', style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700))
                                            ]),
                                            Row(children: [
                                              Text("rabu", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)),),
                                              Text(":  ", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177))),
                                              Text(jambukars['rabu']+' - '+jamtutuprs['rabu'], style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)))
                                            ]),
                                          ],
                                        )
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: screenWidth*0.015),
                                      width: screenWidth*0.25,
                                      height: screenHeight*0.1,
                                      // color: Color.fromARGB(255, 234, 231, 177),
                                      child: 
                                        Column(
                                          children: [
                                            Row(children: [
                                              Text("kamis", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)),),
                                              Text(":  ", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177))),
                                              Text(jambukars['kamis']+' - '+jamtutuprs['kamis'], style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)))
                                            ]),
                                            Row(children: [
                                              Text("", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700),),
                                              Text("", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700)),
                                              Text('', style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700))
                                            ]),
                                            Row(children: [
                                              Text("jum'at", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)),),
                                              Text(":  ", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177))),
                                              Text(jambukars['jumat']+' - '+jamtutuprs['jumat'], style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)))
                                            ]),
                                            Row(children: [
                                              Text("", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700),),
                                              Text("", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700)),
                                              Text('', style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700))
                                            ]),
                                            Row(children: [
                                              Text("sabtu", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)),),
                                              Text(":  ", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177))),
                                              Text(jambukars['sabtu']+' - '+jamtutuprs['sabtu'], style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)))
                                            ]),
                                          ],
                                        )
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: screenWidth*0.015),
                                      width: screenWidth*0.25,
                                      height: screenHeight*0.1,
                                      // color: Color.fromARGB(255, 234, 231, 177),
                                      child: 
                                        Column(
                                          children: [
                                            Row(children: [
                                              Text("minggu", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)),),
                                              Text(":  ", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177))),
                                              Text(jambukars['minggu']+' - '+jamtutuprs['minggu'], style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)))
                                            ]),
                                          ],
                                        )
                                    ),
                                  ],
                                )
                              )
                            ]
                          ),
                          Container(
                            width: screenWidth*0.5,
                            height: screenHeight*0.13,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 234, 231, 177)
                            ),
                            child:
                              Column(
                                children: [
                                  Container(margin: EdgeInsets.only(top: screenHeight*0.02) ,height: screenHeight*0.04,child:Text("Social", style: TextStyle(fontWeight: FontWeight.w700, fontSize: screenHeight*0.015, color: Color.fromARGB(255, 60, 98, 85))),),
                                  Text('Email  :  '+emailrumahsakit, style: TextStyle(fontWeight: FontWeight.w700, fontSize: screenHeight*0.015, color: Color.fromARGB(255, 60, 98, 85))),
                                  Text('Nomer Telpon  :  '+telponrumahsakit, style: TextStyle(fontWeight: FontWeight.w700, fontSize: screenHeight*0.015, color: Color.fromARGB(255, 60, 98, 85)))
                                ],
                              )
                              
                          ),
                          
                          SingleChildScrollView(
                            child:
                            Container(
                              margin: EdgeInsets.only(top: screenHeight * 0.02),
                              width: screenWidth * 0.5,
                              height: screenHeight * 0.27,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(255, 234, 231, 177),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: screenHeight*0.015),
                                    child:
                                    Text(
                                      'Layanan Unggulan:',
                                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: screenHeight*0.015, color: Color.fromARGB(255, 60, 98, 85))
                                    )
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: valuesList.length,
                                      itemBuilder: (context, index) {
                                        var value = valuesList[index];
                                        return Center(
                                          child:
                                          Container(
                                            padding: EdgeInsets.only(left: screenWidth*0.04, top: screenWidth*0.02),
                                            child:
                                            Row(
                                              children: [
                                                Container(
                                                  width: screenWidth*0.17,
                                                  child:
                                                    Text('Layanan '+(index+1).toString()+' : ', style: TextStyle(fontWeight: FontWeight.w700, fontSize: screenHeight*0.015, color: Color.fromARGB(255, 60, 98, 85)), textAlign: TextAlign.justify,)
                                                ),
                                                Container(
                                                  width: screenWidth*0.25,
                                                  child:
                                                    Text(value.toString(), style: TextStyle(fontWeight: FontWeight.w700, fontSize: screenHeight*0.015, color: Color.fromARGB(255, 60, 98, 85)), textAlign: TextAlign.justify,)
                                                )
                                              ],
                                            )
                                          )
                                            
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                              
                          )
                          
                          // Text(layanant)
                        ]),
                    )),
                  ],
                ),
              )
            );}
          }
        )
    ) ;;
  }
}