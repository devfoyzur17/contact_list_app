// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewContactPage extends StatefulWidget {
  static const routeName = "/new-contact-page";
  const NewContactPage({Key? key}) : super(key: key);

  @override
  State<NewContactPage> createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final streetAddressController = TextEditingController();
  final websiteController = TextEditingController();
  String groupValue = "";

  @override
  void dispose() {
     nameController.dispose();
     mobileController.dispose();
     emailController.dispose();
     streetAddressController.dispose();
     websiteController.dispose();
    super.dispose();
  }

  String? imagePatch;
  ImageSource source = ImageSource.camera;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Contact")),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Stack(
              children: [
                Center(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: imagePatch == null
                          ? Image.asset(
                              "assets/images/male.png",
                              height: 100,
                              width: 100,
                              alignment: Alignment.center,
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              File(
                                imagePatch!,
                              ),
                              height: 100,
                              width: 100,
                              alignment: Alignment.center,
                              fit: BoxFit.cover,
                            )),
                ),
                Positioned(
                    bottom: 0,
                    right: (MediaQuery.of(context).size.width / 2) - 70,
                    child: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    elevation: 10,
                                    actions: [
                                      ListTile(
                                        onTap: () {
                                          source = ImageSource.camera;
                                          _getImage();
                                          Navigator.of(context).pop();
                                        },
                                        title: Icon(
                                          Icons.camera_alt_outlined,
                                          color: Colors.deepOrange,
                                        ),
                                        subtitle: Text(
                                          "Capture from camera",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Divider(),
                                      ListTile(
                                        onTap: () {
                                          source = ImageSource.gallery;
                                          _getImage();
                                          Navigator.of(context).pop();
                                        },
                                        title: Icon(
                                          Icons.photo_library_outlined,
                                          color: Colors.deepOrange,
                                        ),
                                        subtitle: Text(
                                          "Capture from Gallery",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ));
                        },
                        icon: Icon(
                          Icons.add_a_photo,
                          color: Colors.black,
                        )))
              ],
            ),
            SizedBox(height: 15,),

            TextField(
              controller: nameController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffffe6e6),
                        contentPadding: EdgeInsets.only(left: 10),
                        focusColor: Colors.white,
                        prefixIcon: Icon(
                          Icons.account_circle_outlined,
                          color: Colors.deepOrange,
                        ),
                        
                        hintText: "Enter your full name",
                        hintStyle: TextStyle(color: Colors.deepOrange),
                        
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20))),
                  ),


                  
            SizedBox(height: 15,),

            TextField(
              controller: mobileController,
              keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffffe6e6),
                        contentPadding: EdgeInsets.only(left: 10),
                        focusColor: Colors.white,
                        
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.deepOrange,
                        ),
                        
                        hintText: "Enter your mobile number",
                        hintStyle: TextStyle(color: Colors.deepOrange),
                        
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  
            SizedBox(height: 15,),

            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffffe6e6),
                        contentPadding: EdgeInsets.only(left: 10),
                        focusColor: Colors.white,
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.deepOrange,
                        ),
                        
                        hintText: "Enter your email address",
                        hintStyle: TextStyle(color: Colors.deepOrange),
                        
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  
            SizedBox(height: 15,),

            TextField(
              controller: websiteController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffffe6e6),
                        contentPadding: EdgeInsets.only(left: 10),
                        focusColor: Colors.white,
                        prefixIcon: Icon(
                          Icons.language,
                          color: Colors.deepOrange,
                        ),
                        
                        hintText: "Enter your website link",
                        hintStyle: TextStyle(color: Colors.deepOrange),
                        
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20))),
                  ),


 SizedBox(height: 15,),

            TextField(
              controller: streetAddressController,
              
              maxLines: 1,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffffe6e6),
                        contentPadding: EdgeInsets.only(left: 10),
                        focusColor: Colors.white,
                        prefixIcon: Icon(
                          Icons.location_city,
                          color: Colors.deepOrange,
                        ),
                        
                        hintText: "Enter your street address",
                        hintStyle: TextStyle(color: Colors.deepOrange),
                        
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20))),
                  ),

                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text("Gender:>>", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, ),),
                    SizedBox(width: 20,),
                       Radio<String>(
                          value: "Male",
                          groupValue: groupValue,
                          fillColor:MaterialStateColor.resolveWith((states) => groupValue == "Male" ? Colors.red: Colors.blue),
                          onChanged: (value) {
                            setState(() {
                              groupValue = value as String;
                            });
                             
                          },
                         
                        ),
                        
                         Text("Male", style: TextStyle(color: groupValue == "Male" ? Colors.red: Colors.blue),),
                           SizedBox(width: 10,),
                       Radio<String>(
                          value: "Female",
                          groupValue: groupValue,
                          fillColor:MaterialStateColor.resolveWith((states) => groupValue == "Female" ? Colors.red: Colors.blue),
                          onChanged: (value) {
                            setState(() {
                              groupValue = value as String;
                            });
                             
                          },
                         
                        ),
                        
                         Text("Female", style: TextStyle(color: groupValue == "Female" ? Colors.red: Colors.blue),)
                    
                    


                    ],
                  )


          ],
        ),
      ),
    );
  }

  void _getImage() async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        imagePatch = pickedImage.path;
      });
    }
  }
}
