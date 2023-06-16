import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projek_pbm/page/rs/dashboardrs.dart';
import 'package:projek_pbm/page/rs/home.dart';
import 'package:projek_pbm/page/rs/identrs.dart';
import 'package:projek_pbm/page/rs/jamrs.dart';
import 'package:projek_pbm/page/rs/layananrs.dart';
import 'package:projek_pbm/page/rs/profilers.dart';
import 'package:projek_pbm/page/rs/qrscanner.dart';
import 'package:projek_pbm/page/user/bookingrs.dart';
import 'package:projek_pbm/page/user/carirs.dart';
import 'package:projek_pbm/page/user/detailrs.dart';
import 'package:projek_pbm/page/user/changepw.dart';
import 'package:projek_pbm/page/user/dashboard.dart';
import 'package:projek_pbm/page/user/home.dart';
import 'package:projek_pbm/page/user/login.dart';
import 'package:projek_pbm/page/user/profile.dart';
import 'package:projek_pbm/page/user/changeprofile.dart';
import 'package:projek_pbm/page/user/pwdetail.dart';
import 'package:projek_pbm/page/user/qrcode.dart';
import 'package:projek_pbm/page/user/seearticle.dart';
import 'package:projek_pbm/page/user/signup.dart';
import 'package:projek_pbm/page/user/signup user.dart';
import 'package:projek_pbm/page/rs/signup rs.dart';
import 'package:projek_pbm/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Medkit',
      theme: ThemeData(
        
      ),
      home: SplashScreen(),
      routes: {
        "/login": (context) => LoginPage(),
        "/signup": (context) => SignupPage(role: role,),
        "/signupuser": (context) => SignupUser(role: role,),
        "/signupsr": (context) => SignupRs(role: role,),
        "/changepw": (context) => ChangePw(),
        "/changepwdetail": (context) => PwDetail(),
        "/homeuser": (context) => HomeUser(
                                            uid: uidp,
                                            name: name, 
                                            emailp : emailp, 
                                            age: age, 
                                            alamat: alamat, 
                                            gender: gender, 
                                            goldar: goldar, 
                                            nik: nik, 
                                            tanggalL: tanggalL, 
                                            tempatL: tempatL,
                                            imagep: imagep,
                                          ),
        "/dashbuser": (context) => DashboardUser( uname: name, uuid: uidp, snb: selectednavbar),
        "/dashbrs": (context) => DashboardRs(rsnames: name,),
        "/seearticle": (context) => SeeArticlePage(judula: judul,contenta: content, gambara: gambara),
        "/profiluser": (context) => ProfileUser(  
                                                  uidd: uidp,
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
                                                ),
        "/changeprofiluser": (context) => ChangeProfileUser(
                                                              ipr : imageuser,
                                                              uiddd : uidp,
                                                              nameEP : usernameus, 
                                                              emailpEP : emailp, 
                                                              nikEP : nikuser,
                                                              alamatEP : alamatuser,
                                                              tempatLEP : tempatlahir,
                                                              tanggalLEP : tanggallahir,
                                                              genderEP : genderuser,
                                                              goldarEP : goldaruser,
                                                            ),
        "/homers": (context) => HomeRs(
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
        "/qrdisplay": (context) => QrDisplay(dokid: dokumenid),
        "/identrs": (context) => identRs(rsid: rsid),
        "/layananrs": (context) => layananRS(
                                                rsiddd: rsid,
                                                nott: notelp, 
                                                latt: lat, 
                                                longg: long, 
                                                ugdd: dropdownUgd, 
                                                igdd: dropdownIgd, 
                                                pictt: imageFile,
                                                jambkrs: jambkrs,
                                                jamtprs: jamtprs,
                                                alamatrsuu: alamatrsu,               
                                            ),
        "/jamrs": (context) => jamRs(not: notelp, lat: lat, long: long, ugd: dropdownUgd, igd: dropdownIgd, pict: imageFile, rsidd: rsid, alamatrsu: alamatrsu,),
        "/qrscan": (context) => QrScanner(psid: psid, stat: stat,),
        "/profilers": (context) => ProfileRS(
                                              imagerusak: imager,
                                              uidrusak : uidp,
                                              namerusak : name, 
                                              emailrusak : emailp, 
                                              alamatrusak: alamatr,
                                              nomerrusak: nomerrs,
                                              jambukarusak: jambuka,
                                              jamtutuprusak: jamtutup,
                                              layananrusak: layananrusk,
                                              selectednavbars: selectednavbars,
                                            ),
        "/carirs": (context) => CariRs(uname: name, uidd : uidp),
        "/bookrs": (context) => BookRs(namers: namers, accname: name, uidacc: uidp),
        "/detailrs": (context) => DetailRs(namers: namers, layananv: layanan, jambk: jambk, jamtp: jamtp, alamatrs: alamatrs, emailrs: emailrs, telp: telp, imagesrs: imagesrs),
      },
    );
  }
}