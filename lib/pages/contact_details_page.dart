// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:contact_list_app/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetailsPage extends StatefulWidget {
  static const routeName = "/contact-details-page";
  final ContactModel contact;
  ContactDetailsPage({Key? key, required this.contact}) : super(key: key);

  @override
  State<ContactDetailsPage> createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {
  //late ContactModel contact;
  Size? size;

  @override
  void didChangeDependencies() {
    //contact = ModalRoute.of(context)!.settings.arguments as ContactModel;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        title: Text("Contact Details"),
      ),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: size!.width,
                height: 280,
                decoration: BoxDecoration(color: Colors.deepOrange),
              ),
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: widget.contact.image == null
                        ? (widget.contact.gender == "Female"
                            ? Image.asset("assets/images/female.png",
                                height: 200, width: 200, fit: BoxFit.cover)
                            : Image.asset("assets/images/male.png",
                                height: 200, width: 200, fit: BoxFit.cover))
                        : Image.file(File(widget.contact.image.toString()),
                            height: 200, width: 200, fit: BoxFit.cover),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.contact.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        letterSpacing: 1,
                        wordSpacing: 1),
                  )
                ],
              ),
            ],
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 2,
            color: Color(0xffffebe6),
            shadowColor: Colors.black,
            child: ListTile(
              title: Text(
                widget.contact.mobile,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    letterSpacing: 1),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: _makePhoneCall,
                      icon: Icon(
                        Icons.phone,
                        color: Colors.black87,
                      )),
                  IconButton(
                      onPressed: _makeMesage,
                      icon: Icon(
                        Icons.message,
                        color: Colors.black87,
                      )),
                ],
              ),
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 2,
            color: Color(0xffffebe6),
            shadowColor: Colors.black,
            child: ListTile(
              title: Text(
                widget.contact.email == null || widget.contact.email!.isEmpty
                    ? "No email added!"
                    : widget.contact.email.toString(),
                style: widget.contact.email == null ||
                        widget.contact.email!.isEmpty
                    ? TextStyle(color: Colors.grey)
                    : TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        letterSpacing: 1),
              ),
              trailing: IconButton(
                  onPressed: _makeEmail,
                  icon: widget.contact.email == null ||
                          widget.contact.email!.isEmpty
                      ? Icon(
                          Icons.edit,
                          color: Colors.black87,
                        )
                      : Icon(
                          Icons.email_outlined,
                          color: Colors.black87,
                        )),
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 2,
            color: Color(0xffffebe6),
            shadowColor: Colors.black,
            child: ListTile(
              title: Text(
                widget.contact.streetAddredd == null ||
                        widget.contact.streetAddredd!.isEmpty
                    ? "No location added!"
                    : widget.contact.streetAddredd.toString(),
                style: widget.contact.streetAddredd == null ||
                        widget.contact.streetAddredd!.isEmpty
                    ? TextStyle(color: Colors.grey)
                    : TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        letterSpacing: 1),
              ),
              trailing: IconButton(
                  onPressed: _makeCurrentLocation,
                  icon: widget.contact.streetAddredd == null ||
                          widget.contact.streetAddredd!.isEmpty
                      ? Icon(
                          Icons.edit,
                          color: Colors.black87,
                        )
                      : Icon(
                          Icons.location_on_outlined,
                          color: Colors.black87,
                        )),
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 2,
            color: Color(0xffffebe6),
            shadowColor: Colors.black,
            child: ListTile(
              title: Text(
                widget.contact.website == null ||
                        widget.contact.website!.isEmpty
                    ? "No website added!"
                    : widget.contact.website.toString(),
                style: widget.contact.website == null ||
                        widget.contact.website!.isEmpty
                    ? TextStyle(color: Colors.grey)
                    : TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        letterSpacing: 1),
              ),
              trailing: IconButton(
                  onPressed: _makeWebsite,
                  icon: widget.contact.website == null ||
                          widget.contact.website!.isEmpty
                      ? Icon(
                          Icons.edit,
                          color: Colors.black87,
                        )
                      : Icon(
                          Icons.language,
                          color: Colors.black87,
                        )),
            ),
          ),
        ],
      ),
    );
  }

  void _makePhoneCall() async {
    final url = Uri(scheme: 'tel', path: widget.contact.mobile);
    if (await canLaunchUrl(url)) {
      launchUrl(url);
    } else {
      throw "Something wrong";
    }
  }

  void _makeEmail() async {
    final url = Uri(scheme: 'mailto', path: widget.contact.email);
    if (url != null) {
      await launchUrl(url);
    } else {
      throw "Something wrong";
    }
  }

  void _makeMesage() async {
    final url = Uri(scheme: 'sms', path: widget.contact.mobile);
    if (await canLaunchUrl(url)) {
      launchUrl(url);
    } else {
      throw "Something wrong";
    }
  }

  void _makeWebsite() async {
    final url = Uri(scheme: 'https', path: widget.contact.website);
    if (url != null) {
      launchUrl(url);
    } else {
      throw "Something wrong";
    }
  }

  void _makeCurrentLocation() async {
    final url = Uri.parse("geo:0,0?q=${widget.contact.streetAddredd}");
    if (url != null) {
      launchUrl(url);
    } else {
      throw "Something wrong";
    }
  }
}
