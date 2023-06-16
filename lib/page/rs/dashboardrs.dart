import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:projek_pbm/page/rs/qrscanner.dart';
import 'package:projek_pbm/page/user/carirs.dart';
import 'package:projek_pbm/page/user/login.dart';
import 'dart:math';

double rslat= 0;
double rslang= 0;

String psid = '';
String stat = '';



double pslat= 0;
double pslang= 0;

class DashboardRs extends StatefulWidget {
  const DashboardRs({super.key, required String rsnames});

  @override
  State<DashboardRs> createState() => _DashboardRsState();
}

class _DashboardRsState extends State<DashboardRs> {

  late Future<Map<String, dynamic>> userdataFuture;

  @override
  void initState() {
    super.initState();
    userdataFuture = fetchUserData();
  }

  Future<Map<String, dynamic>> fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    Map<String, dynamic> userData = {};

    if (user != null) {
      var snapshot = await FirebaseFirestore.instance
          .collection('user')
          .doc(user.uid)
          .get();

      if (snapshot.exists) {
        userData = snapshot.data()!;
      }
    }

    return userData;
  }
  
  @override
  Widget build(BuildContext context) {

    void refreshData() async {
      final snapshot = await FirebaseFirestore.instance.collection('data_pasien').get();
      var list = snapshot.docs;
      var pslist = list.where((user) => user['rs_name'] == name).toList();
      setState(() {
        pslist = pslist;
      });
    }


    final pasienList = FirebaseFirestore.instance.collection('data_pasien').snapshots();
    final rsList = FirebaseFirestore.instance.collection('user').snapshots();

    Future<List<QueryDocumentSnapshot>> getFilteredData(String rsname) async {
      QuerySnapshot snapshot = await rsList.first;
      List<QueryDocumentSnapshot> filteredData =
          snapshot.docs.where((doc) => doc['names'] == name).toList();
      return filteredData;
    }

    void rsLocation() async {
      List<QueryDocumentSnapshot> filteredData = await getFilteredData(name);

      for (var rs in filteredData) {
        rslat= (rs['lokasi'].latitude);
        rslang= (rs['lokasi'].longitude);
        debugPrint(rslat.toString()+" "+rslang.toString());
      }
    }

    rsLocation();

    double calculateDistance(lat1, lon1, lat2, lon2){
      var p = 0.017453292519943295;
      var c = cos;
      var a = 0.5 - c((lat2 - lat1) * p)/2 + 
            c(lat1 * p) * c(lat2 * p) * 
            (1 - c((lon2 - lon1) * p))/2;
      return 12742 * asin(sqrt(a));
    }

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    if (screenHeight<screenWidth) {
      screenHeight=MediaQuery.of(context).size.width;
      screenWidth=MediaQuery.of(context).size.height;
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 241, 233),
      body: Center(
        child: FutureBuilder<Map<String, dynamic>>(
            future: fetchUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                var userData = snapshot.data!;
                var username = userData['names'];

                return SingleChildScrollView(
              child: Column(
                children: [
                    Text("Data registrasi pasien ".toUpperCase()+username.toUpperCase(), style: TextStyle(fontSize: screenWidth*0.05, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85)), textAlign: TextAlign.center,),
                    Padding(padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
                      child : 
                        Row(children: <Widget> [
                            Padding(padding:  EdgeInsets.fromLTRB(screenHeight*0.015, screenHeight*0.004, screenHeight*0.015, 0),
                              child:
                                Container(
                                  width: screenWidth*0.2,
                                  child:
                                    Text('Nama Pasien', style: TextStyle(fontSize: screenHeight*0.015, fontWeight: FontWeight.w700,color: Color.fromARGB(255, 60, 98, 85)),)
                                )
                            ),
                            Padding(padding:  EdgeInsets.fromLTRB(screenHeight*0.015, screenHeight*0.004, screenHeight*0.015, 0),
                              child:
                                Container(
                                  width: screenWidth*0.17,
                                  child:
                                    Text('Keluhan', textAlign: TextAlign.justify, style: TextStyle(fontSize: screenHeight*0.015, fontWeight: FontWeight.w700,color: Color.fromARGB(255, 60, 98, 85)),overflow: TextOverflow.ellipsis, maxLines: 3,)
                                )
                            ),
                            Padding(padding:  EdgeInsets.fromLTRB(0, screenHeight*0.004, screenHeight*0.015, 0),
                              child:
                                Container(
                                  width: screenWidth*0.07,
                                  child:
                                    Text('Jarak'.toString(), textAlign: TextAlign.justify, style: TextStyle(fontSize: screenHeight*0.013, fontWeight: FontWeight.w700,color: Color.fromARGB(255, 60, 98, 85)),overflow: TextOverflow.ellipsis, maxLines: 3,)
                                )
                            ),
                            Padding(padding:  EdgeInsets.fromLTRB(screenHeight*0.015, screenHeight*0.004, screenHeight*0.015, 0),
                              child:
                                Container(
                                  width: screenWidth*0.07,
                                  child:
                                    Text('Usia'.toString(), textAlign: TextAlign.justify, style: TextStyle(fontSize: screenHeight*0.013, fontWeight: FontWeight.w700,color: Color.fromARGB(255, 60, 98, 85)),overflow: TextOverflow.ellipsis, maxLines: 3,)
                                )
                            ),
                            Padding(padding:  EdgeInsets.fromLTRB(screenHeight*0.015, screenHeight*0.004, screenHeight*0.015, 0),
                              child:
                                Container(
                                  width: screenWidth*0.09,
                                  child:
                                    Text('ScanQr'.toString(), textAlign: TextAlign.justify, style: TextStyle(fontSize: screenHeight*0.013, fontWeight: FontWeight.w700,color: Color.fromARGB(255, 60, 98, 85)),overflow: TextOverflow.ellipsis, maxLines: 3,)
                                )
                            ),
                          ]
                        )
                    ),
                  Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child : 
                        Container(
                          // color: Colors.black,
                          height: screenHeight*0.55,
                          width: screenWidth*0.95,
                          child: 
                            StreamBuilder(
                              stream: pasienList,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting){
                                  return const Center(child: Text("loading..."));
                                }
                                var list = snapshot.data!.docs;
                                // list.sort((a, b) =>
                                //     b['passien_name'].compareTo(a['passien_name']));
                                // return Text('${list.length}');
                                var pslist = list.where((user) => user['rs_name'] == username).toList();

                                List<String> documentIds = pslist.map((user) => user.id).toList();
                                
                                

                                return ListView.builder(
                                  itemCount: pslist.length,
                                  itemBuilder: (context, index){

                                    pslist[index]['status'];

                                    

      
                                    
                                    stat= pslist[index]['status'];
                                    pslat = pslist[index]['p_location'].latitude;
                                    pslang = pslist[index]['p_location'].longitude;

                                    // double distance = calculateDistance(rslat, rslang, pslat, pslang);
                                    double distance = calculateDistance(pslat, pslang, rslat, rslang);
                                    debugPrint(pslist[index]['p_location'].latitude.toString());
                                    debugPrint(pslist[index]['p_location'].longitude.toString());
                                    return 
                                    InkWell(
                                      onTap: () {
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
                                            Row(children: <Widget> [
                                              Column(
                                                children: [
                                                  Padding(padding:  EdgeInsets.fromLTRB(screenHeight*0.015, screenHeight*0.004, screenHeight*0.015, 0),
                                                    child:
                                                      Container(
                                                        width: screenWidth*0.18,
                                                        child:
                                                          Text(pslist[index]['passien_name'], style: TextStyle(fontSize: screenHeight*0.015, fontWeight: FontWeight.w700,color: Color.fromARGB(255, 60, 98, 85)),)
                                                      )
                                                  ),
                                                  Padding(padding:  EdgeInsets.fromLTRB(screenHeight*0.015, screenHeight*0.004, screenHeight*0.015, 0),
                                                    child:
                                                      Container(
                                                        width: screenWidth*0.18,
                                                        child:
                                                          Text(pslist[index]['status'], style: TextStyle(fontSize: screenHeight*0.01, fontWeight: FontWeight.w700,color: pslist[index]['status'] == 'belum diproses' ? Colors.red : Color.fromARGB(255, 60, 98, 85),),)
                                                      )
                                                  ),
                                                ],

                                              ),
                                              Padding(padding:  EdgeInsets.fromLTRB(screenHeight*0.015, screenHeight*0.004, screenHeight*0.015, 0),
                                                child:
                                                  Container(
                                                    width: screenWidth*0.17,
                                                    child:
                                                      Text(pslist[index]['keluhan'], style: TextStyle(fontSize: screenHeight*0.015, fontWeight: FontWeight.w700,color: Color.fromARGB(255, 60, 98, 85)),overflow: TextOverflow.ellipsis, maxLines: 3,)
                                                  )
                                              ),
                                              Padding(padding:  EdgeInsets.fromLTRB(screenHeight*0.015, screenHeight*0.004, screenHeight*0.015, 0),
                                                child:
                                                  Container(
                                                    width: screenWidth*0.09,
                                                    child:
                                                      Text(distance.toStringAsFixed(2)+'km', textAlign: TextAlign.justify, style: TextStyle(fontSize: screenHeight*0.013, fontWeight: FontWeight.w700,color: Color.fromARGB(255, 60, 98, 85)),overflow: TextOverflow.ellipsis, maxLines: 3,)
                                                  )
                                              ),
                                              Padding(padding:  EdgeInsets.fromLTRB(screenHeight*0.015, screenHeight*0.004, screenHeight*0.015, 0),
                                                child:
                                                  Container(
                                                    width: screenWidth*0.05,
                                                    child:
                                                      Text(pslist[index]['age'].toString(), textAlign: TextAlign.justify, style: TextStyle(fontSize: screenHeight*0.015, fontWeight: FontWeight.w700,color: Color.fromARGB(255, 60, 98, 85)),overflow: TextOverflow.ellipsis, maxLines: 3,)
                                                  )
                                              ),
                                              Padding(padding:  EdgeInsets.fromLTRB(0, screenHeight*0.004, screenHeight*0.015, 0),
                                                child:
                                                  Container(
                                                    width: screenWidth*0.05,
                                                    child:
                                                      InkWell(
                                                        child: 
                                                          Icon(
                                                            Icons.qr_code_scanner,
                                                            color: Color.fromARGB(255, 60, 98, 85),
                                                            size: 35.0,
                                                          ),
                                                          onTap: () {
                                                            psid = documentIds[index];
                                                             Navigator.push(
                                                              context,
                                                                MaterialPageRoute(
                                                                    builder: (context) => 
                                                                    QrScanner(psid: psid, stat: stat)
                                                                ),
                                                              );
                                                              refreshData();
                                                            //  debugPrint(pslist[index]['p_location'].latitude.toString());
                                                          },
                                                      )
                                                  )
                                              ),
                                              
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
                ],
              ),
            );};
          }
        ),
      )
    );
  }
}