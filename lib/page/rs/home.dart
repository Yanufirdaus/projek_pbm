import 'package:flutter/material.dart';
import 'package:projek_pbm/page/rs/dashboardrs.dart';
import 'package:projek_pbm/page/rs/profilers.dart';
import 'package:projek_pbm/page/user/changepw.dart';
import 'package:projek_pbm/page/user/dashboard.dart';
import 'package:projek_pbm/page/user/home.dart';
import 'package:projek_pbm/page/user/login.dart';
import 'package:projek_pbm/page/user/pwdetail.dart';
import 'package:projek_pbm/page/user/signup.dart';
import 'package:projek_pbm/page/user/profile.dart';


int selectednavbars = 0;

class HomeRs extends StatefulWidget {
  const HomeRs({ super.key, required String emailp, required String name, required String uid, required String imager, required String alamatrsk, required String nomeres, required Map<String, dynamic> jambuka, required Map<String, dynamic> jamtutup, required Map<String, dynamic> layananrusk });
  @override
  State<HomeRs> createState() => _HomeRsState();
}



class _HomeRsState extends State<HomeRs>{

  final tabs = [
    DashboardRs(rsnames: name),
    ProfileRS(
              imagerusak: imager,
              uidrusak : uidp,
              namerusak : name, 
              emailrusak : emailp, 
              alamatrusak: alamatr,
              nomerrusak: nomerrs,
              jambukarusak: jambuka,
              jamtutuprusak: jamtutup,
              layananrusak: layananrusk,
              selectednavbars: selectednavbars
            )
  ];

  void _changeSelectedNavBar(int index) {
    setState(() {
      selectednavbars = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 241, 233),

      body : tabs[selectednavbars],

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
                          // BottomNavigationBarItem(
                          //   icon: Icon(Icons.assignment),
                          //   label: 'Pesanan',
                          // ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.person),
                            label: 'Akun',
                          ),
                        ],
                        currentIndex: selectednavbars,
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