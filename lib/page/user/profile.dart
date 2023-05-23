import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projek_pbm/page/rs/signup%20rs.dart';
import 'package:projek_pbm/page/user/changeprofile.dart';
import 'package:projek_pbm/page/user/login.dart';
import 'package:projek_pbm/page/user/home.dart';


class ProfileUser extends StatefulWidget {
  const ProfileUser({ super.key });

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}


class _ProfileUserState extends State<ProfileUser> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    if (screenHeight<screenWidth) {
      screenHeight=MediaQuery.of(context).size.width;
      screenWidth=MediaQuery.of(context).size.height;
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 241, 233),
      body: SingleChildScrollView(child:Center(
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(), 
                                ),
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
                Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 60, 98, 85),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      width: screenWidth*0.85,
                      height: screenHeight*0.68,
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
                                  ),
                                )
                                  
                              ),
                              

                              Text("Nama"),
                              
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
                                          // height: screenHeight*0.03,
                                          decoration: BoxDecoration(
                                            color: Colors.lightGreen
                                          ),
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
                                          // height: screenHeight*0.03,
                                          decoration: BoxDecoration(
                                            color: Colors.lightGreen
                                          ),
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
                                          // height: screenHeight*0.03,
                                          decoration: BoxDecoration(
                                            color: Colors.lightGreen
                                          ),
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
                                          // height: screenHeight*0.03,
                                          decoration: BoxDecoration(
                                            color: Colors.lightGreen
                                          ),
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
                                          // height: screenHeight*0.03,
                                          decoration: BoxDecoration(
                                            color: Colors.lightGreen
                                          ),
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
                                          // height: screenHeight*0.03,
                                          decoration: BoxDecoration(
                                            color: Colors.lightGreen
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ),
                              Padding( padding: EdgeInsets.fromLTRB(0, screenHeight*0.01, 0, screenHeight*0.05),
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
                                          // height: screenHeight*0.03,
                                          decoration: BoxDecoration(
                                            color: Colors.lightGreen
                                          ),
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
                                              builder: (context) => ChangeProfileUser(), 
                                            ),
                                        );
                                      },
                                      child: Text("Edit", style:TextStyle(color: Color.fromARGB(255, 60, 98, 85), fontWeight: FontWeight.w900))
                                  ),
                              ),
                            ],
                          )
                      )
                    )
              ]
            )
          )
        )   
      )
    );
  }
}

