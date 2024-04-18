import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier {
  List<ProfileModel> profileList = [
    ProfileModel(icon: 'assets/icons/refer.png', title: 'Refer A Friend'),
    ProfileModel(icon: 'assets/icons/about_us.png', title: 'About Us'),
    ProfileModel(icon: 'assets/icons/language.png', title: 'Language'),
    ProfileModel(
        icon: 'assets/icons/document.png', title: 'Supporting Document'),
    ProfileModel(icon: 'assets/icons/warranty.png', title: 'Warranty'),
    ProfileModel(icon: 'assets/icons/logout.png', title: 'Log Out'),
  ];
}

class ProfileModel {
  String icon;
  String title;

  ProfileModel({required this.icon, required this.title});
}
