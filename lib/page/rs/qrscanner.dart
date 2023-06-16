import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projek_pbm/page/rs/dashboardrs.dart';
import 'package:projek_pbm/page/rs/home.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../user/login.dart';

String newstat = '';

class QrScanner extends StatefulWidget {
  const QrScanner({super.key, required String psid, required String stat});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  
  final GlobalKey _gLobalkey = GlobalKey();
  QRViewController? controller;
  Barcode? result;
  void qr(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((event) {
     setState(() {
       result = event;
     });
     if(result!.code == psid){
      // print("sama coy");
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text("sama coy")),
      // );
      setState(() {
        newstat = 'Sudah Diproses';
      });
      HapticFeedback.vibrate();
      var collection = FirebaseFirestore.instance.collection('data_pasien');
        collection 
            .doc(psid) 
            .update({
              'status': newstat
            }).then((value) => 
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeRs(
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
                ),
              )
            );
            
     }
    }
    );
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    if (screenHeight<screenWidth) {
      screenHeight=MediaQuery.of(context).size.width;
      screenWidth=MediaQuery.of(context).size.height;
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 231, 177),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: screenWidth*0.7,
              width: screenWidth*0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
              ),
              child: QRView(
                  key: _gLobalkey,
                  onQRViewCreated: qr
              ),
            ),
            Center(
              child: (result !=null) ? Text('${result!.code}' + psid) : Text('Scan a code', style: TextStyle(color: Color.fromARGB(255, 234, 231, 177)),),
            )
          ],
        ),
      ),
    );
  }
}