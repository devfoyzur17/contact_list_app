class ContactModel {
  int? id;
  String name;
  String mobile;
  String? email;
  String? streetAddredd;
  String? dateOfBirth;
  String? image;
  String? gender;
  String? website;

  ContactModel(
      {this.id,
      required this.name,
      required this.mobile,
      this.email,
      this.streetAddredd,
      this.dateOfBirth,
      this.image,
      this.gender,
      this.website});
}

List<ContactModel> contactListData = [
  ContactModel(
      name: "Foyzur Rahaman",
      mobile: "01701406710",
      id: 1,
      dateOfBirth: "01/10/2001",
      email: "foyzur17@gmail.com",
      gender: "Male",
      streetAddredd: "Mirpur10, Dhaka",
      website: "devfoyzur.com"),
  ContactModel(
      name: "Rasel Hossen",
      mobile: "01745372849",
      id: 1,
      dateOfBirth: "21/30/2001",
      email: "rasel123@gmail.com",
      gender: "Male",
      streetAddredd: "Mirpur10, Dhaka",
      website: "devrasel.com"),
];
