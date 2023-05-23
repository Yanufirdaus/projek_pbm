import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projek_pbm/page/rs/signup%20rs.dart';
import 'package:projek_pbm/page/user/home.dart';
import 'package:projek_pbm/page/user/login.dart';
import 'package:projek_pbm/page/user/signup.dart';
import 'package:projek_pbm/page/user/dashboard.dart';
import 'package:projek_pbm/page/user/changepw.dart';


class SeeArticlePage extends StatefulWidget {
  const SeeArticlePage({ super.key });

  @override
  State<SeeArticlePage> createState() => _SeeArticlePageState();
}

String dropdownValue = 'User';
class _SeeArticlePageState extends State<SeeArticlePage> {
  final tabs = [
      SeeArticlePage(),
      DashboardUser(),
      SignupPage(role: role,),
      ChangePw()
  ];

  int _selectedNavbar = 0;
  
  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 234, 231, 177),
      
      body: Column(children: <Widget>[ 
        Center(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: 
                  Container(
                    width: screenWidth,
                    margin: EdgeInsets.fromLTRB(0, screenHeight*0.1, 0, 0),
                    height: screenHeight*0.82,
                    alignment: Alignment.center,
                    child: 
                      Container(
                        width: screenWidth*0.85,
                        height: screenHeight*0.8,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 60, 98, 85),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: 
                          SingleChildScrollView(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    height: 40.0,
                                    alignment: Alignment.center,
                                    child: 
                                    Align(alignment: Alignment.topLeft,
                                      child: 
                                        InkWell(
                                          child: 
                                            Icon(
                                              Icons.arrow_back,
                                              color: Color.fromARGB(255, 234, 231, 177),
                                              size: 35.0,
                                            ),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                        )
                                    )
                                  ),

                                  Container(
                                    padding: EdgeInsets.fromLTRB(40, 30, 40, 30),
                                    alignment: Alignment.center,
                                    child: Text('''Lorem ipsum dolor sit amet, 
consectetur adipisicing elit, sed do 
eiusmod tempor incididunt ut labore et 
dolore magna aliqua. Ut enim ad minim veniam, 
quis nostrud exercitation ullamco 
laboris nisi ut aliquip ex ea commodo consequat. 
Duis aute irure dolor in reprehenderit in voluptate 
velit esse cillum dolore eu fugiat nulla pariatur. 
Excepteur sint occaecat cupidatat non proident, 
sunt in culpa qui officia deserunt mollit 
consectetur adipisicing elit, sed do 
eiusmod tempor incididunt ut labore et 
dolore magna aliqua. Ut enim ad minim veniam, 
quis nostrud exercitation ullamco 
laboris nisi ut aliquip ex ea commodo consequat. 
Duis aute irure dolor in reprehenderit in voluptate 
velit esse cillum dolore eu fugiat nulla pariatur. 
Excepteur sint occaecat cupidatat non proident, 
sunt in culpa qui officia deserunt mollit 
consectetur adipisicing elit, sed do 
eiusmod tempor incididunt ut labore et 
dolore magna aliqua. Ut enim ad minim veniam, 
quis nostrud exercitation ullamco 
laboris nisi ut aliquip ex ea commodo consequat. 
Duis aute irure dolor in reprehenderit in voluptate 
velit esse cillum dolore eu fugiat nulla pariatur. 
Excepteur sint occaecat cupidatat non proident, 
sunt in culpa qui officia deserunt mollit 
consectetur adipisicing elit, sed do 
eiusmod tempor incididunt ut labore et 
dolore magna aliqua. Ut enim ad minim veniam, 
quis nostrud exercitation ullamco 
laboris nisi ut aliquip ex ea commodo consequat. 
Duis aute irure dolor in reprehenderit in voluptate 
velit esse cillum dolore eu fugiat nulla pariatur. 
Excepteur sint occaecat cupidatat non proident, 
sunt in culpa qui officia deserunt mollit 
consectetur adipisicing elit, sed do 
eiusmod tempor incididunt ut labore et 
dolore magna aliqua. Ut enim ad minim veniam, 
quis nostrud exercitation ullamco 
laboris nisi ut aliquip ex ea commodo consequat. 
Duis aute irure dolor in reprehenderit in voluptate 
velit esse cillum dolore eu fugiat nulla pariatur. 
Excepteur sint occaecat cupidatat non proident, 
sunt in culpa qui officia deserunt mollit 
consectetur adipisicing elit, sed do 
eiusmod tempor incididunt ut labore et 
dolore magna aliqua. Ut enim ad minim veniam, 
quis nostrud exercitation ullamco 
laboris nisi ut aliquip ex ea commodo consequat. 
Duis aute irure dolor in reprehenderit in voluptate 
velit esse cillum dolore eu fugiat nulla pariatur. 
Excepteur sint occaecat cupidatat non proident, 
sunt in culpa qui officia deserunt mollit 
anim id est laborum''', style: TextStyle(color: Color.fromARGB(255, 234, 231, 177),fontSize: screenWidth*0.035),),
                                  ),
                                ],
                              ),
                                ),
                            )
                              
                      ),
                  )
              ),
              
          ],)
        )
      ),]
      ),
    // 
    );
  }
}

