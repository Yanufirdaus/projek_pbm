import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projek_pbm/page/user/login.dart';
import 'package:projek_pbm/page/user/signup.dart';
import 'package:email_validator/email_validator.dart';


class SignupUser extends StatefulWidget {
  const SignupUser({ super.key, required String role });

  @override
  State<SignupUser> createState() => _SignupUserState();
}

String dropdownValue = 'User';
class _SignupUserState extends State<SignupUser> {

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
                child: Text("nama", style: TextStyle(color: Color.fromARGB(255, 238, 255, 225), fontWeight: FontWeight.normal),),
              ),
            ),

            SizedBox(
              width: screenWidth * 0.7,
              height: screenHeight * 0.08,
              child: TextFormField(
                validator: (value) {
                    if (confirmpassController.text.length < 6) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('isi nama pengguna'), backgroundColor: Colors.red),
                      );
                      return null;
                      // return "Password minimal 6 karakter";
                    } else {
                      
                    }
                },
                controller: name,
                  decoration: InputDecoration(
                    hintText: "nama",
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
                        SnackBar(content: Text('Password minimal 6 karakter'), backgroundColor: Colors.red),
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
                        SnackBar(content: Text('Password tidak sama'), backgroundColor: Colors.red),
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
                            name.text,"","","","","","","","https://firebasestorage.googleapis.com/v0/b/nyoba-fbs.appspot.com/o/profileawal.jpg?alt=media&token=69b13ecf-ceca-4976-b032-a88d2d13d43a&_gl=1*zg5bdl*_ga*MTI0NjkzODE4My4xNjg0MzI4NTk1*_ga_CW55HF8NVT*MTY4NTc4NDgxMS4zMy4xLjE2ODU3ODY1MTcuMC4wLjA.");
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

  void signUp(String email, String password, String role, String names, String nik, String alamat, String tempatL, String tanggalL, String gender, String goldar,  String usia, String ProfileImage) async {
    CircularProgressIndicator();
    if (_formkey.currentState!.validate()) {
      if (emailController.text == '' || name.text == "" || passwordController.text == "" || confirmpassController.text == ""){
        ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Isi dengan lengkap terbelih dahulu'), backgroundColor: Colors.red)
            );
            return null;
      }
      else if (passwordController.text != confirmpassController.text){
        ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Password tidak sama'), backgroundColor: Colors.red)
            );
            return null;
      }
      else {
        (
          await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore(email, role, names, nik, alamat, tempatL, tanggalL, gender, goldar, usia, ProfileImage)})
        );
      }
    }
  }

  postDetailsToFirestore(String email, String rool, String names, String nik, String alamat, String tempatL, String tanggalL, String gender, String goldar,  String usia, String ProfileImage) async { 
    
    var user = _auth.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('user');
    ref.doc(user!.uid).set({'email': emailController.text, 'role': role, 'names' : name.text, 'nik': "", 'alamat': "", 'tempatL': "", 'tanggalL': "", 'gender': "", 'goldar': "", 'usia': "", 'ProfileImage': "https://firebasestorage.googleapis.com/v0/b/nyoba-fbs.appspot.com/o/profileawal.jpg?alt=media&token=69b13ecf-ceca-4976-b032-a88d2d13d43a&_gl=1*zg5bdl*_ga*MTI0NjkzODE4My4xNjg0MzI4NTk1*_ga_CW55HF8NVT*MTY4NTc4NDgxMS4zMy4xLjE2ODU3ODY1MTcuMC4wLjA."});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
