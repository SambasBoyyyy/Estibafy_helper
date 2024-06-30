import 'dart:io';

// import 'package:device_info_plus/device_info_plus.dart';
import 'package:estibafy_helpers/Views/pages/Authentication%20Screens/login.dart';
import 'package:estibafy_helpers/Views/pages/Authentication%20Screens/login_createaccount.dart';
import 'package:estibafy_helpers/Views/pages/navbar.dart';
import 'package:estibafy_helpers/models/Classes/user.dart';
import 'package:estibafy_helpers/models/Classes/web_apis.dart';
import 'package:estibafy_helpers/models/Example%20Object/example_object.dart';
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

import '../models/UserModel/UserModel.dart';
import '../models/fcm_notifications.dart';

class UserController extends GetxController {
  Rx<User> user = ExampleObjects.user.obs;

  // List<dynamic>? list;
  //array
  // List<List<dynamic>>? arrList;
  // Map<String, dynamic>? dictionary;
  // HashMap<dynamic, String>? name;

  late String userToken;

  Future<Map<String, dynamic>?> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirm,
    required String lat,
    required String lng,
    required String aprt,
    required String city,
    required String country,
    required String province,
    File? imgFile,
  }) async {
    print("im going to call apis");

    print("--------------- My Sign Up data  ------------");
    print(name);
    print(email);
    print(phone);
    print(password);
    print(passwordConfirm);
    print("--------------- My Sign Up data  ------------");
    EasyLoading.show();
    final Map<String, dynamic>? result = await WebAPIs.signup(
        name: name,
        email: email,
        phone: phone,
        password: password,
        passwordConfirm: password,
        lat: lat,
        lng: lng,
        aprt: aprt,
        city: city,
        province: province,
        country: country,
        imgFile: imgFile);
    EasyLoading.dismiss();
    if (result != null) {
      user.value = User(
        name: name,
        email: email,
        phoneNumber: phone,
        password: password,
        // passwordConfirm:passwordConfirm,
      );
      K.localStorage.write(K.loggedInUser, result['data']['token']['access_token']);
      userToken = result['data']['token']['access_token'];
      K.localStorage.write(result['data']['token']['access_token'], user.value);
      String? token = await FCMNotifications.messaging.getToken();
      if (token != null) {
        await WebAPIs.sendNotificationToken(token: token);
      }
      return result;
    } else {
      return null;
    }
  }

  void signIn({
    required String email,
    required String password,
  }) async {
    EasyLoading.show();

    String? deviceID;

    // if (Platform.isAndroid) {
    //   AndroidDeviceInfo deviceInfo = await DeviceInfoPlugin().androidInfo;
    //   // deviceID = deviceInfo.androidId;
    //   deviceID = deviceInfo.id;
    // } else if (Platform.isIOS) {
    //   IosDeviceInfo deviceInfo = await DeviceInfoPlugin().iosInfo;
    //   deviceID = deviceInfo.identifierForVendor;
    // }
    deviceID ='1';
    if (deviceID != null) {
      print("im going to call apis");
      final UserData? result = await WebAPIs.signIn(
        email: email,
        password: password,
        deviceID: deviceID,
      );
      print("Here's Response");
      print("---WELCOME--- $result");

      if (result != null) {
        var data = result;

        print("---WELCOME---$data");
        user.value = User(
          name: data.name ?? '',//result['data']['users']['name'],
          email: email,
          phoneNumber: data.mobile ??"",
          password: password,
        );

        // K.localStorage
        //     .write(K.loggedInUser, result['data']['token']['access_token']);
        K.localStorage.write(K.loggedInUser, data.accessToken.toString());
        userToken = data.accessToken.toString();
        K.localStorage.write(data.accessToken.toString(), user.value);

        K.showToast(message: 'Welcome ${data.name}');
        Get.offAll(() => const NavBar());
        String? token = await FCMNotifications.messaging.getToken();
        print("the fcm token ${token}");
        if (token != null) {
          WebAPIs.sendNotificationToken(token: token);
        }
      }
    }

    EasyLoading.dismiss();
  }

  Future<void> otpVerify({
    required String otp,
    required String mobile,
  }) async {
    EasyLoading.show();

    String? deviceID;

    // if (Platform.isAndroid) {
    //   AndroidDeviceInfo deviceInfo = await DeviceInfoPlugin().androidInfo;
    //   // deviceID = deviceInfo.androidId;
    //   deviceID = deviceInfo.id;
    // } else if (Platform.isIOS) {
    //   IosDeviceInfo deviceInfo = await DeviceInfoPlugin().iosInfo;
    //   deviceID = deviceInfo.identifierForVendor;
    // }
    deviceID ='1';
    if (deviceID != null) {
      print("im going to call apis");
      final Map<String, dynamic>? result = await WebAPIs.otpVerify(
        otpCode: otp,
        mobile: mobile,
        deviceID: deviceID,
      );

      if (result != null) {
        // user.value = User(
        //   name: result['data']['user']['name'],
        //   email: email,
        //   phoneNumber: result['data']['user']['name'],
        //   password: password,
        // );

        // K.localStorage
        //     .write(K.loggedInUser, result['data']['token']['access_token']);
        // userToken = result['data']['token']['access_token'];
        // K.localStorage
        //     .write(result['data']['token']['access_token'], user.value);
        K.showToast(message: '${result['message']}');
        Get.offAll(() => const Login());
        String? token = await FCMNotifications.messaging.getToken();
        if (token != null) {
          WebAPIs.sendNotificationToken(token: token);
        }
      }
    }

    EasyLoading.dismiss();
  }

  Future<void> resendOTP({
    required String mobile,
  }) async {
    EasyLoading.show();

    String? deviceID;

    // if (Platform.isAndroid) {
    //   AndroidDeviceInfo deviceInfo = await DeviceInfoPlugin().androidInfo;
    //   // deviceID = deviceInfo.androidId;
    //   deviceID = deviceInfo.id;
    // } else if (Platform.isIOS) {
    //   IosDeviceInfo deviceInfo = await DeviceInfoPlugin().iosInfo;
    //   deviceID = deviceInfo.identifierForVendor;
    // }
    deviceID ='1';
    if (deviceID != null) {
      print("im going to call apis");
      final Map<String, dynamic>? result = await WebAPIs.resendOtp(
        mobile: mobile,
        deviceID: deviceID,
      );

      if (result != null) {
        // user.value = User(
        //   name: result['data']['user']['name'],
        //   email: email,
        //   phoneNumber: result['data']['user']['name'],
        //   password: password,
        // );

        // K.localStorage
        //     .write(K.loggedInUser, result['data']['token']['access_token']);
        // userToken = result['data']['token']['access_token'];
        // K.localStorage
        //     .write(result['data']['token']['access_token'], user.value);

        K.showToast(message: '${result['message']}');
        // Get.offAll(() => const NavBar());
        String? token = await FCMNotifications.messaging.getToken();
        print("fcm token is "+ token!);
        if (token != null) {
          WebAPIs.sendNotificationToken(token: token);
        }
      }
    }

    EasyLoading.dismiss();
  }

  void signOut() async {
    EasyLoading.show();

    //  bool result = await WebAPIs.signOut(userToken);
    //if (result == true) {
    K.localStorage.remove(K.loggedInUser);
    K.localStorage.remove(userToken);
    Get.offAll(() => const LoginOrCreateAccount());
    K.showToast(message: 'Logged Out Successfully');
    //  }

    EasyLoading.dismiss();
  }


  static Future<LocationData?> getUserLocation() async {
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    return await location.getLocation();
  }


}
