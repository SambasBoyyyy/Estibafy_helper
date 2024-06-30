import 'package:estibafy_helpers/models/Authentication%20Form/authentication%20form.dart';
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:estibafy_helpers/models/widgets/appbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controllers/Authentication Controllers/signup controller.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  SignUpController signUpController =
      Get.put(SignUpController(), tag: K.signUpController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      backgroundColor: secondaryColor,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14),
        child: const SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SignUpForm(),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: Align(
          alignment: Alignment.topCenter,
          child: RichText(
            text: TextSpan(
              text: 'Already a member?',
              style: textStyle2,
              children: <TextSpan>[
                TextSpan(
                  text: '  Log in',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.to(const Login()),
                  style: textStyle2.copyWith(
                      color: tertiaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w200),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
