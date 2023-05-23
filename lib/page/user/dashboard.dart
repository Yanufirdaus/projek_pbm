import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projek_pbm/page/user/changepw.dart';
import 'package:projek_pbm/page/user/home.dart';
import 'package:projek_pbm/page/user/login.dart';
import 'package:projek_pbm/page/user/pwdetail.dart';
import 'package:projek_pbm/page/user/seearticle.dart';
import 'package:projek_pbm/page/user/signup.dart';
import 'package:projek_pbm/repository.dart';
import 'package:projek_pbm/user_model.dart';
import 'package:projek_pbm/model.dart';

class DashboardUser extends StatefulWidget {
  const DashboardUser({Key? key}) : super(key: key);

  @override
  State<DashboardUser> createState() => _DashboardUserState();
}

class _DashboardUserState extends State<DashboardUser> {
  final articleList = FirebaseFirestore.instance.collection('article').snapshots();

  late List<Album> listAlbum = []; // Initialize as an empty list

  Repository repository = Repository();

  @override
  void initState() {
    super.initState();
    getData();
    // Auto-refresh every 30 seconds
    // Timer.periodic(Duration(seconds: 1), (Timer t) => );
  }

  getData() async {
    listAlbum = await repository.getData();
    setState(() {});
  }

  

  @override
  Widget build(BuildContext context) {
    getData();
      didChangeDependencies();
    if (listAlbum.length != 0){
        didChangeDependencies();
        
    }

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
                                                child: Text("Nama User", style: TextStyle(fontWeight: FontWeight.w900, color: Color.fromARGB(255, 238, 255, 225)),), 
                                                onTap: (){
                                                  Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => SignupPage(role: role,), 
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
                                                    hintText: "cari artikel",
                                                    hintStyle: TextStyle(fontSize: screenHeight*0.019),
                                                    filled: true,
                                                    fillColor: Color.fromARGB(255, 246, 241, 233),
                                                    border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(50))
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ),
                                          
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(screenWidth*0.60, screenHeight*0.00, 0, 0),
                                              child: 
                                                IconButton(
                                                  onPressed: () {
                                                  },
                                                  icon: const Icon(Icons.search),
                                                  iconSize: screenHeight*0.025,
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
              Padding(padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child : 
                InkWell(
                  child: 
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
                            // return Text('${list.length}');
                            return ListView.builder(
                              // shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: list.length,
                              itemBuilder: (context, index){
                                return 
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
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(500)),
                                          child: AspectRatio(
                                            aspectRatio: 487 / 310,
                                                child: new Container(
                                                  decoration: new BoxDecoration(
                                                    image: new DecorationImage(
                                                      fit: BoxFit.fitWidth,
                                                      alignment: FractionalOffset.topCenter,
                                                      image: new NetworkImage(list[index]['gambar'].toString()),
                                                    )
                                                  ),
                                                ),
                                              ),
                                        ),
                                        
                                        // Container(
                                        //   width: screenWidth*0.09,
                                        //   height: screenHeight*0.09,
                                        //   child:
                                        //   AspectRatio(aspectRatio: screenWidth*0.07/screenHeight*0.07,
                                        //     child: Image.network(list[index]['gambar'].toString())
                                        //   )
                                        //     ),
                                        Padding(padding:  EdgeInsets.fromLTRB(screenHeight*0.015, screenHeight*0.015, screenHeight*0.009, 0),
                                          child:
                                            Text(list[index]['judul'], style: TextStyle(fontSize: screenHeight*0.015, color: Colors.grey),)
                                        )
                                        
                                      ]
                                      ),
                                  ));
                              }
                            );
                          }
                        )
                        // ListView(
                        //   scrollDirection: Axis.horizontal,
                        //   children: [
                        //     for (var i = 0; i < 10; i++) 
                        //     Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        //       child: 
                                // Container(
                                //   decoration: BoxDecoration(
                                //     boxShadow: [
                                //       BoxShadow(
                                //         color: Color.fromARGB(105, 0, 0, 0).withOpacity(0.2),
                                //         spreadRadius: 2,
                                //         blurRadius: 3,
                                //         offset: Offset(0, 3), 
                                //       ),
                                //     ],
                                //     borderRadius: BorderRadius.circular(10),
                                //     color: Color.fromARGB(255, 234, 231, 177),
                                    
                                //   ),
                                //   width: screenWidth*0.4,
                                //   child: Center(child: Text('Item $i', style: TextStyle(fontSize: 18, color: Colors.grey),)),
                                // ),
                        //     ),
                        //   ],
                        // ),
                    ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SeeArticlePage())
                    );
                  },
                )
                  
              ),
              
              ListView.builder(scrollDirection: Axis.vertical,
                shrinkWrap: true, itemBuilder: (context, index){
                return Padding(padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
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
                          color: Color.fromARGB(255, 60, 98, 85),
                          
                        ),
                        height: screenHeight*0.2,
                        width: screenWidth*0.00004,
                        child: Center(child: 
                                      Column(children: <Widget> [
                                        Container(
                                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                          width: 90,
                                          height: 90,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(500)),
                                          child: AspectRatio(
                                            aspectRatio: 3 / 3,
                                                child: new Container(
                                                  decoration: new BoxDecoration(
                                                    image: new DecorationImage(
                                                      fit: BoxFit.fitWidth,
                                                      alignment: FractionalOffset.topCenter,
                                                      image: new NetworkImage(listAlbum[index].avatar.toString()),
                                                    )
                                                  ),
                                                ),
                                              ),
                                        ),
                                        
                                        // Container(
                                        //   width: screenWidth*0.09,
                                        //   height: screenHeight*0.09,
                                        //   child:
                                        //   AspectRatio(aspectRatio: screenWidth*0.07/screenHeight*0.07,
                                        //     child: Image.network(list[index]['gambar'].toString())
                                        //   )
                                        //     ),
                                        Padding(padding:  EdgeInsets.fromLTRB(screenHeight*0.015, screenHeight*0.015, screenHeight*0.009, 0),
                                          child:
                                              Text(listAlbum[index].name, style: TextStyle(fontSize: 18, color: Colors.white),)
                                        )
                                        
                                      ]
                                      ),
                        ),
                      ));
              
              }, itemCount: listAlbum.length), 
              // for (var i = 0; i < 10; i++)
              // Padding(padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
              //   child:
                  // Container(
                  //   decoration: BoxDecoration(
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Color.fromARGB(105, 0, 0, 0).withOpacity(0.2),
                  //         spreadRadius: 2,
                  //         blurRadius: 3,
                  //         offset: Offset(0, 3), 
                  //       ),
                  //     ],
                  //     borderRadius: BorderRadius.circular(10),
                  //     color: Color.fromARGB(255, 60, 98, 85),
                      
                  //   ),
                  //   height: screenHeight*0.2,
                  //   width: screenWidth*0.95,
                  //   child: Center(child: Text('Item $i', style: TextStyle(fontSize: 18, color: Colors.white),)),
                  // ),
              // ),
          ],)
        )
      ),
      ),
    );
  }
}