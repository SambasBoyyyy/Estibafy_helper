import 'dart:async';

import 'package:estibafy_helpers/Controllers/user_controller.dart';
import 'package:estibafy_helpers/Views/pages/Authentication%20Screens/signup_takeaselfie.dart';
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../Controllers/Authentication Controllers/signup controller.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({Key? key}) : super(key: key);

  @override
  _VerificationCodeState createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  SignUpController signUpController = Get.find(tag: K.signUpController);
  TextEditingController textEditingController = TextEditingController();

  int secondsRemaining = 60;
  bool enableResend = true;
  Timer? timer;

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: getAppBar(context),
      backgroundColor: secondaryColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  'SMS Verification Code',
                  style: textStyle1.copyWith(fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                    'Please type verification code sent to ${signUpController.phone}',
                    style: textStyle2),
              ),
              const SizedBox(
                height: 60,
              ),
              Form(
                key: formKey,
                child: PinCodeTextField(
                  appContext: context,
                  pastedTextStyle: textStyle3,
                  length: 6,
                  obscureText: false,
                  obscuringCharacter: '•',
                  textStyle: textStyle3,
                  blinkWhenObscuring: true,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.underline,
                    borderRadius: BorderRadius.circular(12),
                    borderWidth: 1,
                    // fieldWidth: 30,
                    activeFillColor: Colors.transparent,
                    inactiveColor: tertiaryColor,
                    inactiveFillColor: Colors.transparent,
                    selectedColor: tertiaryColor,
                    disabledColor: fourthColor,
                  ),
                  cursorColor: tertiaryColor,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: false,
                  errorAnimationController: errorController,
                  controller: textEditingController,
                  keyboardType: TextInputType.number,
                  onCompleted: (v) async {
                    UserController _controller = Get.find(tag: K.userControllerTag);
                    await _controller.otpVerify(mobile: signUpController.phone, otp: textEditingController.text);
                    // Get.to(() => const SignUpTakeASelfie());
                  },
                  onTap: () {
                    if (kDebugMode) {
                      print("Pressed");
                    }
                  },
                  onChanged: (value) {
                    if (kDebugMode) {
                      print(value);
                    }
                    setState(() {
                      currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    if (kDebugMode) {
                      print("Allowing to paste $text");
                    }
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                ),
              ),
              SizedBox(height: size.height * 0.06),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "I didn’t receive a code! ",
                    style: textStyle2.copyWith(color: tenthColor),
                  ),

                  enableResend
                      ? InkWell(
                          onTap: () async {
                            UserController _controller = Get.find(tag: K.userControllerTag);
                              await _controller.resendOTP(mobile: signUpController.phone,);
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Text(
                            "resend otp",
                            style: textStyle2.copyWith(color: tertiaryColor),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            // startTimer();
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Text(
                            "after $secondsRemaining seconds",
                            style: textStyle2.copyWith(color: tertiaryColor),
                          ),
                        ),
                  // InkWell(
                  //   onTap: () {},
                  //   borderRadius: BorderRadius.circular(10),
                  //   child: Text(
                  //     "Please resend ",
                  //     style: textStyle2.copyWith(color: tertiaryColor),
                  //   ),
                  // ),
                  // IconButton(
                  //   onPressed: () {
                  //     Get.to(const SignUpTakeASelfie());
                  //   },
                  //   icon: const Icon(
                  //     FontAwesomeIcons.arrowCircleRight,
                  //     size: 26,
                  //   ),
                  //   color: fourthColor,
                  // ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  getAppBar(BuildContext context) {
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
