import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:projek_pbm/page/rs/signup%20rs.dart';
import 'package:projek_pbm/page/user/login.dart';
import 'package:projek_pbm/page/user/home.dart';
import 'package:projek_pbm/page/user/profile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';

bool isLoading = false;
String by = ""; 
String now = "";

class ChangeProfileUser extends StatefulWidget {
  const ChangeProfileUser({ super.key, required String nameEP, required String emailpEP, required String nikEP, required String alamatEP, required String tempatLEP, required String tanggalLEP, required String genderEP, required String goldarEP, required String uiddd, required String ipr});

  @override
  State<ChangeProfileUser> createState() => _ChangeProfileUserState();
}


TextEditingController nameController = TextEditingController();
TextEditingController nikController = TextEditingController();
TextEditingController addressController = TextEditingController();
TextEditingController tlController = TextEditingController();
TextEditingController genderController = TextEditingController();
TextEditingController goldarController = TextEditingController();
TextEditingController ttlController = TextEditingController();

class _ChangeProfileUserState extends State<ChangeProfileUser> {

  @override
  void initState() {
    super.initState();
    nameController.text = usernameus;
    ttlController.text = tanggallahir;
    nikController.text = nikuser;
    addressController.text = alamatuser;
    tlController.text = tempatlahir;
    genderController.text = genderuser;
    goldarController.text = goldaruser;
  }


  File? _image;
  XFile? _images;
  String? imageUrl;
  @override
  Widget build(BuildContext context) {

    
   
    now = DateTime.now().toString().substring(0,4);
    int nowint = int.parse(now);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    if (screenHeight<screenWidth) {
      screenHeight=MediaQuery.of(context).size.width;
      screenWidth=MediaQuery.of(context).size.height;
    }

    List<CameraDescription>? cameras; 
    CameraController? controller;
    Future<void> getImagefromCamera() async{
      final picker = ImagePicker();
      final image = await picker.pickImage(source: ImageSource.camera);

      setState(() {
        _images = image;
        _image = File(_images!.path);
      });
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 246, 241, 233),
      body: SingleChildScrollView(child:Center(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: 
              <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(screenWidth*0.065, screenHeight*0.07, 0, 0),
                  width: screenWidth*1,
                  child: 
                    Align(alignment: Alignment.centerLeft,
                      child: 
                        InkWell(
                          child: 
                            Icon(
                              Icons.arrow_back,
                              color: Color.fromARGB(255, 60, 98, 85),
                              size: 35.0,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                        )
                    )
                  ),
                
                Padding(padding: EdgeInsets.fromLTRB(0, screenHeight*0.03, 0, screenHeight*0.015),
                  child: 
                    Container(
                      child: Text("EDIT PROFILE", style: TextStyle(fontSize: screenWidth*0.13, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 60, 98, 85),),),
                    ),
                ),
                SingleChildScrollView(child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 60, 98, 85),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      width: screenWidth*0.85,
                      height: screenHeight*0.73,
                      child: 
                      Padding(padding: EdgeInsets.fromLTRB(0, screenHeight*0.03, 0, screenHeight*0.03),
                        child: 
                          Column(
                            children: <Widget>[
                              Stack(
                              
                                children: [
                                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, screenHeight*0.03),
                                    child: 
                                    Column(
                                      children: <Widget>[
                                         Visibility(visible: _image == null,
                                            child: 
                                              Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, screenHeight*0.02),
                                                child:  _image == null
                                                  ? ClipRRect(
                                                      borderRadius: BorderRadius.circular(500),
                                                      child: Image.network(
                                                        imageuser,
                                                        fit: BoxFit.cover,
                                                        width: screenHeight * 0.15,
                                                        height: screenHeight * 0.15,
                                                      ),
                                                    )
                                                  : 
                                                  Container(
                                                  alignment: AlignmentDirectional.bottomEnd,
                                                  width: screenHeight*0.15,
                                                  height: screenHeight*0.15,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(500),
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              )
                                          ),
                                         Visibility(visible: _image != null,
                                            child: 
                                              Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, screenHeight*0.02),
                                                child:  _image != null
                                                  ? ClipRRect(
                                                      borderRadius: BorderRadius.circular(500),
                                                      child: Image.file(
                                                        _image!,
                                                        fit: BoxFit.cover,
                                                        width: screenHeight * 0.15,
                                                        height: screenHeight * 0.15,
                                                      ),
                                                    )
                                                  : 
                                                  Container(
                                                  alignment: AlignmentDirectional.bottomEnd,
                                                  width: screenHeight*0.15,
                                                  height: screenHeight*0.15,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(500),
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              )
                                          ),
                                      ],
                                    )
                                   
                                    
                                  ),

                                  Container(
                                    width: screenHeight*0.15,
                                    height: screenHeight*0.15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(500),
                                    ),
                                    child: 
                                      Padding(padding: EdgeInsets.fromLTRB(screenWidth*0.19, screenWidth*0.19, 0, 0),
                                        child: 
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(500),
                                              color: Colors.white,
                                            ),
                                            child: 
                                              InkWell(
                                                child: 
                                                  Icon(
                                                    Icons.edit,
                                                    color: Color.fromARGB(255, 60, 98, 85),
                                                    size: 20.0,
                                                  ),
                                                onTap: () {
                                                  showModalBottomSheet(
                                                    context: context,
                                                    builder: (BuildContext context) {
                                                      return Container(
                                                        child: Column(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            ListTile(
                                                              leading: Icon(Icons.camera),
                                                              title: Text('Open Camera'),
                                                              onTap: () {
                                                                getImagefromCamera();
                                                              },
                                                            ),
                                                            ListTile(
                                                              leading: Icon(Icons.photo_library),
                                                              title: Text('Select from Gallery'),
                                                              onTap: () async{
                                                                final picker = ImagePicker();
                                                                final pickedImage = await picker.pickImage(source: ImageSource.gallery);
                                                                if (pickedImage != null) {
                                                                  setState(() {
                                                                    _image = File(pickedImage.path);
                                                                  });
                                                                }
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              )
                                          ),
                                      )
                                  ),
                                ],
                              ),
                              

                              Padding( padding: EdgeInsets.fromLTRB(0, screenHeight*0.0, 0, 0),
                                child:Column(
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: screenWidth*0.29,
                                          // height: screenHeight*0.03,
                                          decoration: BoxDecoration(
                                            // color: Colors.lightBlue
                                          ),
                                          child: Text("Nama", style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                        ),
                                        Container(
                                          width: screenWidth*0.03,
                                          // height: screenHeight*0.03,
                                          decoration: BoxDecoration(
                                            // color: Colors.limeAccent
                                          ),
                                          child: Text(":", style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                        ),
                                        Container(
                                          width: screenWidth*0.4,
                                          height: screenHeight*0.035,
                                          padding: EdgeInsets.fromLTRB(screenWidth*0.02, 0, screenWidth*0.02, 0),
                                          decoration: BoxDecoration(
                                            color: Colors.white
                                          ),
                                          
                                          child: TextFormField(
                                            keyboardType: TextInputType.name,
                                            decoration: new InputDecoration(
                                              contentPadding: const EdgeInsets.fromLTRB(0,0,0,13.0)),
                                            controller: nameController,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ),
                              Padding( padding: EdgeInsets.fromLTRB(0, screenHeight*0.01, 0, 0),
                                child:Column(
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: screenWidth*0.29,
                                          // height: screenHeight*0.03,
                                          decoration: BoxDecoration(
                                            // color: Colors.lightBlue
                                          ),
                                          child: Text("NIK", style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                        ),
                                        Container(
                                          width: screenWidth*0.03,
                                          // height: screenHeight*0.03,
                                          decoration: BoxDecoration(
                                            // color: Colors.limeAccent
                                          ),
                                          child: Text(":", style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                        ),
                                        Container(
                                          width: screenWidth*0.4,
                                          padding: EdgeInsets.fromLTRB(screenWidth*0.02, 0, screenWidth*0.02, 0),
                                          // height: screenHeight*0.045,
                                          decoration: BoxDecoration(
                                            color: Colors.white
                                          ),
                                          child:TextFormField(
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis
                                            ),
                                            decoration: new InputDecoration(
                                              contentPadding: const EdgeInsets.fromLTRB(0,0,0,13.0)),
                                            controller: nikController,
                                          ),
                                        ),
                                      ]
                                    )
                                  ],
                                )
                              ),
                              Padding( padding: EdgeInsets.fromLTRB(0, screenHeight*0.01, 0, 0),
                                child:Column(
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: screenWidth*0.29,
                                          // height: screenHeight*0.03,
                                          decoration: BoxDecoration(
                                            // color: Colors.lightBlue
                                          ),
                                          child: Text("Alamat", style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                        ),
                                        Container(
                                          width: screenWidth*0.03,
                                          // height: screenHeight*0.03,
                                          decoration: BoxDecoration(
                                            // color: Colors.limeAccent
                                          ),
                                          child: Text(":", style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                        ),
                                        Container(
                                          width: screenWidth*0.4,
                                          padding: EdgeInsets.fromLTRB(screenWidth*0.02, 0, screenWidth*0.02, 0),
                                          // height: screenHeight*0.035,
                                          decoration: BoxDecoration(
                                            color: Colors.white
                                          ),
                                          child: TextFormField(
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis
                                            ),
                                            decoration: new InputDecoration(
                                              contentPadding: const EdgeInsets.fromLTRB(0,0,0,13.0)),
                                            controller: addressController,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ),
                              Padding( padding: EdgeInsets.fromLTRB(0, screenHeight*0.01, 0, 0),
                                child:Column(
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: screenWidth*0.29,
                                          // height: screenHeight*0.03,
                                          decoration: BoxDecoration(
                                            // color: Colors.lightBlue
                                          ),
                                          child: Text("Tempat lahir", style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                        ),
                                        Container(
                                          width: screenWidth*0.03,
                                          // height: screenHeight*0.03,
                                          decoration: BoxDecoration(
                                            // color: Colors.limeAccent
                                          ),
                                          child: Text(":", style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                        ),
                                        Container(
                                          width: screenWidth*0.4,
                                          height: screenHeight*0.035,
                                          padding: EdgeInsets.fromLTRB(screenWidth*0.02, 0, screenWidth*0.02, 0),
                                          decoration: BoxDecoration(
                                            color: Colors.white
                                          ),
                                          child: TextFormField(
                                            decoration: new InputDecoration(
                                              contentPadding: const EdgeInsets.fromLTRB(0,0,0,13.0)),
                                            controller: tlController,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ),
                              Padding( padding: EdgeInsets.fromLTRB(0, screenHeight*0.01, 0, 0),
                                child:Column(
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: screenWidth*0.29,
                                          // height: screenHeight*0.03,
                                          decoration: BoxDecoration(
                                            // color: Colors.lightBlue
                                          ),
                                          child: Text("Tanggal lahir", style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                        ),
                                        Container(
                                          width: screenWidth*0.03,
                                          // height: screenHeight*0.03,
                                          decoration: BoxDecoration(
                                            // color: Colors.limeAccent
                                          ),
                                          child: Text(":", style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                        ),
                                        Container(
                                          width: screenWidth*0.4,
                                          height: screenHeight*0.035,
                                          padding: EdgeInsets.fromLTRB(screenWidth*0.02, 0, screenWidth*0.02, 0),
                                          decoration: BoxDecoration(
                                            color: Colors.white
                                          ),
                                          child: TextFormField(
                                            decoration: new InputDecoration(
                                              contentPadding: const EdgeInsets.fromLTRB(0,0,0,13.0)),
                                            controller: ttlController,
                                            // initialValue: name,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ),
                              Padding( padding: EdgeInsets.fromLTRB(0, screenHeight*0.01, 0, 0),
                                child:Column(
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: screenWidth*0.29,
                                          // height: screenHeight*0.03,
                                          decoration: BoxDecoration(
                                            // color: Colors.lightBlue
                                          ),
                                          child: Text("Gender", style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                        ),
                                        Container(
                                          width: screenWidth*0.03,
                                          // height: screenHeight*0.03,
                                          decoration: BoxDecoration(
                                            // color: Colors.limeAccent
                                          ),
                                          child: Text(":", style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                        ),
                                        Container(
                                          width: screenWidth*0.4,
                                          height: screenHeight*0.035,
                                          padding: EdgeInsets.fromLTRB(screenWidth*0.02, 0, screenWidth*0.02, 0),
                                          decoration: BoxDecoration(
                                            color: Colors.white
                                          ),
                                          child: TextFormField(
                                            decoration: new InputDecoration(
                                              contentPadding: const EdgeInsets.fromLTRB(0,0,0,13.0)),
                                            controller: genderController,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ),
                              Padding( padding: EdgeInsets.fromLTRB(0, screenHeight*0.01, 0, screenHeight*0.035),
                                child:Column(
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: screenWidth*0.29,
                                          // height: screenHeight*0.03,
                                          decoration: BoxDecoration(
                                            // color: Colors.lightBlue
                                          ),
                                          child: Text("Golongan Darah", style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                        ),
                                        Container(
                                          width: screenWidth*0.03,
                                          // height: screenHeight*0.03,
                                          decoration: BoxDecoration(
                                            // color: Colors.limeAccent
                                          ),
                                          child: Text(":", style: TextStyle(fontSize: screenWidth*0.035, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 234, 231, 177))),
                                        ),
                                        Container(
                                          width: screenWidth*0.4,
                                          height: screenHeight*0.035,
                                          padding: EdgeInsets.fromLTRB(screenWidth*0.02, 0, screenWidth*0.02, 0),
                                          decoration: BoxDecoration(
                                            color: Colors.white
                                          ),
                                          child: TextFormField(
                                            decoration: new InputDecoration(
                                              contentPadding: const EdgeInsets.fromLTRB(0,0,0,13.0)),
                                            controller: goldarController,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ),
                              
                              SizedBox(
                                width: screenWidth * 0.25,
                                height: screenHeight * 0.04,
                                child: ElevatedButton(
                                style: ButtonStyle(
                                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                                          (Set<MaterialState> states) {
                                            if (states.contains(MaterialState.pressed))
                                              return Color.fromARGB(138, 60, 98, 85); 
                                          },
                                        ),
                                        backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 234, 231, 177)),
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(5.0),
                                              )
                                        ),
                                      ),
                                      onPressed:() async {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        if (_image == null) {
                                          by = ttlController.text.substring(ttlController.text.length - 4);
                                          int byint = int.parse(by);
                                          try {
                                          User? user = FirebaseAuth.instance.currentUser;
                                          debugPrint(imageUrl);
                                          var collection = FirebaseFirestore.instance.collection('user');
                                            collection 
                                                .doc(user!.uid) 
                                                .update({
                                                  'names' : nameController.text,
                                                  'tanggalL' : ttlController.text,
                                                  'usia' : (nowint - byint).toString(),
                                                  'alamat' : addressController.text,
                                                  'nik' : nikController.text,
                                                  'tempatL' : tlController.text,
                                                  'gender' : genderController.text,
                                                  'goldar' : goldarController.text
                                                })
                                                .then((_) => debugPrint('Success'));
                                                // .catchError((error) => print('Failed: $error'));

                                                usernameus = nameController.text;
                                                tanggallahir = ttlController.text;
                                                age = (nowint - byint).toString();
                                                tempatlahir = tlController.text;
                                                alamatuser = addressController.text;
                                                nikuser = nikController.text;
                                                genderuser = genderController.text;
                                                goldaruser = goldarController.text;
                                                
                                                setState(() {
                                                  isLoading = false;
                                                });
                                                
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(content: Text("Berhasil Menyimpan"+by+now), backgroundColor: Color.fromARGB(255, 0, 255, 8),)
                                                );
                                                Navigator.pushReplacement(
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
                                                  )
                                                );
                                        } catch (error) {
                                          debugPrint;
                                        }}

                                        else if(_image != null){
                                          
                                            by = ttlController.text.substring(ttlController.text.length - 4);
                                            int byint = int.parse(by);
                                            String uniqueFileName =
                                                DateTime.now().millisecondsSinceEpoch.toString();

                                            Reference referenceRoot = FirebaseStorage.instance.ref();
                                            Reference referenceDirImages =
                                                referenceRoot.child('images');

                                            Reference referenceImageToUpload =
                                                referenceDirImages.child(name);
                                              
                                            setState(() {
                                              isLoading = true;
                                            });
                                            try {
                                              User? user = FirebaseAuth.instance.currentUser;
                                              await referenceImageToUpload.putFile(File(_image!.path));
                                              //Success: get the download URL
                                              imageUrl = await referenceImageToUpload.getDownloadURL();
                                              debugPrint(imageUrl);
                                              var collection = FirebaseFirestore.instance.collection('user');
                                                collection 
                                                    .doc(user!.uid) 
                                                    .update({
                                                      'ProfileImage' : imageUrl,
                                                      'names' : nameController.text,
                                                      'tanggalL' : ttlController.text,
                                                      'usia' : (nowint - byint).toString(),
                                                      'alamat' : addressController.text,
                                                      'nik' : nikController.text,
                                                      'tempatL' : tlController.text,
                                                      'gender' : genderController.text,
                                                      'goldar' : goldarController.text
                                                    })
                                                    .then((_) => debugPrint('Success'))
                                                    .catchError((error) => print('Failed: $error'));

                                                    imageuser = imageUrl.toString();
                                                    usernameus = nameController.text;
                                                    tanggallahir = ttlController.text;
                                                    age = (nowint - byint).toString();
                                                    tempatlahir = tlController.text;
                                                    alamatuser = addressController.text;
                                                    nikuser = nikController.text;
                                                    genderuser = genderController.text;
                                                    goldaruser = goldarController.text;
                                                    
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      SnackBar(content: Text("Berhasil Menyimpan"), backgroundColor: Color.fromARGB(255, 0, 255, 8),)
                                                    );
                                                    setState(() {
                                                      isLoading = false;
                                                    });
                                                    Navigator.pushReplacement(
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
                                                      )
                                                    );
                                            } catch (error) {
                                              debugPrint;
                                            }
                                          } 
                                      },
                                      child:
                                        isLoading?
                                        LoadingAnimationWidget.staggeredDotsWave(
                                          color: Color.fromARGB(255, 60, 98, 85),
                                          size: screenHeight*0.04,
                                        ):
                                        Text("Simpan", style:TextStyle(color: Color.fromARGB(255, 60, 98, 85), fontWeight: FontWeight.w900))
                                  ),
                              ),
                            ],
                          )
                      )
                    ))
              ]
            )
          )
        )   
      )
    );
  }
}

