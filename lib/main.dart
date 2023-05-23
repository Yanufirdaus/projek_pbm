import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projek_pbm/page/rs/home.dart';
import 'package:projek_pbm/page/user/changepw.dart';
import 'package:projek_pbm/page/user/dashboard.dart';
import 'package:projek_pbm/page/user/home.dart';
import 'package:projek_pbm/page/user/login.dart';
import 'package:projek_pbm/page/user/profile.dart';
import 'package:projek_pbm/page/user/changeprofile.dart';
import 'package:projek_pbm/page/user/pwdetail.dart';
import 'package:projek_pbm/page/user/seearticle.dart';
import 'package:projek_pbm/page/user/signup.dart';
import 'package:projek_pbm/page/user/signup user.dart';
import 'package:projek_pbm/page/rs/signup rs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      theme: ThemeData(
        
      ),
      home: LoginPage(),
      routes: {
        "/login": (context) => LoginPage(),
        "/signup": (context) => SignupPage(role: role,),
        "/signupuser": (context) => SignupUser(role: role,),
        "/signupsr": (context) => SignupRs(role: role,),
        "/changepw": (context) => ChangePw(),
        "/changepwdetail": (context) => PwDetail(),
        "/homeuser": (context) => HomeUser(),
        "/dashbuser": (context) => DashboardUser(),
        "/seearticle": (context) => SeeArticlePage(),
        "/profiluser": (context) => ProfileUser(),
        "/changeprofiluser": (context) => ChangeProfileUser(),
        "/homers": (context) => HomeRs(),
      },
    );
  }
}