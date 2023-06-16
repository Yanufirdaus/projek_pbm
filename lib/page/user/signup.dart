import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projek_pbm/page/rs/signup%20rs.dart';
import 'package:projek_pbm/page/user/login.dart';
import 'package:projek_pbm/page/user/signup%20user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String role = '';


class SignupPage extends StatefulWidget {
  const SignupPage({ super.key, required String role});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

String dropdownValue = 'User';
class _SignupPageState extends State<SignupPage> {

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

            Text("REGISTER", style: TextStyle(fontSize: screenHeight*0.025, fontWeight:FontWeight.normal, color: Color.fromARGB(255, 238, 255, 225))),

            Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 10), child:
              SizedBox(
                width: screenWidth * 0.7,
                height: screenHeight * 0.03,
                child: Align(alignment: Alignment.centerLeft,
                  child: Text("Roles", style: TextStyle(color: Color.fromARGB(255, 238, 255, 225), fontWeight: FontWeight.normal),),
                ),
              ),
            ),
            
            
            SizedBox(
              width: screenWidth * 0.7,
              height: screenHeight * 0.09,
              child: 
                DropdownButtonFormField<String>(
                  iconEnabledColor: Color.fromARGB(255, 60, 98, 85), 
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 246, 241, 233),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    hintText: "Select"
                  ),
                  value: dropdownValue,
                  items: <String>['User', 'Rumah Sakit']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                      value: value ,
                      child: Text(
                        value, style: TextStyle(fontWeight: FontWeight.w700, color: Color.fromARGB(255, 60, 98, 85)),
                      ),
                    );
                  }).toList(), 
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                ),
            ),
            
            Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
              child: SizedBox(
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
                        if (dropdownValue == "User")[
                          role = dropdownValue,
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupUser(role: role), 
                            ),
                          ),
                        ];
                        else if (dropdownValue == "Rumah Sakit")[
                          role = dropdownValue,
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupRs(role: role), 
                            ),
                          )
                        ];
                    },
                    child: Text("Lanjut", style:TextStyle(color: Color.fromARGB(255, 60, 98, 85), fontWeight: FontWeight.w900))
                  ),
              ),
            ),

            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Text("Kembail ke ", style: TextStyle(color: Color.fromARGB(255, 238, 255, 225))),
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
}

