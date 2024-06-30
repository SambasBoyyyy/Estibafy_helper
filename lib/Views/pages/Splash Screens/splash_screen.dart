import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../Authentication Screens/login_createaccount.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
          duration: 3000,
          splash: 'assets/estibafyfulllogo.jpeg',
          splashIconSize: 200,
          nextScreen: const LoginOrCreateAccount(),
          splashTransition: SplashTransition.scaleTransition,
          pageTransitionType: PageTransitionType.scale,
          backgroundColor: secondaryColor),
    );
  }
}
