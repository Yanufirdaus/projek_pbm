import 'package:flutter/material.dart';
import 'package:projek_pbm/page/user/bookingrs.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrDisplay extends StatefulWidget {
  const QrDisplay({super.key, required String dokid, });

  @override
  State<QrDisplay> createState() => _QrDisplayState();
}

class _QrDisplayState extends State<QrDisplay> {

  String qrCodeData = dokumenid;
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: screenWidth*0.8,
                padding: EdgeInsets.only(bottom: screenWidth*0.1),
                child:
                  Text("Jangan tutup aplikasi, atau Screenshot Qr code dan Tunjukkan saat tiba di rumah sakit tujuan".toUpperCase(), style: TextStyle(fontSize: screenWidth*0.05, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 60, 98, 85)), textAlign: TextAlign.center,),
              ),
              
              QrImage(
                data: qrCodeData,
                version: QrVersions.auto,
                size: screenWidth*0.65,
              ),
            ],
          ),
        ),
      ),
    );
  }
}