import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../models/utils/constant.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isChecked = false;
  bool isPasswordVisible = true;
  String email = '';
  String password = '';

  //ali@gmail.coml.com
  //123456
  getAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            FontAwesomeIcons.arrowCircleLeft,
            color: primaryColor,
          )),
    );
  }
}
