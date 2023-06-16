import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:projek_pbm/page/rs/home.dart';
import 'package:projek_pbm/page/user/changepw.dart';
import 'package:projek_pbm/page/user/home.dart';
import 'package:projek_pbm/page/user/signup.dart';

String name = "";
String emailp = "";
String nik = "";
String alamat = "";
String tempatL = "";
String tanggalL = "";
String gender = "";
String goldar = "";
String age = "";
String uidp ="";
String imagep ="";

String imager ="";
String alamatr = "";
String nomerrs = "";
Map<String, dynamic> jambuka = {};
Map<String, dynamic> jamtutup = {};
Map<String, dynamic> layananrusk = {};



class LoginPage extends StatefulWidget {
  const LoginPage({ super.key });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  // const LoginPage({super.key});

  // bool showProgress = false;
  bool isLoading = false;
  
  bool visible = false;

  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String email = '';
  String password =   '';
  String uid = '';

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
            Padding(padding: EdgeInsets.fromLTRB(20, screenHeight*0.1, 0, 20), 
                child:
                SizedBox(
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.2,
                  child: Image(image: AssetImage('assets/images/Group 24.png')),
                ),
            ),
            
            Text("MEDKIT", style: TextStyle(fontSize: screenHeight*0.09, fontWeight:FontWeight.bold, color: Color.fromARGB(255, 238, 255, 225))),

            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
              child: 
              Text("LOGIN", style: TextStyle(fontSize: screenHeight*0.025, fontWeight:FontWeight.normal, color: Color.fromARGB(255, 238, 255, 225))),
            ),
            
            SizedBox(
              width: screenWidth * 0.7,
              height: screenHeight * 0.03,
              child: Align(alignment: Alignment.centerLeft,
                child: Text("e-mail", style: TextStyle(color: Color.fromARGB(255, 238, 255, 225), fontWeight: FontWeight.normal),),
              ),
            ),
            
            SizedBox(
              width: screenWidth * 0.7,
              height: screenHeight * 0.08,
              child: 
                TextFormField(
                  controller: emailController,
                  onChanged: (val){
                    setState(() => email = val);
                  },
                  decoration: InputDecoration(
                    hintText: "e-mail",
                    filled: true,
                    fillColor: Color.fromARGB(255, 246, 241, 233),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))
                    ),
                  ),
                  validator: (value) {
                    if (value!.length == 0) {
                      return "Email cannot be empty";
                    }
                    else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    emailController.text = value!;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
            ),

            SizedBox(
              width: screenWidth * 0.7,
              height: screenHeight * 0.03,
              child: Align(alignment: Alignment.centerLeft,
                child: Text("password", style: TextStyle(color: Color.fromARGB(255, 238, 255, 225), fontWeight: FontWeight.normal),),
              ),
            ),

            SizedBox(
              width: screenWidth * 0.7,
              height: screenHeight * 0.08,
              child: TextFormField(
                controller: passwordController,
                  onChanged: (val){
                    setState(() => password = val);
                  },
                  decoration: InputDecoration(
                    hintText: "Password",
                    filled: true,
                    fillColor: Color.fromARGB(255, 246, 241, 233),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password cannot be empty";
                    }
                    else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    passwordController.text = value!;
                  },
                ),
            ),
            
            Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child : SizedBox(
              width: screenWidth * 0.7,
              height: screenHeight * 0.03,
              child: InkWell(
                child: Align(alignment: Alignment.centerLeft,
                  child :Text("Lupa password ?", style: TextStyle(fontWeight: FontWeight.w900, color: Color.fromARGB(255, 238, 255, 225)),), 
                    ),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangePw(), 
                          ),
                      );
                    }
                  ),
              ),
            ),
            
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
                      ),
                    ),
                    onPressed:(){
                      signIn(
                          emailController.text, passwordController.text);
                        
                    },
                    child: isLoading? 
                        LoadingAnimationWidget.staggeredDotsWave(
                          color: Color.fromARGB(255, 60, 98, 85),
                          size: screenHeight*0.04,
                        ) :
                        Text("Login", style:TextStyle(color: Color.fromARGB(255, 60, 98, 85), fontWeight: FontWeight.w900))
                ),
            ),

            Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Text("Belum memiliki akun ? ", style: TextStyle(color: Color.fromARGB(255, 238, 255, 225))),
                  ),
                  SizedBox(
                    child: InkWell(
                      child: Text("Signup", style: TextStyle(fontWeight: FontWeight.w900, color: Color.fromARGB(255, 238, 255, 225)),), 
                      onTap: (){
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignupPage(role: role,), 
                          ),
                        );
                      }
                    ),
                  )
                ],
              )
            ),

          ],)
        )
      ),
      )
    );
  }
  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance.collection('user').doc(user!.uid).get().then((DocumentSnapshot documentSnapshot) {
      // if (documentSnapshot.exists) {
        if (documentSnapshot.get('role') == "User") {
          uidp = user.uid;
          imagep = documentSnapshot.get('ProfileImage');
          name = documentSnapshot.get('names');
          emailp = documentSnapshot.get('email');
          nik = documentSnapshot.get('nik');
          alamat = documentSnapshot.get('alamat');
          tempatL = documentSnapshot.get('tempatL');
          tanggalL = documentSnapshot.get('tanggalL');
          gender = documentSnapshot.get('gender');
          goldar = documentSnapshot.get('goldar');
          age = documentSnapshot.get('usia');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  HomeUser( 
                imagep: imagep,
                uid : uidp,
                name : name, 
                emailp : emailp, 
                nik : nik,
                alamat : alamat,
                tempatL : tempatL,
                tanggalL : tanggalL,
                gender : gender,
                goldar : goldar,
                age : age,
              ),
            ),
          );

          // debugPrint(uid);
        }else{
          uidp = user.uid;
          name = documentSnapshot.get('names');
          emailp = documentSnapshot.get('email');
          imager = documentSnapshot.get('gambar');
          alamatr = documentSnapshot.get('alamat');
          nomerrs = documentSnapshot.get('no_telp');
          jambuka = documentSnapshot.get('jam_buka');
          jamtutup = documentSnapshot.get('jam_tutup');
          layananrusk = documentSnapshot.get('layanan');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeRs(
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
            ),
          );
        debugPrint(name);
        }
    });
  }

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
       setState(() {
        isLoading = true; 
      });
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
        );
        route();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('email yang anda masukkan tidak terdaftar'), backgroundColor: Colors.red)
          );
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Container(color: Colors.red, child: Text('password salah')), backgroundColor: Colors.red, ),
          );
        }
      }
      setState(() {
        isLoading = false;
      });
    }
  }
  
}