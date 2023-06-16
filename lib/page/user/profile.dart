import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projek_pbm/page/rs/signup%20rs.dart';
import 'package:projek_pbm/page/user/changeprofile.dart';
import 'package:projek_pbm/page/user/login.dart';
import 'package:projek_pbm/page/user/home.dart';

String? userId = '';
String? namarumahsakit = '';

var usernameus = '';
var nikuser = '';
var alamatuser = '';
var tempatlahir = '';
var tanggallahir = '';
var genderuser = '';
var goldaruser = '';
var imageuser = '';


class ProfileUser extends StatefulWidget {
  const ProfileUser({ super.key, required String uname, required String emailP, required String agep, required String alamatp, required String genderp, required String goldarp, required String nikp, required String tanggalLp, required String tempatLp, required String uidd, required String imagepr, required int selnav });

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}




class _ProfileUserState extends State<ProfileUser> {
  


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
    debugPrint(uidp);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    if (screenHeight<screenWidth) {
      screenHeight=MediaQuery.of(context).size.width;
      screenWidth=MediaQuery.of(context).size.height;
    }
    
    void signOutUser() async{
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.signOut();
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color.fromARGB(255, 246, 241, 233),
      body: FutureBuilder<Map<String, dynamic>>(
            future: fetchUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                var userData = snapshot.data!;
                usernameus = userData['names'];
                var email = userData['email'];
                nikuser = userData['nik'];
                alamatuser = userData['alamat'];
                tempatlahir = userData['tempatL'];
                tanggallahir = userData['tanggalL'];
                genderuser = userData['gender'];
                goldaruser = userData['goldar'];
                var usiauser = userData['usia'];
                imageuser = userData['ProfileImage'];

                return SingleChildScrollView(child:Center(
            child: Form(
              child: Column(
                
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: 
                  <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0, screenHeight*0.05, screenWidth*0.065, 0),
                      width: screenWidth*1,
                      child: 
                        Align(alignment: Alignment.centerRight,
                          child: 
                            InkWell(
                              child: 
                                Icon(
                                  Icons.logout,
                                  color: Color.fromARGB(255, 60, 98, 85),
                                  size: 35.0,
                                ),
                                onTap: () {
                                  signOutUser();
                                  selectednavbar = 0;
                                  
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
                                  );
                                },
                            )
                        )
                      ),
                    
                    Padding(padding: EdgeInsets.fromLTRB(0, screenHeight*0.001, 0, screenHeight*0.015),
                      child: 
                        Container(
                          child: Text("PROFILE", style: TextStyle(fontSize: screenWidth*0.15, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 60, 98, 85),),),
                        ),
                    ),
                    SingleChildScrollView(child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 60, 98, 85),
                            borderRadius: BorderRadius.circular(15)
                          ),
                          width: screenWidth*0.85,
                          height: screenHeight*0.7,
                          child: 
                          Padding(padding: EdgeInsets.fromLTRB(0, screenHeight*0.03, 0, screenHeight*0.03),
                            child: 
                              Column(
                                children: <Widget>[
                                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, screenHeight*0.03),
                                    child: 
                                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, screenHeight*0.02),
                                      child: 
                                        Container(
                                        width: screenHeight*0.15,
                                        height: screenHeight*0.15,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(500),
                                          color: Colors.black,
                                        ),
                                        child: 
                                          ClipRRect(
                                                borderRadius: BorderRadius.circular(500),
                                                child: Image.network(
                                                  imageuser,
                                                  fit: BoxFit.cover,
                                                  width: screenHeight * 0.15,
                                                  height: screenHeight * 0.15,
                                                ),
                                              ),
                                      ),
                                    )
                                      
                                  ),
                                  

                                  Text(usernameus.toUpperCase(), style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)),),
                                  
                                  Padding( padding: EdgeInsets.fromLTRB(0, screenHeight*0.03, 0, 0),
                                    child:Column(
                                      children: <Widget>[
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              width: screenWidth*0.29,
                                              // height: screenHeight*0.03,
                                              decoration: BoxDecoration(
                                                // color: Colors.lightBlue
                                              ),
                                              child: Text("Email", style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                            ),
                                            Container(
                                              width: screenWidth*0.01,
                                              // height: screenHeight*0.03,
                                              decoration: BoxDecoration(
                                                // color: Colors.limeAccent
                                              ),
                                              child: Text(":", style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                            ),
                                            Container(
                                              width: screenWidth*0.4,
                                              padding: EdgeInsets.fromLTRB(screenWidth*0.025, 0, 0, 0),
                                              // height: screenHeight*0.03,
                                              decoration: BoxDecoration(
                                                // color: Colors.lightGreen
                                              ),
                                              child: Text(email, style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ),
                                  Padding( padding: EdgeInsets.fromLTRB(0, screenHeight*0.01, 0, 0),
                                    child:Column(
                                      children: <Widget>[
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              width: screenWidth*0.29,
                                              // height: screenHeight*0.03,
                                              decoration: BoxDecoration(
                                                // color: Colors.lightBlue
                                              ),
                                              child: Text("NIK", style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                            ),
                                            Container(
                                              width: screenWidth*0.01,
                                              // height: screenHeight*0.03,
                                              decoration: BoxDecoration(
                                                // color: Colors.limeAccent
                                              ),
                                              child: Text(":", style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                            ),
                                            Container(
                                              width: screenWidth*0.4,
                                              padding: EdgeInsets.fromLTRB(screenWidth*0.025, 0, 0, 0),
                                              // height: screenHeight*0.03,
                                              decoration: BoxDecoration(
                                                // color: Colors.lightGreen
                                              ),
                                              child: Text(nikuser, style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ),
                                  Padding( padding: EdgeInsets.fromLTRB(0, screenHeight*0.01, 0, 0),
                                    child:Column(
                                      children: <Widget>[
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              width: screenWidth*0.29,
                                              // height: screenHeight*0.03,
                                              decoration: BoxDecoration(
                                                // color: Colors.lightBlue
                                              ),
                                              child: Text("Alamat", style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                            ),
                                            Container(
                                              width: screenWidth*0.01,
                                              // height: screenHeight*0.03,
                                              decoration: BoxDecoration(
                                                // color: Colors.limeAccent
                                              ),
                                              child: Text(":", style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                            ),
                                            Container(
                                              width: screenWidth*0.4,
                                              padding: EdgeInsets.fromLTRB(screenWidth*0.025, 0, 0, 0),
                                              // height: screenHeight*0.03,
                                              decoration: BoxDecoration(
                                                // color: Colors.lightGreen
                                              ),
                                              child: Text(alamatuser, style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ),
                                  Padding( padding: EdgeInsets.fromLTRB(0, screenHeight*0.01, 0, 0),
                                    child:Column(
                                      children: <Widget>[
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              width: screenWidth*0.29,
                                              // height: screenHeight*0.03,
                                              decoration: BoxDecoration(
                                                // color: Colors.lightBlue
                                              ),
                                              child: Text("Tempat,Tanggal lahir", style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                            ),
                                            Container(
                                              width: screenWidth*0.01,
                                              // height: screenHeight*0.03,
                                              decoration: BoxDecoration(
                                                // color: Colors.limeAccent
                                              ),
                                              child: Text(":", style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                            ),
                                            Container(
                                              width: screenWidth*0.4,
                                              padding: EdgeInsets.fromLTRB(screenWidth*0.025, 0, 0, 0),
                                              // height: screenHeight*0.03,
                                              decoration: BoxDecoration(
                                                // color: Colors.lightGreen
                                              ),
                                              child: Text(tempatlahir+", "+tanggallahir, style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ),
                                  Padding( padding: EdgeInsets.fromLTRB(0, screenHeight*0.01, 0, 0),
                                    child:Column(
                                      children: <Widget>[
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              width: screenWidth*0.29,
                                              // height: screenHeight*0.03,
                                              decoration: BoxDecoration(
                                                // color: Colors.lightBlue
                                              ),
                                              child: Text("Gender", style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                            ),
                                            Container(
                                              width: screenWidth*0.01,
                                              // height: screenHeight*0.03,
                                              decoration: BoxDecoration(
                                                // color: Colors.limeAccent
                                              ),
                                              child: Text(":", style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                            ),
                                            Container(
                                              width: screenWidth*0.4,
                                              padding: EdgeInsets.fromLTRB(screenWidth*0.025, 0, 0, 0),
                                              // height: screenHeight*0.03,
                                              decoration: BoxDecoration(
                                                // color: Colors.lightGreen
                                              ),
                                              child: Text(genderuser, style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ),
                                  Padding( padding: EdgeInsets.fromLTRB(0, screenHeight*0.01, 0, 0),
                                    child:Column(
                                      children: <Widget>[
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              width: screenWidth*0.29,
                                              // height: screenHeight*0.03,
                                              decoration: BoxDecoration(
                                                // color: Colors.lightBlue
                                              ),
                                              child: Text("Golongan Darah", style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                            ),
                                            Container(
                                              width: screenWidth*0.01,
                                              // height: screenHeight*0.03,
                                              decoration: BoxDecoration(
                                                // color: Colors.limeAccent
                                              ),
                                              child: Text(":", style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                            ),
                                            Container(
                                              width: screenWidth*0.4,
                                              padding: EdgeInsets.fromLTRB(screenWidth*0.025, 0, 0, 0),
                                              // height: screenHeight*0.03,
                                              decoration: BoxDecoration(
                                                // color: Colors.lightGreen
                                              ),
                                              child: Text(goldaruser, style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ),
                                  Padding( padding: EdgeInsets.fromLTRB(0, screenHeight*0.01, 0, screenHeight*0.03),
                                    child:Column(
                                      children: <Widget>[
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              width: screenWidth*0.29,
                                              // height: screenHeight*0.03,
                                              decoration: BoxDecoration(
                                                // color: Colors.lightBlue
                                              ),
                                              child: Text("Usia", style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                            ),
                                            Container(
                                              width: screenWidth*0.01,
                                              // height: screenHeight*0.03,
                                              decoration: BoxDecoration(
                                                // color: Colors.limeAccent
                                              ),
                                              child: Text(":", style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                            ),
                                            Container(
                                              width: screenWidth*0.4,
                                              padding: EdgeInsets.fromLTRB(screenWidth*0.025, 0, 0, 0),
                                              // height: screenHeight*0.03,
                                              decoration: BoxDecoration(
                                                // color: Colors.lightGreen
                                              ),
                                              child: Text(usiauser, style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.2,
                                    height: screenHeight * 0.04,
                                    child: ElevatedButton(
                                    style: ButtonStyle(
                                            overlayColor: MaterialStateProperty.resolveWith<Color?>(
                                              (Set<MaterialState> states) {
                                                if (states.contains(MaterialState.pressed))
                                                  return Color.fromARGB(138, 60, 98, 85); 
                                              },
                                            ),
                                            backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 234, 231, 177)),
                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5.0),
                                                  )
                                            ),
                                          ),
                                          onPressed:(){
                                              Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => ChangeProfileUser(
                                                                                            ipr : imageuser,
                                                                                            uiddd : uidp,
                                                                                            nameEP : usernameus, 
                                                                                            emailpEP : emailp, 
                                                                                            nikEP : nikuser,
                                                                                            alamatEP : alamatuser,
                                                                                            tempatLEP : tempatlahir,
                                                                                            tanggalLEP : tanggallahir,
                                                                                            genderEP : genderuser,
                                                                                            goldarEP : goldaruser,
                                                                                          ), 
                                                ),
                                            );
                                            
                                          },
                                          child: Text("Edit", style:TextStyle(color: Color.fromARGB(255, 60, 98, 85), fontWeight: FontWeight.w900))
                                      ),
                                  ),
                                ],
                              )
                          )
                        ))
                  ]
                )
              )
            )   
          );}
        }
      )
    );
  }
}

