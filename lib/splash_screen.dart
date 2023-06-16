import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projek_pbm/page/rs/home.dart';
import 'package:projek_pbm/page/user/home.dart';
import 'package:projek_pbm/page/user/login.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 7), () async {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null){
        var snapshot = await FirebaseFirestore.instance
          .collection('user')
          .doc(user.uid)
          .get();
        if (snapshot.exists) {
          var userData = snapshot.data()!;
          if(userData['role'] == 'User'){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeUser(
                                                        uid: uidp,
                                                        name: name, 
                                                        emailp : emailp, 
                                                        age: age, 
                                                        alamat: alamat, 
                                                        gender: gender, 
                                                        goldar: goldar, 
                                                        nik: nik, 
                                                        tanggalL: tanggalL, 
                                                        tempatL: tempatL,
                                                        imagep: imagep,
                                                      ),),
            );

          }else if(userData['role'] == 'Rumah Sakit'){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeRs(
                                                              imager: imager,
                                                              uid : uidp,
                                                              name : name, 
                                                              emailp : emailp, 
                                                              alamatrsk: alamatr,
                                                              nomeres: nomerrs,
                                                              jambuka: jambuka,
                                                              jamtutup: jamtutup,
                                                              layananrusk: layananrusk
                                                            ),
            ));
          }
        }
      }else{
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
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
      backgroundColor: Color.fromARGB(255, 60, 98, 85),
      body: SingleChildScrollView(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0,screenHeight*0.20, 0, 0),
              height: screenHeight,
              width: screenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/ss.png'),
                  fit: BoxFit.cover,
                ),
              ),
              
              child: 
              Column(children: [
                SizedBox(
                  width: screenWidth,
                  child: Center(child: 
                    Padding(padding: EdgeInsets.fromLTRB(20, screenHeight*0.1, 0, 20), 
                        child:
                        SizedBox(
                          width: screenWidth * 0.5,
                          height: screenHeight * 0.2,
                          child: Image(image: AssetImage('assets/images/Group 24.png')),
                        ),
                    ),),
                ),
                 SizedBox(
                  width: screenWidth,
                  child: Center(child: 
                  
                    Text("MEDKIT", style: TextStyle(fontSize: screenHeight*0.09, fontWeight:FontWeight.bold, color: Color.fromARGB(255, 238, 255, 225))),),
                ),
                Padding(padding: EdgeInsets.only(top: screenHeight*0.1),
                  child:
                    // CircularProgressIndicator(
                    //   color: Color.fromARGB(255, 68, 215, 255),
                    //   // value: 0.1
                    // ),
                    LoadingAnimationWidget.halfTriangleDot(
                          color: Color.fromARGB(255, 238, 255, 225),
                          size: screenHeight*0.05,
                        ),
                )
                 
              ],)
             
            ),
          ],
        ),
      ),)
    );
  }
}
