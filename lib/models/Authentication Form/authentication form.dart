import 'package:country_code_picker/country_code_picker.dart';
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:estibafy_helpers/models/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../Controllers/Authentication Controllers/login controller.dart';
import '../../Controllers/Authentication Controllers/signup controller.dart';
import '../../Controllers/user_controller.dart';
import '../../Views/pages/Authentication Screens/signup.dart';
import '../../Views/pages/Authentication Screens/signup_address.dart';
import '../utils/constant.dart';
import '../utils/constant.dart';
import '../widgets/pressed_widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/estibafyfulllogo.jpeg'),
                width: 350,
              ),
              const SizedBox(
                height: 80,
              ),
              input(
                  text: 'Email',
                  prefix: Icons.mail,
                  controller: loginController.emailController,
                  onChanged: (value) {
                    loginController.email = value;
                    print("------------Email --------------:" +
                        loginController.email);
                  }),
              input(
                obscure: loginController.isPasswordVisible,
                text: 'Password',
                onChanged: (value) {
                  print("------------ Password --------------: " + value);
                  loginController.password = value;
                },
                prefix: Icons.vpn_key_outlined,
                controller: loginController.passwordController,
                suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        if (loginController.isPasswordVisible == true) {
                          loginController.isPasswordVisible = false;
                        } else {
                          loginController.isPasswordVisible = true;
                        }
                      });
                    },
                    icon: const Icon(
                      FontAwesomeIcons.eye,
                      size: 20,
                      color: tenthColor,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: Transform.scale(
                      scale: 0.9,
                      child: Theme(
                        data: ThemeData(unselectedWidgetColor: fourthColor),
                        child: Checkbox(
                          checkColor: secondaryColor,
                          focusColor: primaryColor,
                          hoverColor: secondaryColor,
                          activeColor: primaryColor,
                          value: loginController.isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              loginController.isChecked = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "I Agree to Terms & Conditions and Privacy Policy",
                    style: textStyle2.copyWith(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
        Expanded(
            child: Column(
              children: [
                customButton(
                    function: () {
                      print(loginController.email);
                      if (loginController.password == '') {
                        K.showToast(message: "Password can't be empty");
                      } else if (loginController.email == '') {
                        K.showToast(message: 'Invalid Email');
                      } else {
                        UserController _controller =
                        Get.find(tag: K.userControllerTag);
                        _controller.signIn(
                          email: loginController.email,
                          password: loginController.password,
                        );
                      }
                      //  Get.to(const NavBar());
                    },
                    text: 'Log in',
                    textColor: secondaryColor,
                    arrowColor: secondaryColor,
                    fillColor: primaryColor,
                    borderColor: primaryColor,
                    height: 55.0,
                    margin: 10.0),
                const SizedBox(
                  height: 13,
                ),
                Container(
                  height: 55,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextButton(
                    onPressed: () {
                      Get.to(const SignUp());
                    },
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(color: primaryColor, width: 0.5),
                        )),
                    child: Text(
                      'Create Account',
                      style: textStyle3.copyWith(
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  SignUpController signUpController = Get.find(tag: K.signUpController);

  int cupertinoTabBarIIIValueGetter() =>
      signUpController.cupertinoTabBarIIIValue.value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        upperLogo(),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          height: 20,
        ),
        input(
            text: 'Name',
            prefix: Icons.person,
            controller: signUpController.nameController,
            onChanged: (value) {
              signUpController.name = value;
            }),
        input(
            text: 'Last Name',
            prefix: Icons.person,
            controller: signUpController.lastNameController,
            onChanged: (value) {
              signUpController.lastName = value;
            }),
        input(
            text: 'Email',
            prefix: Icons.email,
            controller: signUpController.emailController,
            onChanged: (value) {
              signUpController.email = value;
            }),
        Row(
          children: [
            CountryCodePicker(
              initialSelection: 'ec',
              onChanged: (value){
                signUpController.countryCode = value.dialCode!;
              },
              // showFlag: false,
            ),
            Expanded(
              child: Column(
                children: [
                  TextField(
                    controller: signUpController.mobileController,
                    cursorColor: primaryColor,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: "Enter your number",
                      hintStyle: textStyle3,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    ),
                    textAlign: TextAlign.center,
                    style: textStyle3,
                    onChanged: (value){
                      signUpController.phone = value;
                    },
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
        // input(
        //     text: 'Mobile Number',
        //     prefix: Icons.phone_android_outlined,
        //     controller: signUpController.mobileController,
        //     inputType: TextInputType.phone,
        //     onChanged: (value) {
        //       signUpController.phone = value;
        //     }),
        input(
            obscure: signUpController.isPasswordVisible,
            text: 'Password',
            prefix: Icons.vpn_key_outlined,
            controller: signUpController.passwordController,
            suffix: IconButton(
                onPressed: () {
                  setState(() {
                    if (signUpController.isPasswordVisible == true) {
                      signUpController.isPasswordVisible = false;
                    } else {
                      signUpController.isPasswordVisible = true;
                    }
                  });
                },
                icon: const Icon(
                  FontAwesomeIcons.eye,
                  size: 20,
                  color: tenthColor,
                )),
            onChanged: (value) {
              signUpController.password = value;
            }),
        const SizedBox(
          height: 40,
        ),
        customButton(
            function: () {
              if (signUpController.name == '' ||
                  signUpController.lastName == '' ||
                  signUpController.email == '' ||
                  signUpController.phone == '' ||
                  signUpController.password == '') {
                K.showToast(message: 'Please fill all Fields');
                return;
              }

              if (!signUpController.email.contains('@') ||
                  !signUpController.email.contains('.')) {
                K.showToast(message: 'Email Invalid');
                return;
              }

              if (signUpController.password.length < 8) {
                K.showToast(
                    message: 'Password should be at least 8 characters long');
                return;
              }
              // else {
              //   UserController _controller = Get.find(tag: K.userControllerTag);
              //   _controller.signUp(
              //     name: signUpController.name + "" + signUpController.lastName,
              //     email: signUpController.email,
              //     phone: signUpController.countryCode+signUpController.phone,
              //     password: signUpController.password,
              //     passwordConfirm: signUpController.password,
              //   );
              // }

              Get.to(() => const SignUpAddresses());
            },
            text: 'Sign Up',
            textColor: secondaryColor,
            arrowColor: secondaryColor,
            fillColor: primaryColor,
            borderColor: primaryColor,
            height: 55.0,
            margin: 10.0),
      ],
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
