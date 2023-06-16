import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projek_pbm/page/rs/signup%20rs.dart';
import 'package:projek_pbm/page/user/home.dart';
import 'package:projek_pbm/page/user/login.dart';
import 'package:projek_pbm/page/user/signup.dart';
import 'package:projek_pbm/page/user/dashboard.dart';
import 'package:projek_pbm/page/user/changepw.dart';


class SeeArticlePage extends StatefulWidget {
  const SeeArticlePage({ super.key, required, required String judula, required String contenta, required String gambara  });

  @override
  State<SeeArticlePage> createState() => _SeeArticlePageState();
}

String dropdownValue = 'User';
class _SeeArticlePageState extends State<SeeArticlePage> {
  
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

                                  Column(children: [
                                    Container(
                                      padding: EdgeInsets.fromLTRB(40, 30, 40, 30),
                                      alignment: Alignment.center,
                                      child:
                                        Text(judul.toUpperCase(), textAlign: TextAlign.justify, style: TextStyle(color: Color.fromARGB(255, 234, 231, 177),fontSize: screenWidth*0.036, fontWeight: FontWeight.w900))
                                    ),
                                    Container(
                                      width: screenHeight*0.3,
                                      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(500)),
                                      child: AspectRatio(
                                        aspectRatio: 487 / 310,
                                            child: new Container(
                                              decoration: new BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                image: new DecorationImage(
                                                  fit: BoxFit.fitWidth,
                                                  alignment: FractionalOffset.topCenter,
                                                  image: new NetworkImage(gambara),
                                                )
                                              ),
                                            ),
                                          ),
                                    ),
                                    Container(
                                    padding: EdgeInsets.fromLTRB(40, 30, 40, 30),
                                    alignment: Alignment.center,
                                    child: Text(content, textAlign: TextAlign.justify ,style: TextStyle(color: Color.fromARGB(255, 234, 231, 177),fontSize: screenWidth*0.035),),
                                  )]),
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

