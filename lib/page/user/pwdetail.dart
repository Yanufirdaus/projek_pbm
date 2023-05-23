import 'package:flutter/material.dart';
import 'package:projek_pbm/page/user/changepw.dart';
import 'package:projek_pbm/page/user/login.dart';
import 'package:projek_pbm/page/user/signup.dart';

class PwDetail extends StatefulWidget {
  const PwDetail({ super.key });

  @override
  State<PwDetail> createState() => _PwDetailState();
}

class _PwDetailState extends State<PwDetail>{

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

            Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: 
                Text("NEW PASSWORD", style: TextStyle(fontSize: screenHeight*0.025, fontWeight:FontWeight.normal, color: Color.fromARGB(255, 238, 255, 225))),

            ),
            
            SizedBox(
              width: screenWidth * 0.7,
              height: screenHeight * 0.04,
              child: Align(alignment: Alignment.centerLeft,
                child: Text("password", style: TextStyle(color: Color.fromARGB(255, 238, 255, 225), fontWeight: FontWeight.normal),),
              ),
            ),
            
            SizedBox(
              width: screenWidth * 0.7,
              height: screenHeight * 0.08,
              child: 
                TextField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    filled: true,
                    fillColor: Color.fromARGB(255, 246, 241, 233),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                  ),
                ),
            ),

            SizedBox(
              width: screenWidth * 0.7,
              height: screenHeight * 0.04,
              child: Align(alignment: Alignment.centerLeft,
                child: Text("confirm password", style: TextStyle(color: Color.fromARGB(255, 238, 255, 225), fontWeight: FontWeight.normal),),
              ),
            ),

            Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: SizedBox(
                width: screenWidth * 0.7,
                height: screenHeight * 0.08,
                child: TextField(
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      filled: true,
                      fillColor: Color.fromARGB(255, 246, 241, 233),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                    ),
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
                        ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('pw diubah'))
                          );
                    },
                    child: Text("Change", style:TextStyle(color: Color.fromARGB(255, 60, 98, 85), fontWeight: FontWeight.w900))
                ),
            ),

            Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Text("Kembali ke ", style: TextStyle(color: Color.fromARGB(255, 238, 255, 225))),
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
              )
            ),
          ],)
        )
      ),
      )
    );
  }
}