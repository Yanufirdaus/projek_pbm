import 'package:flutter/material.dart';
import 'package:projek_pbm/page/user/changepw.dart';
import 'package:projek_pbm/page/user/dashboard.dart';
import 'package:projek_pbm/page/user/login.dart';
import 'package:projek_pbm/page/user/pwdetail.dart';
import 'package:projek_pbm/page/user/signup.dart';
import 'package:projek_pbm/page/user/profile.dart';

class HomeRs extends StatefulWidget {
  const HomeRs({ super.key });
  @override
  State<HomeRs> createState() => _HomeRsState();
}



class _HomeRsState extends State<HomeRs>{

  int _selectedNavbar = 0;
  final tabs = [
    Text('ini halaman Rumah sakit ya cuy'),
    SignupPage(role: role,),
    ProfileUser()
  ];

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
      backgroundColor: Color.fromARGB(255, 246, 241, 233),

      body : tabs[_selectedNavbar],

      bottomNavigationBar: 
        Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: 
            Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(142, 0, 0, 0).withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 1),
                )
              ],
            ),
            child: Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: 
                      BottomNavigationBar(
                        type: BottomNavigationBarType.fixed,
                        backgroundColor: Color.fromARGB(255, 60, 98, 85),
                        items: const <BottomNavigationBarItem>[
                          BottomNavigationBarItem(
                            icon: Icon(Icons.home),
                            label: 'Home',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.assignment),
                            label: 'Pesanan',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.person),
                            label: 'Akun',
                          ),
                        ],
                        currentIndex: _selectedNavbar,
                        selectedFontSize: screenHeight*0.016,
                        unselectedFontSize: screenHeight*0.014,
                        selectedItemColor: Color.fromARGB(255, 198, 255, 154),
                        unselectedItemColor: Color.fromARGB(255, 234, 231, 177),
                        showUnselectedLabels: false,
                        onTap: _changeSelectedNavBar,
                      ),
              )
            ),
          ),
        )
        
        
    ) ;
  }
}