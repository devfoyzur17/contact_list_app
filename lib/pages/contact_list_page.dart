// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:contact_list_app/models/contact_model.dart';
import 'package:contact_list_app/pages/contact_details_page.dart';
import 'package:contact_list_app/pages/new_contact_page.dart';
import 'package:flutter/material.dart';

class ContactListPage extends StatefulWidget {
  static const routeName = "/";
  const ContactListPage({Key? key}) : super(key: key);

  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ContactList")),
      body: ListView.builder(
          itemCount: contactListData.length,
          itemBuilder: (context, index) => Card(
            shadowColor: Colors.deepOrange.withOpacity(0.3),
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: ListTile(

                  onTap: (){
                    Navigator.of(context).pushNamed(ContactDetailsPage.routeName, arguments: contactListData[index]);
                  },

                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: contactListData[index].image == null
                        ? (contactListData[index].gender == "Male"?  Image.asset("assets/images/male.png", height: 50,width: 50,fit: BoxFit.cover):Image.asset("assets/images/female.png", height: 50,width: 50,fit: BoxFit.cover))
                        : Image.file(
                            File(contactListData[index].image.toString()), height: 50,width: 50,fit: BoxFit.cover),
                  ),
                  title: Text(contactListData[index].name, style: TextStyle(fontWeight: FontWeight.w500, letterSpacing: 1,wordSpacing: 1),),
                ),
              )),
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        onPressed: () {
          Navigator.of(context)
              .pushNamed(NewContactPage.routeName)
              .then((value) {
            setState(() {});
          });
        },
        child: Icon(
          Icons.add,
          size: 32,
        ),
      ),
    );
  }
}
