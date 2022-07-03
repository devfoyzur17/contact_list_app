// ignore_for_file: prefer_const_constructors, use_function_type_syntax_for_parameters

import 'package:animations/animations.dart';
import 'package:contact_list_app/pages/new_contact_page.dart';
import 'package:contact_list_app/providers/contact_provider.dart';
import 'package:contact_list_app/widged/single_contact_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      body: PageTransitionSwitcher(
          transitionBuilder: (Widget child, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: Consumer<ContactProvider>(
            builder: (BuildContext context, provider, _) => ListView.builder(
              itemCount: provider.contactList.length,
              itemBuilder: (context, index) => SingleContctItem(
                provider: provider,
                contact: provider.contactList[index],
                index: index,
              ),
            ),
          )),
      floatingActionButton: OpenContainer(
          transitionDuration: Duration(seconds: 1),
          closedColor: Colors.deepOrange,
          closedElevation: 0,
          closedShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          closedBuilder: (context, openWidget()) {
            return FloatingActionButton(
              elevation: 0,
              onPressed: () {
                openWidget();
              },
              child: Icon(Icons.add),
            );
          },
          openBuilder: (context, closeWidget) {
            return NewContactPage();
          }),
    );
  }
}
