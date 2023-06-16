import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projek_pbm/page/rs/identrs.dart';
import 'package:projek_pbm/page/user/login.dart';
import 'package:projek_pbm/page/user/signup.dart';

String rsid = '';

class SignupRs extends StatefulWidget {
  const SignupRs({ super.key, required String role });

  @override
  State<SignupRs> createState() => _SignupRsState();
}

String dropdownValue = 'User';
class _SignupRsState extends State<SignupRs> {

  bool showProgress = false;

  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpassController = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController emailController = TextEditingController();

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
      body: SingleChildScrollView(child:Center(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(20, screenHeight*0.03, 0, screenHeight*0.01), 
                child:
                SizedBox(
                  width: screenWidth * 0.3,
                  height: screenHeight * 0.2,
                  child: Image(image: AssetImage('assets/images/Group 24.png')),
                ),
            ),
            
            Text("MEDKIT", style: TextStyle(fontSize: screenHeight*0.08, fontWeight:FontWeight.bold, color: Color.fromARGB(255, 238, 255, 225))),

            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: 
              Text("REGISTER", style: TextStyle(fontSize: screenHeight*0.025, fontWeight:FontWeight.normal, color: Color.fromARGB(255, 238, 255, 225))),
            ),

            SizedBox(
              width: screenWidth * 0.7,
              height: screenHeight * 0.025,
              child: Align(alignment: Alignment.centerLeft,
                child: Text("e-mail", style: TextStyle(color: Color.fromARGB(255, 238, 255, 225), fontWeight: FontWeight.normal),),
              ),
            ),
            
            SizedBox(
              width: screenWidth * 0.7,
              height: screenHeight * 0.08,
              child: 
                TextFormField(
                  // validator: (value) {
                  //   if (confirmpassController.text.length < 6) {
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       SnackBar(content: Text('isi nama email')),
                  //     );
                  //     return null;
                  //     // return "Password minimal 6 karakter";
                  //   } else {
                      
                  //   }
                  // },
                  validator: (value) {
                    if (EmailValidator.validate(value!)) {
                      return null;
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('email tidak valid'), backgroundColor: Colors.red),
                      );
                      return "email tidak valid";
                      
                    }
                  },
                  controller: emailController,
                  style:
                    TextStyle(fontSize: screenWidth*0.04),
                  decoration: InputDecoration(
                    
                    hintText: "e-mail",
                    hintStyle: TextStyle(fontSize: screenWidth*0.04),
                    filled: true,
                    fillColor: Color.fromARGB(255, 246, 241, 233),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))
                    ),
                  ),
                ),
            ),

            SizedBox(
              width: screenWidth * 0.7,
              height: screenHeight * 0.025,
              child: Align(alignment: Alignment.centerLeft,
                child: Text("nama rumah sakit", style: TextStyle(color: Color.fromARGB(255, 238, 255, 225), fontWeight: FontWeight.normal),),
              ),
            ),

            SizedBox(
              width: screenWidth * 0.7,
              height: screenHeight * 0.08,
              child: TextFormField(
                validator: (value) {
                    if (confirmpassController.text.length < 6) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('isi nama pengguna')),
                      );
                      return null;
                      // return "Password minimal 6 karakter";
                    } else {
                      
                    }
                },
                controller: name,
                  decoration: InputDecoration(
                    hintText: "nama rumah sakit",
                    filled: true,
                    fillColor: Color.fromARGB(255, 246, 241, 233),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))
                    ),
                  ),
                ),
            ),

            SizedBox(
              width: screenWidth * 0.7,
              height: screenHeight * 0.025,
              child: Align(alignment: Alignment.centerLeft,
                child: Text("password", style: TextStyle(color: Color.fromARGB(255, 238, 255, 225), fontWeight: FontWeight.normal),),
              ),
            ),
            
            SizedBox(
              width: screenWidth * 0.7,
              height: screenHeight * 0.08,
              child: 
                TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (confirmpassController.text.length < 6) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Password minimal 6 karakter')),
                      );
                      return null;
                      // return "Password minimal 6 karakter";
                    } else {
                      
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "password",
                    filled: true,
                    fillColor: Color.fromARGB(255, 246, 241, 233),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))
                    ),
                  ),
                  obscureText: true,
                ),
            ),

            SizedBox(
              width: screenWidth * 0.7,
              height: screenHeight * 0.025,
              child: Align(alignment: Alignment.centerLeft,
                child: Text("confirm password", style: TextStyle(color: Color.fromARGB(255, 238, 255, 225), fontWeight: FontWeight.normal),),
              ),
            ),

            SizedBox(
              width: screenWidth * 0.7,
              height: screenHeight * 0.08,
              child: TextFormField(
                validator: (value) {
                  if (confirmpassController.text != passwordController.text) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Password tidak sama')),
                    );
                    return null;
                  } 
                  else {
                    
                  }
                },
                controller: confirmpassController,
                  decoration: InputDecoration(
                    hintText: "confirm password",
                    filled: true,
                    fillColor: Color.fromARGB(255, 246, 241, 233),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))
                    ),
                  ),
                  
                  obscureText: true,
                ),
            ),

            Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
              child :
              SizedBox(
                width: screenWidth * 0.3,
                height: screenHeight * 0.05,
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
                      )
                    ),
                    onPressed:(){
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(content: Text(role))
                        // );
                        setState(() {
                                  showProgress = true;
                        });
                        signUp(
                            emailController.text,
                            passwordController.text, role, 
                            name.text,"https://firebasestorage.googleapis.com/v0/b/nyoba-fbs.appspot.com/o/profileawal.jpg?alt=media&token=69b13ecf-ceca-4976-b032-a88d2d13d43a&_gl=1*zg5bdl*_ga*MTI0NjkzODE4My4xNjg0MzI4NTk1*_ga_CW55HF8NVT*MTY4NTc4NDgxMS4zMy4xLjE2ODU3ODY1MTcuMC4wLjA.",{},{},{},GeoPoint(0,0),"",false,false,false,"");
                    },
                    child: Text("Register", style:TextStyle(color: Color.fromARGB(255, 60, 98, 85), fontWeight: FontWeight.w900))
                  ),
              ),
            ),
            
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Text("Sudah memiliki akun ? ", style: TextStyle(color: Color.fromARGB(255, 238, 255, 225))),
                  ),
                  SizedBox(
                    child: InkWell(
                      child: Text("Login", style: TextStyle(fontWeight: FontWeight.w900, color: Color.fromARGB(255, 238, 255, 225)),), 
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(), 
                          ),
                        );
                      }
                    ),
                  )
                ],
              ),
              Text("")
          ],)
        )
      ),
      )
    );
  }

  void signUp(String email, String password, String role, String names, String gambar, Map<String, dynamic> jamBuka, Map<String, dynamic>jamTutup, Map<String, dynamic> layanan, GeoPoint lokasi, String notelp, bool status, bool igd, bool ugd, String alamatrs) async {
    CircularProgressIndicator();
    if (_formkey.currentState!.validate()) {
      if (emailController == null || name == null || passwordController == null || confirmpassController == null){
        ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Isi dengan lengkap terbelih dahulu'))
            );
            return null;
      }
      else if (passwordController.text != confirmpassController.text){
        ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Password tidak sama'))
            );
            return null;
      }
      else {
        (
          await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore(email, role, names, gambar, jamBuka, jamTutup, layanan, lokasi, notelp, status, igd, ugd, alamatrs)})
        );
      }
    }
  }

  postDetailsToFirestore(String email, String rool, String names, String gambar, Map<String, dynamic> jamBuka, Map<String, dynamic>jamTutup, Map<String, dynamic> layanan, GeoPoint lokasi, String notelp, bool status, bool igd, bool ugd, String alamatrs) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('user');
    rsid = ref.doc(user!.uid).id;
    ref.doc(user!.uid).set({'email': emailController.text, 'role': role, 'names': name.text, 'gambar': 'https://firebasestorage.googleapis.com/v0/b/nyoba-fbs.appspot.com/o/profileawal.jpg?alt=media&token=69b13ecf-ceca-4976-b032-a88d2d13d43a&_gl=1*zg5bdl*_ga*MTI0NjkzODE4My4xNjg0MzI4NTk1*_ga_CW55HF8NVT*MTY4NTc4NDgxMS4zMy4xLjE2ODU3ODY1MTcuMC4wLjA.', 'jam_buka': {}, 'jam_tutup': {}, 'layanan': {}, 'lokasi': GeoPoint(0,0), 'no_telp': '', 'status': false, 'igd': false, 'ugd': false, 'alamat':''});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => identRs(rsid: rsid)));
  }
}

