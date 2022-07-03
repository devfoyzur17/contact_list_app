 

import 'dart:io';

import 'package:animations/animations.dart';
import 'package:contact_list_app/models/contact_model.dart';
import 'package:contact_list_app/providers/contact_provider.dart';
import 'package:flutter/material.dart';

import '../pages/contact_details_page.dart';

class SingleContctItem extends StatelessWidget {
  final ContactProvider provider;
  final ContactModel contact;
  int index;
  SingleContctItem({Key? key, required this.provider, required this.contact, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
               closedElevation: 0,
               closedColor: Colors.white10,
               openColor: Colors.deepOrange, 
               openElevation: 0,
                transitionDuration: Duration(seconds: 1),
                  closedBuilder: (context, closeContainer) {
                    return Card(
                        shadowColor: Colors.deepOrange.withOpacity(0.3),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          onTap:closeContainer,
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: contact.image == null
                                ? (contact.gender == "Female"
                                    ? Image.asset("assets/images/female.png",
                                        height: 50, width: 50, fit: BoxFit.cover)
                                    : Image.asset("assets/images/male.png",
                                        height: 50, width: 50, fit: BoxFit.cover))
                                : Image.file(
                                    File(contact.image.toString()),
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover),
                          ),
                          title: Text(
                            contact.name,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1,
                                wordSpacing: 1),
                          ),
                        ));
                  },
                openBuilder: (context, OpenContainer){
          
               
                return  ContactDetailsPage(
                  index: index,
                     contact: contact,
                );
          
                });
  }
}