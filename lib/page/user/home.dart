import 'package:flutter/material.dart';
import 'package:projek_pbm/page/user/carirs.dart';
import 'package:projek_pbm/page/user/changepw.dart';
import 'package:projek_pbm/page/user/dashboard.dart';
import 'package:projek_pbm/page/user/login.dart';
import 'package:projek_pbm/page/user/pwdetail.dart';
import 'package:projek_pbm/page/user/signup.dart';
import 'package:projek_pbm/page/user/profile.dart';


int selectednavbar = 0;

class HomeUser extends StatefulWidget {
  const HomeUser({ super.key, required String name, required String emailp, required String nik, required String alamat, required String tanggalL, required String tempatL, required String gender, required String goldar, required String age, required String uid, required String imagep});
  @override
  State<HomeUser> createState() => _HomeUserState();
}

// String userName = name;


class _HomeUserState extends State<HomeUser>{

  
  final tabs = [
    DashboardUser( uname : name, uuid: uidp, snb: selectednavbar),
    CariRs( uname : name, uidd : uidp, ),
    ProfileUser( 
      uidd : uidp,
      uname: name, 
      emailP : emailp,
      agep: age, 
      alamatp: alamat, 
      genderp: gender, 
      goldarp: goldar, 
      nikp: nik, 
      tanggalLp: tanggalL, 
      tempatLp: tempatL,
      imagepr: imagep,
      selnav: selectednavbar,
    )
  ];
  

  void _changeSelectedNavBar(int index) {
    setState(() {
      selectednavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 241, 233),

      body : tabs[selectednavbar],

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
                        currentIndex: selectednavbar,
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