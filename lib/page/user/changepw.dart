import 'package:flutter/material.dart';
import 'package:projek_pbm/page/user/pwdetail.dart';
import 'package:projek_pbm/page/user/signup.dart';

class ChangePw extends StatefulWidget {
  const ChangePw({ super.key });

  @override
  State<ChangePw> createState() => _ChangePwState();
}

class _ChangePwState extends State<ChangePw>{

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

            Text("FORGET PASSWORD", style: TextStyle(fontSize: screenHeight*0.025, fontWeight:FontWeight.normal, color: Color.fromARGB(255, 238, 255, 225))),
         
            Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 10), child:
              SizedBox(
                width: screenWidth * 0.7,
                height: screenHeight * 0.03,
                child: Align(alignment: Alignment.centerLeft,
                  child: Text("e-mail", style: TextStyle(color: Color.fromARGB(255, 238, 255, 225), fontWeight: FontWeight.normal),),
                ),
              ),
            ),
            
            
            SizedBox(
              width: screenWidth * 0.7,
              height: screenHeight * 0.09,
              child: 
                TextField(
                  decoration: InputDecoration(
                    hintText: "e-mail",
                    filled: true,
                    fillColor: Color.fromARGB(255, 246, 241, 233),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                  ),
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
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PwDetail(), 
                          ),
                        );
                    },
                    child: Text("Reset", style:TextStyle(color: Color.fromARGB(255, 60, 98, 85), fontWeight: FontWeight.w900))
                  ),
              ),
            ),
          ],)
        )
      ),
      )
    );
  }
}