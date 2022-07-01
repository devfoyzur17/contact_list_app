// ignore_for_file: prefer_const_constructors

import 'package:contact_list_app/pages/contact_details_page.dart';
import 'package:contact_list_app/pages/contact_list_page.dart';
import 'package:contact_list_app/pages/new_contact_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: ContactListPage.routeName,
      routes: {
        ContactListPage.routeName :(context) => ContactListPage(),
        NewContactPage.routeName :(context) => NewContactPage(), 
      },
    );
  }
}
 