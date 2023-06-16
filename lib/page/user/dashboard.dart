import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projek_pbm/page/user/changepw.dart';
import 'package:projek_pbm/page/user/home.dart';
import 'package:projek_pbm/page/user/login.dart';
import 'package:projek_pbm/page/user/profile.dart';
import 'package:projek_pbm/page/user/pwdetail.dart';
import 'package:projek_pbm/page/user/seearticle.dart';
import 'package:projek_pbm/page/user/signup.dart';
import 'package:projek_pbm/services/api_servies.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../model/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

String judul = "";
String content = "";
String gambara = "";

class DashboardUser extends StatefulWidget {
  const DashboardUser({Key? key, required String uname, required String uuid, required int snb, }) : super(key: key);

  @override
  State<DashboardUser> createState() => _DashboardUserState();
}

class _DashboardUserState extends State<DashboardUser> {
  final articleList = FirebaseFirestore.instance.collection('article').snapshots();
  ApiServices client =  ApiServices();
  late Future<String> usernameFuture;

  @override
  void initState() {
    super.initState();
    usernameFuture = fetchUsername();
  }

  Future<String> fetchUsername() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      var snapshot = await FirebaseFirestore.instance
          .collection('user')
          .doc(user.uid)
          .get();
      if (snapshot.exists) {
        var userData = snapshot.data()!;
        return userData['names'];
      }
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    if (screenHeight<screenWidth) {
      screenHeight=MediaQuery.of(context).size.width;
      screenWidth=MediaQuery.of(context).size.height;
    }
    // if (username == ""){
    //   Navigator.of(context).pop(false);
    // }
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 241, 233),
      body: SingleChildScrollView(child:Center(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Text(listAlbum.length.toString(), style: TextStyle(fontSize: 300),),
              Stack(
                children: <Widget>[
                  AppBar(
                    backgroundColor: Color.fromARGB(255, 234, 231, 177),
                    automaticallyImplyLeading: false,
                    toolbarHeight: screenHeight*0.25,
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Container(
                      height: screenHeight*0.30,
                      width: screenWidth*0.85,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 60, 98, 85),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            spreadRadius: 5,
                            blurRadius: 15,
                            offset: Offset(0, 5), // changes position of shadow
                          ),
                        ]
                      ),
                      margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                      child:
                        Center(
                          child:
                            SizedBox(child:
                              Column(
                                children: [
                                  SizedBox(
                                    height: screenHeight*0.15,
                                    child:Center(
                                      child:
                                        Text("MEDKIT", style: TextStyle(fontSize: screenHeight*0.09, fontWeight:FontWeight.bold, color: Color.fromARGB(255, 238, 255, 225))),
                                    )
                                  ),
                                  
                                  Container(
                                    height: screenHeight*0.04,
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child:Center(
                                      child:
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              child: Text("Selamat datang ", style: TextStyle(color: Color.fromARGB(255, 238, 255, 225))),
                                            ),
                                            SizedBox(
                                              child: InkWell(
                                                child: FutureBuilder(
                                                  future: usernameFuture,
                                                  builder: (context, snapshot) {
                                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                                      return CircularProgressIndicator();
                                                    } else if (snapshot.hasError) {
                                                      return Text('Error: ${snapshot.error}');
                                                    } else {
                                                      return Text(snapshot.data.toString().toUpperCase(), style: TextStyle(fontWeight: FontWeight.w900, color: Color.fromARGB(255, 238, 255, 225)),);
                                                    }}
                                                  ), 
                                                onTap: (){
                                                  Navigator.push(
                                                  context,
                                                    MaterialPageRoute(
                                                        builder: (context) => 
                                                        HomeUser(name: name, emailp: emailp, nik: nik, alamat: alamat, tanggalL: tanggalL, tempatL: tempatL, gender: gender, goldar: goldar, age: age,uid: uidp, imagep: imagep,)
                                                      
                                                    ),
                                                  );
                                                }
                                              ),
                                            )
                                          ],
                                        )
                                    )
                                  ),

                                  
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, screenHeight*0.025, 0, 0),
                                    height: screenHeight*0.085,
                                    child:
                                    Center(
                                      child:
                                        Stack(
                                        children: [
                                          Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, screenHeight*0.020),
                                            child: 
                                              Container(
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromARGB(105, 0, 0, 0).withOpacity(0.2),
                                                      spreadRadius: 5,
                                                      blurRadius: 15,
                                                      offset: Offset(0, 5), // changes position of shadow
                                                    ),
                                                  ]
                                                ),
                                                width: screenWidth*0.75,
                                                child:
                                                  TextField(
                                                    decoration: InputDecoration(
                                                    hintText: "cari rumah sakit",
                                                    hintStyle: TextStyle(fontSize: screenHeight*0.019),
                                                    filled: true,
                                                    fillColor: Color.fromARGB(255, 246, 241, 233),
                                                    border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(50))
                                                      ),
                                                    ),
                                                    onTap: (){
                                                      setState(() {
                                                        selectednavbar = 1;
                                                      });
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) => HomeUser(
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
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                            ),
                                          ],
                                      ),
                                    )
                                  ),
                                ],
                              )
                            //   
                          ),
                        ),
                    ),
                  )
                ],
              ),
              // Text("ini halaman dashboard atau home"),
              Container(
                padding: EdgeInsets.fromLTRB(0, screenHeight*0.015, 0, 0),
                width: screenWidth*0.85,
                // color: Colors.green,
                child: 
                  Text("Artikel", style: TextStyle(fontWeight: FontWeight.w700, color:Color.fromARGB(255, 60, 98, 85), fontSize: screenHeight*0.021),),
              ),
              Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child : 
                    Container(
                      // color: Colors.black,
                      height: screenHeight*0.27,
                      width: screenWidth*0.95,
                      child: 
                        StreamBuilder(
                          stream: articleList,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting){
                              return const Center(child: Text("loading..."));
                            }
                            var list = snapshot.data!.docs;
                            list.sort((a, b) =>
                                b['ratting'].compareTo(a['ratting']));
                            // return Text('${list.length}');
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: list.length,
                              itemBuilder: (context, index){
                                return 
                                InkWell(
                                  onTap: () {
                                    judul = list[index]['judul'];
                                    content = list[index]['isi'];
                                    gambara = list[index]['gambar'];
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => SeeArticlePage(judula: judul, contenta: content, gambara: gambara))
                                    );
                                    debugPrint(judul);
                                  },
                                  child:
                                  Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child:
                                    Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(105, 0, 0, 0).withOpacity(0.2),
                                            spreadRadius: 2,
                                            blurRadius: 3,
                                            offset: Offset(0, 3), 
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color.fromARGB(255, 234, 231, 177),
                                        
                                      ),
                                      width: screenWidth*0.4,
                                      child: 
                                        Column(children: <Widget> [
                                          Container(
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
                                                        image: new NetworkImage(list[index]['gambar'].toString()),
                                                      )
                                                    ),
                                                  ),
                                                ),
                                          ),
                                          Padding(padding:  EdgeInsets.fromLTRB(screenHeight*0.015, screenHeight*0.004, screenHeight*0.015, 0),
                                            child:
                                              Text(list[index]['judul'], style: TextStyle(fontSize: screenHeight*0.015, fontWeight: FontWeight.w700,color: Color.fromARGB(255, 60, 98, 85)),)
                                          ),
                                          Padding(padding:  EdgeInsets.fromLTRB(screenHeight*0.015, screenHeight*0.004, screenHeight*0.015, 0),
                                            child:
                                              Text(list[index]['isi'], textAlign: TextAlign.justify, style: TextStyle(fontSize: screenHeight*0.009, fontWeight: FontWeight.w700,color: Color.fromARGB(255, 60, 98, 85)),overflow: TextOverflow.ellipsis, maxLines: 3,)
                                          ),
                                          Padding(padding:  EdgeInsets.fromLTRB(screenHeight*0.015, screenHeight*0.003, screenHeight*0.015, 0),
                                            child:
                                              Row(
                                                children: [
                                                  Text('Rate : ', textAlign: TextAlign.justify, style: TextStyle(fontSize: screenHeight*0.013, fontWeight: FontWeight.w700,color: Color.fromARGB(255, 60, 98, 85)),overflow: TextOverflow.ellipsis, maxLines: 2,),
                                                  Icon(Icons.star, size: screenHeight*0.015, color: Color.fromARGB(255, 255, 196, 0),),
                                                  Text(' '+list[index]['ratting'].toString(), textAlign: TextAlign.justify, style: TextStyle(fontSize: screenHeight*0.013, fontWeight: FontWeight.w700,color: Color.fromARGB(255, 60, 98, 85)),overflow: TextOverflow.ellipsis, maxLines: 2,)

                                                ],
                                              )
                                              
                                          )
                                          
                                        ]
                                        ),
                                    )
                                  )
                                );
                              }
                            );
                          }
                        )
                    ),
                
                // )
              ),

              Container(
                padding: EdgeInsets.fromLTRB(0, screenHeight*0.001, 0, 0),
                width: screenWidth*0.85,
                // color: Colors.green,
                child: 
                  Text("Berita", style: TextStyle(fontWeight: FontWeight.w700, color:Color.fromARGB(255, 60, 98, 85), fontSize: screenHeight*0.021),),
              ),
                FutureBuilder(
                  future: client.getArticle(),
                  builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
                    if (snapshot.hasData) {
                      List<Article>? articles = snapshot.data;
                      return SizedBox(
                        height: screenHeight*0.19, 
                        child: 
                          RefreshIndicator(
                            onRefresh: () {
                            client.getArticle();
                            return Future.delayed(Duration(seconds: 5));
                          },
                          child:ListView.builder(
                              itemCount: articles?.length,
                              itemBuilder: (context, index) => ListTile(
                                title: Container(
                                  child: 
                                    Container(
                                      padding: EdgeInsets.fromLTRB(screenWidth*0.02, 0, screenWidth*0.02, screenWidth*0.02),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(width: 3, color: Color.fromARGB(255, 60, 98, 85)),
                                        ),
                                      ),
                                      child:
                                        InkWell(
                                          onTap: () async {
                                            final Uri url = Uri.parse(articles[index].url);
                                            Future<void> _launchUrl() async {
                                              if (!await launchUrl(url)) {
                                                throw Exception('Could not launch $url');
                                              }
                                            }
                                            launchUrl(url);
                                          },
                                          child: Text(articles![index].title, textAlign: TextAlign.justify, style: TextStyle(fontWeight: FontWeight.w700),),
                                        ),
                                        // 
                                    )
                                ),
                              ),
                            ),
                        )
                        
                      );
                    }
                    return Center(
                      child: 
                      // CircularProgressIndicator(),
                      LoadingAnimationWidget.halfTriangleDot(
                          color: Color.fromARGB(255, 60, 98, 85),
                          size: screenHeight*0.05,
                        ),
                      );
                  },)
              
              // for (var i = 0; i < 10; i++)
              // Padding(padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
              //   child:
              //     Container(
              //       decoration: BoxDecoration(
              //         boxShadow: [
              //           BoxShadow(
              //             color: Color.fromARGB(105, 0, 0, 0).withOpacity(0.2),
              //             spreadRadius: 2,
              //             blurRadius: 3,
              //             offset: Offset(0, 3), 
              //           ),
              //         ],
              //         borderRadius: BorderRadius.circular(10),
              //         color: Color.fromARGB(255, 60, 98, 85),
                      
              //       ),
              //       height: screenHeight*0.2,
              //       width: screenWidth*0.95,
              //       child: Center(child: Text('Item $i', style: TextStyle(fontSize: 18, color: Colors.white),)),
              //     ),
              // ),
          ],)
        )
      ),
      ),
    );
  }
}

class CirularProgressIndiator {
}