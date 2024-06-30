import 'package:estibafy_helpers/Controllers/user_controller.dart';
import 'package:estibafy_helpers/Views/pages/Authentication%20Screens/login.dart';
import 'package:estibafy_helpers/Views/pages/sms_verification.dart';
import 'package:estibafy_helpers/models/signup_addresses_list.dart';
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:estibafy_helpers/models/widgets/appbar.dart';
import 'package:estibafy_helpers/models/widgets/input_widget.dart';
import 'package:estibafy_helpers/models/widgets/pressed_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controllers/Authentication Controllers/signup controller.dart';

class SignUpAddresses extends StatefulWidget {
  const SignUpAddresses({Key? key}) : super(key: key);

  @override
  State<SignUpAddresses> createState() => _SignUpAddressesState();
}

class _SignUpAddressesState extends State<SignUpAddresses> {
  SignUpController signUpController = Get.find(tag: K.signUpController);
  final UserController _controller = Get.find(tag: K.userControllerTag);

  TextEditingController addressController = TextEditingController();

  TextEditingController aptController = TextEditingController();

  String? provinceChoose;
  String? cityChoose;
  String? countryChoose;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      backgroundColor: secondaryColor,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              upperLogo(),
              const SizedBox(
                height: 40,
              ),
              input(
                  text: 'Address',
                  prefix: Icons.location_on,
                  controller: addressController,
                  onChanged: (value) {
                    signUpController.address = value;
                  }),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: input4(
                      text: 'Apt',
                      controller: aptController,
                      onChanged: (value) {
                        signUpController.apt = value;
                      },
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 36,
                          child: DropdownButton(
                            value: cityChoose,
                            hint: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text('City', style: textStyle3),
                              ),
                            ),
                            iconSize: 30,
                            isExpanded: true,
                            underline: Container(
                              height: 0,
                              color: Colors.deepPurpleAccent,
                            ),
                            icon: const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.expand_more,
                                color: primaryColor,
                                size: 24,
                              ),
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                cityChoose = newValue!;
                              });
                            },
                            items: cityChooseList.map((valueItems) {
                              return DropdownMenuItem<String>(
                                value: valueItems,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Text(
                                      valueItems,
                                      style: textStyle3,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 17),
                          child: Divider(color: sixthColor.withOpacity(0.8)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 36,
                          child: DropdownButton(
                            value: provinceChoose,
                            hint: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text('Province', style: textStyle3),
                              ),
                            ),
                            iconSize: 30,
                            isExpanded: true,
                            underline: Container(
                              height: 0,
                              color: Colors.deepPurpleAccent,
                            ),
                            icon: const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.expand_more,
                                color: primaryColor,
                                size: 24,
                              ),
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                provinceChoose = newValue!;
                              });
                            },
                            items: provinceChooseList.map((valueItems) {
                              return DropdownMenuItem<String>(
                                value: valueItems,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Text(
                                      valueItems,
                                      style: textStyle3,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 17),
                          child: Divider(color: sixthColor.withOpacity(0.8)),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 36,
                          child: DropdownButton(
                            value: countryChoose,
                            hint: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text('Country', style: textStyle3),
                              ),
                            ),
                            iconSize: 30,
                            isExpanded: true,
                            underline: Container(
                              height: 0,
                              color: Colors.deepPurpleAccent,
                            ),
                            icon: const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.expand_more,
                                color: primaryColor,
                                size: 24,
                              ),
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                countryChoose = newValue!;
                              });
                            },
                            items: countryChooseList.map((valueItems) {
                              return DropdownMenuItem<String>(
                                value: valueItems,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Text(
                                      valueItems,
                                      style: textStyle3,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 17),
                          child: Divider(color: sixthColor.withOpacity(0.8)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              customButton(
                  function: () async {
                    if (signUpController.address == '' ||
                        signUpController.apt == '' ||
                        cityChoose == null ||
                        provinceChoose == null ||
                        countryChoose == null) {
                      K.showToast(message: 'Fill in all the Fields');
                      return;
                    }

                    print('mobile ---------- ${signUpController.phone}');

                    signUpController.city = cityChoose!;
                    signUpController.province = provinceChoose!;
                    signUpController.country = countryChoose!;

                    var location = await UserController.getUserLocation();

                    if (location != null) {
                      var response = await _controller.signUp(
                        name: signUpController.name + "" + signUpController.lastName,
                        email: signUpController.email,
                        phone: signUpController.countryCode + signUpController.phone,
                        password: signUpController.password,
                        passwordConfirm: signUpController.password,
                        lng: location.latitude.toString(),
                        lat: location.longitude.toString(),
                        province:  signUpController.province,
                        country: signUpController.country,
                        city: signUpController.city,
                        aprt: signUpController.apt,
                        imgFile: null
                      );
                      if(response!=null){
                        Get.to(() => const VerificationCode());
                      }
                    } else {
                      K.showToast(
                          message:
                              'Unable to get permission please allow location permission from settings');
                    }
                  },
                  text: 'Sign Up',
                  textColor: secondaryColor,
                  arrowColor: secondaryColor,
                  fillColor: primaryColor,
                  borderColor: primaryColor,
                  height: 55.0,
                  margin: 10.0),
            ],
          ),
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

  upperLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage('assets/logo.png'),
          width: 60,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          'Sign Up',
          style: titleTextStyle.copyWith(fontSize: 36),
        ),
        const SizedBox(
          width: 6,
        ),
      ],
    );
  }
}
