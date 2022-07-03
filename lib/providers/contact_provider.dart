import 'package:contact_list_app/models/contact_model.dart';
import 'package:flutter/material.dart';

class ContactProvider with ChangeNotifier {
  List<ContactModel> contactList = [];

  void getAllContact() {
    contactList = contactListData;
    notifyListeners();
  }

  void addContact(ContactModel contactModel) {
    contactList.add(contactModel);
    notifyListeners();
  }

  void updateInformation(ContactModel contact, int index){

      contactList[index] = contact;
      notifyListeners();

  }
}
