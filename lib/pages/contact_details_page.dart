 
import 'package:flutter/material.dart';
class ContactDetailsPage extends StatefulWidget {
   static const routeName = "/contact-details-page";
  const ContactDetailsPage({Key? key}) : super(key: key);

  @override
  State<ContactDetailsPage> createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Details"),
      ),
    );
  }
}