import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:projek_pbm/page/user/carirs.dart';
import 'package:projek_pbm/page/user/dashboard.dart';
import 'package:projek_pbm/page/user/home.dart';


class DetailRs extends StatefulWidget {
  const DetailRs({super.key, required String namers, required layananv, required jambk, required jamtp, required String alamatrs, required String emailrs, required String telp, required String imagesrs});

  @override
  State<DetailRs> createState() => _DetailRsState();
}


class _DetailRsState extends State<DetailRs> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


    List<dynamic> valuesList = layanan.values.toList();

    if (screenHeight<screenWidth) {
      screenHeight=MediaQuery.of(context).size.width;
      screenWidth=MediaQuery.of(context).size.height;
    }
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 231, 177),
      body:
        Center
        ( child:
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: screenWidth*0.9,
                  height: screenHeight*0.85,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 60, 98, 85),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: 
                    Column( children:
                      [
                      Padding(padding: EdgeInsets.only(top: screenHeight*0.015, bottom: screenHeight*0.015), 
                        child: Container(
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
                      )),
                      Row(
                        children:
                          [
                            Container(
                              // height: screenHeight*0.5,
                              width: screenWidth*0.4,
                              child:
                                Padding(padding : EdgeInsets.all(screenHeight*0.01),
                                  child: 
                                  AspectRatio(
                                    aspectRatio: 487 / 310,
                                      child: new Container(
                                        padding: EdgeInsets.all(screenHeight*0.1),
                                        decoration: new BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: new DecorationImage(
                                            fit: BoxFit.fitWidth,
                                            alignment: FractionalOffset.topCenter,
                                            image: new NetworkImage(imagesrs),
                                          )
                                        ),
                                      ),
                                  )
                                )
                            ),
                            Column( children:
                              [
                                Container(
                                  // height: screenHeight*0.1,
                                  width: screenWidth*0.45,
                                  child: 
                                    Text(namers.toUpperCase(), textAlign: TextAlign.left, style: TextStyle(fontSize: screenWidth*0.05, color: Color.fromARGB(255, 234, 231, 177), fontWeight: FontWeight.w900),),
                                ),
                                Container(
                                  // height: screenHeight*0.1,
                                  width: screenWidth*0.45,
                                  child: 
                                    Text(alamatrs, style: TextStyle(color: Color.fromARGB(255, 234, 231, 177)),)
                                )
                                
                              ]
                            )
                        ]
                      ),
                      Column(
                        children:
                        [
                          Padding( padding:EdgeInsets.only(left: screenWidth*0.055, top: screenHeight*0.02), child:
                            Row(children:
                              [
                                Container(
                                  margin: EdgeInsets.only(right: screenWidth*0.015),
                                  width: screenWidth*0.25,
                                  height: screenHeight*0.1,
                                  child: 
                                    Column(
                                      children: [
                                        Row(children: [
                                          Text("senin", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)),),
                                          Text(":  ", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177))),
                                          Text(jambk['senin']+' - '+jamtp['senin'], style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)))
                                        ]),
                                        Row(children: [
                                          Text("", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700),),
                                          Text("", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700)),
                                          Text('', style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700))
                                        ]),
                                        Row(children: [
                                          Text("selasa", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)),),
                                          Text(":  ", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177))),
                                          Text(jambk['selasa']+' - '+jamtp['selasa'], style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)))
                                        ]),
                                        Row(children: [
                                          Text("", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700),),
                                          Text("", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700)),
                                          Text('', style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700))
                                        ]),
                                        Row(children: [
                                          Text("rabu", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)),),
                                          Text(":  ", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177))),
                                          Text(jambk['rabu']+' - '+jamtp['rabu'], style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)))
                                        ]),
                                      ],
                                    )
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: screenWidth*0.015),
                                  width: screenWidth*0.25,
                                  height: screenHeight*0.1,
                                  child: 
                                    Column(
                                      children: [
                                        Row(children: [
                                          Text("kamis", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)),),
                                          Text(":  ", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177))),
                                          Text(jambk['kamis']+' - '+jamtp['kamis'], style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)))
                                        ]),
                                        Row(children: [
                                          Text("", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700),),
                                          Text("", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700)),
                                          Text('', style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700))
                                        ]),
                                        Row(children: [
                                          Text("jum'at", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)),),
                                          Text(":  ", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177))),
                                          Text(jambk['jumat']+' - '+jamtp['jumat'], style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)))
                                        ]),
                                        Row(children: [
                                          Text("", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700),),
                                          Text("", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700)),
                                          Text('', style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700))
                                        ]),
                                        Row(children: [
                                          Text("sabtu", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)),),
                                          Text(":  ", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177))),
                                          Text(jambk['sabtu']+' - '+jamtp['sabtu'], style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)))
                                        ]),
                                      ],
                                    )
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: screenWidth*0.015),
                                  width: screenWidth*0.25,
                                  height: screenHeight*0.1,
                                  child: 
                                    Column(
                                      children: [
                                        Row(children: [
                                          Text("minggu", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)),),
                                          Text(":  ", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177))),
                                          Text(jambk['minggu']+' - '+jamtp['minggu'], style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)))
                                        ]),
                                        // Row(children: [
                                        //   Text("", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700),),
                                        //   Text("", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700)),
                                        //   Text('', style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700))
                                        // ]),
                                        // Row(children: [
                                        //   Text("senin", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)),),
                                        //   Text(":  ", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177))),
                                        //   Text(jambk['senin']+' - '+jamtp['senin'], style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)))
                                        // ]),
                                        // Row(children: [
                                        //   Text("", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700),),
                                        //   Text("", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700)),
                                        //   Text('', style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700))
                                        // ]),
                                        // Row(children: [
                                        //   Text("senin", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)),),
                                        //   Text(":  ", style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177))),
                                        //   Text(jambk['senin']+' - '+jamtp['senin'], style: TextStyle(fontSize: screenHeight*0.012, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 234, 231, 177)))
                                        // ]
                                        // ),
                                      ],
                                    )
                                ),
                              ],
                            )
                          )
                        ]
                      ),
                      Container(
                        width: screenWidth*0.5,
                        height: screenHeight*0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 234, 231, 177)
                        ),
                        child:
                          Column(
                            children: [
                              Container(margin: EdgeInsets.only(top: screenHeight*0.02) ,height: screenHeight*0.04,child:Text("Social", style: TextStyle(fontWeight: FontWeight.w700, fontSize: screenHeight*0.015, color: Color.fromARGB(255, 60, 98, 85))),),
                              Text('Email  :  '+emailrs, style: TextStyle(fontWeight: FontWeight.w700, fontSize: screenHeight*0.015, color: Color.fromARGB(255, 60, 98, 85))),
                              Text('Nomer Telpon  :  '+telp, style: TextStyle(fontWeight: FontWeight.w700, fontSize: screenHeight*0.015, color: Color.fromARGB(255, 60, 98, 85)))
                            ],
                          )
                          
                      ),
                      
                      SingleChildScrollView(
                        child:
                        Container(
                          margin: EdgeInsets.only(top: screenHeight * 0.02),
                          width: screenWidth * 0.5,
                          height: screenHeight * 0.27,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(255, 234, 231, 177),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: screenHeight*0.015),
                                child:
                                Text(
                                  'Layanan Unggulan:',
                                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: screenHeight*0.015, color: Color.fromARGB(255, 60, 98, 85))
                                )
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: valuesList.length,
                                  itemBuilder: (context, index) {
                                    var value = valuesList[index];
                                    return Center(
                                      child:
                                      Container(
                                        padding: EdgeInsets.only(left: screenWidth*0.04, top: screenWidth*0.02),
                                        child:
                                        Row(
                                          children: [
                                            Container(
                                              width: screenWidth*0.17,
                                              child:
                                                Text('Layanan '+(index+1).toString()+' : ', style: TextStyle(fontWeight: FontWeight.w700, fontSize: screenHeight*0.015, color: Color.fromARGB(255, 60, 98, 85)), textAlign: TextAlign.justify,)
                                            ),
                                            Container(
                                              width: screenWidth*0.25,
                                              child:
                                                Text(value.toString(), style: TextStyle(fontWeight: FontWeight.w700, fontSize: screenHeight*0.015, color: Color.fromARGB(255, 60, 98, 85)), textAlign: TextAlign.justify,)
                                            )
                                          ],
                                        )
                                      )
                                        
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                          
                      )
                    ]),
                )
              ],
            ),
          )
        )
    ) ;
  }
}