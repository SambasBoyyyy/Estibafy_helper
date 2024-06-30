import 'dart:io';

import 'package:dismiss_keyboard_on_tap/dismiss_keyboard_on_tap.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Views/pages/Authentication Screens/login.dart';
import 'Views/pages/Authentication Screens/login_createaccount.dart';
import 'Views/pages/Authentication Screens/signup.dart';
import 'Views/pages/Authentication Screens/signup_documents.dart';
import 'Views/pages/Authentication Screens/signup_government_id.dart';
import 'Views/pages/Authentication Screens/signup_takeaselfie.dart';
import 'Views/pages/Splash Screens/splash.dart';
import 'Views/pages/job_failed_by_customer.dart';
import 'Views/pages/navbar.dart';
import 'firebase_options.dart';
import 'models/fcm_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();

  if (await FCMNotifications.permissionGranted()) {
    FirebaseMessaging.onBackgroundMessage(
        FCMNotifications.firebaseMessagingBackgroundHandler);

    if (Platform.isIOS) {
      await FCMNotifications.handleForegroundIOS();
    } else if (Platform.isAndroid) {
      await FCMNotifications.setupLocalNotifications();
      FirebaseMessaging.onMessage
          .listen(FCMNotifications.handleForegroundNotificationsAndroid);
    }

    String? meow = await FirebaseMessaging.instance.getToken();
    print(meow);
  }

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DismissKeyboardOnTap(
      child: GetMaterialApp(
        title: 'Estibafy App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.sourceSans3TextTheme(),
        ),
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const Splash(),
          '/loginOrCreateAccount': (context) => const LoginOrCreateAccount(),
          '/login': (context) => const Login(),
          '/signup': (context) => const SignUp(),
          '/navBar': (context) => const NavBar(),
          '/signUpTakeASelfie': (context) => const SignUpTakeASelfie(),
          '/signUpDocuments': (context) => const SignUpDocuments(),
          '/signUpGovernmentID': (context) => const SignUpGovernmentID(),
          '/jobFailedByCustomer': (context) => JobFailedByCustomer(),
        },
        builder: EasyLoading.init(),
      ),
    );
  }
}
