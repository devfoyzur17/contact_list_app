// ignore_for_file: prefer_const_constructors

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
      body: Container(),
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        onPressed: () {
          Navigator.of(context).pushNamed(NewContactPage.routeName);
          
        },
        child: Icon(
          Icons.add,
          size: 32,
        ),
      ),
    );
  }
}
