import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  RxInt cupertinoTabBarIIIValue = 0.obs;
  bool isPasswordVisible = true;

  // User Details
  String email = '';
  String phone = '';
  String name = '';
  String lastName = '';
  String govtId = '';
  String password = '';

  // Address
  String address = '';
  String apt = '';
  String city = '';
  String province = '';
  String country = '';

  // Selfie
  File? selfie;

  // Required Docs
  List<File> requiredDocs = [];

  // Govt ID
  String idNumber = '';
  String month = '';
  String year = '';
  File? govtIdFront;
  File? govtIdBack;

  bool checkBox = false;

  String countryCode = "+593";
  // Person SignUp Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
}
