import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../Controllers/user_controller.dart';
import '../JobDetail/JobDetailModel.dart';
import '../UserModel/UserModel.dart';

class WebAPIs {
  //static String baseURL = 'https://container.linktoeat.com/api/helper/';
  static String baseURL =
      'http://149.102.158.40/container/public/index.php/api/helper/';

  static Future<void> sendNotificationToken({
    required String token,
  }) async {
    Map<String, String> body = {
      "fcm_token": token,
    };
    Response r = await post(
      Uri.parse(
          'http://149.102.158.40/container/public/index.php/api/fcmtoken/add'),
      headers: getAuthHeader(),
      body: body,
    );
    print("fcm token added ${r.body}");
  }

  static Future<bool> setJobStatus({
    required String id,
    required String image,
    required String status,
  }) async {
    Map<String, String> body = {
      'job_id': id,
      // 'images': image,
      'status': status,
    };
    print("calling api");
    Response r;
    if (status == 'cometed') {// 'completed'
      print("In completedddd");
       r = await post(
        Uri.parse(baseURL + 'job/completed'),
        body: body,
        headers: getAuthHeader(),
      );
    } else {
       r = await post(
        Uri.parse(baseURL + 'job/action/status'),
        body: body,
        headers: getAuthHeader(),
      );
    }

    if (validateResponse(r)) {
      return true;
    }
    return false;
  }

  static Future<bool> addGovtData({
    required String id,
    required String image,
    required String expiryDate,
  }) async {
    Map<String, String> body = {
      'id_no': id,
      'image': image,
      'expire_date': expiryDate,
    };
    print("calling api");
    Response r = await post(
      Uri.parse(baseURL + 'submit/goverment'),
      body: body,
      headers: getAuthHeader(),
    );
    print(r.body);

    if (validateResponse(r)) {
      return true;
    }
    return false;
  }

  static Future<Map<String, dynamic>?> signup({
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
    Map<String, String> body = {
      'name': name,
      'email': email,
      'mobile': phone,
      'password': password,
      'password_confirm': password,
      'latitude': lat,
      'longitude': lng,
      'apartment': aprt,
      'city': city,
      'country': country,
      'province': province,
      'image': province,
    };
    print("calling api");
    Response r = await post(Uri.parse(baseURL + 'signup'), body: body);
    // Response r = await post(
    //   Uri.parse(
    //     baseURL +
    //         'signup?name=$name&email=$email&mobile=$phone&password=$password&password_confirm=$password&latitude=54.5454&longitude=76.545',
    //   ),
    // );

    if (validateResponse(r)) {
      return json.decode(r.body);
    }
    return null;
  }

  static Future<UserData?> signIn({
    required String email,
    required String password,
    required String deviceID,
  }) async {
    Map<String, String> body = {
      'email': email,
      'password': password,
    };
    Response r = await post(
      Uri.parse(baseURL + 'login'),
      body: body,
    );
    print(r.body);

    if (r.statusCode == 200) {
      var result = json.decode(r.body);

      if (result['message'] != null) {
        K.showToast(message: result['message']);
      }
      if (result['status_code'] == 201) {
        K.showToast(message: "Wait for the Admin Approval");
      } else if (result['error'] == true) {
      } else {
        print("success response");
        var value = result['user'] as Map<String, dynamic>;
        var val = UserData.fromJson(value);
        return val;
      }

      return null;
    }
  }

  static Future<http.Response> updateProfile({
    required Map<String, dynamic> body,
  }) async {
    // Convert the body to form data
    String formData = body.entries
        .map((entry) =>
            '${Uri.encodeComponent(entry.key)}=${Uri.encodeComponent(entry.value.toString())}')
        .join('&');

    print("body=== $formData");

    http.Response response = await http.post(
      Uri.parse(baseURL + "profile"),
      headers: {
        ...getAuthHeader(),
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: formData,
    );

    print("response.body=== ${response.body}");

    return response;
  }

  static Future<Map<String, dynamic>?> otpVerify({
    required String otpCode,
    required String mobile,
    required String deviceID,
  }) async {
    Map<String, String> body = {
      'verification_code': otpCode,
      'mobile': mobile,
    };
    if (Platform.isAndroid) {
      body['device_token'] = deviceID;
    }
    if (Platform.isIOS) {
      body['device_token'] = deviceID;
    }
    print("calling api");
    Response r = await post(
      Uri.parse(baseURL + 'verifyOtp'),
      body: body,
    );
    log('------------r.body------------${r.body}');
    if (validateResponse(r)) {
      return json.decode(r.body);
    }
    return null;
  }

  static Future<Map<String, dynamic>?> resendOtp({
    required String mobile,
    required String deviceID,
  }) async {
    Map<String, String> body = {
      'mobile': mobile,
    };
    if (Platform.isAndroid) {
      body['device_token'] = deviceID;
    }
    if (Platform.isIOS) {
      body['device_token'] = deviceID;
    }
    print("calling api");
    Response r = await post(
      Uri.parse(baseURL + 'resendOtp'),
      body: body,
    );
    log('------------r.body------------${r.body}');
    if (validateResponse(r)) {
      return json.decode(r.body);
    }
    return null;
  }

  static Future<Map<String, dynamic>?> getJobsData() async {
    print("Calling Get job data");
    Response r = await get(
      Uri.parse(baseURL + 'jobs'),
      headers: getAuthHeader(),
    );
    print("---------" + r.body);

    if (validateResponse(r)) {
      return json.decode(r.body);
    }
    return null;
  }

  // Note:-
  static Future<Map<String, dynamic>?> getJobsDetails(String jobID) async {
    print(jobID);
    Response r = await get(
      Uri.parse(
          "${'http://149.102.158.40/container/public/index.php/api/job/detail/' + jobID}"),
      headers: getAuthHeader(),
    );
    print(K.userToken);
    print("getjobsdetails ApiURl:${baseURL + 'detail/jobs/' + jobID}");
    print("---------" + r.body);

    if (validateResponse(r)) {
      return json.decode(r.body);
    }
    return null;
  }

  // Note:-
  static Future<bool> jobAccept(String jobID) async {
    Map<String, String> body = {
      // 'status': "accepted",
      'status': "complete",
      'job_id': jobID,
    };
    Response r = await post(
      Uri.parse(baseURL + "job/action"),
      body: body,
      headers: getAuthHeader(),
    );

    log("getjobsdetails ApiURl:${baseURL + 'job/action'}");
    log("---------" + r.body);

    if (validateResponse(r)) {
      return true;
    }
    return false;
  }

//Api for MyJobs
  static Future<Map<String, dynamic>?> getMyJobsData() async {
    print("Calling GetMyjobs data");
    Response r = await post(
      Uri.parse(baseURL + 'detail/jobs'),
      headers: getAuthHeader(),
      //getAuthHeader(),
    );
    print("---------" + r.body);

    if (validateResponse(r)) {
      return json.decode(r.body);
    }
    return null;
  }

  static Future<Map<String, dynamic>?> getMyEarnings() async {
    print("Calling GetMyjobs data");
    Response r = await get(
      Uri.parse(baseURL + 'job/earning'),
      headers: getAuthHeader(),
      //getAuthHeader(),
    );
    print("---------" + r.body);

    if (validateResponse(r)) {
      return json.decode(r.body);
    }
    return null;
  }

//------------------------TEST--------------//
  static Future<void> getJson(
      {Map<String, dynamic>? body, required String url}) async {
    print('===========calloingfdshjgs');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer28|I4f38NmYCyopgi2Y8HgHAJuxPwNX1qjh5siN0YEF'
    };
    var request = http.Request('POST', Uri.parse(baseURL + 'detail/jobs'));
    // if (body != null) {
    //   request.body = jsonEncode(body);
    // }
    print("herererehererere");

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var myResponse = await http.Response.fromStream(response);

    var model = JobDetailsModel.fromJson(json.decode(myResponse.body));
    print("------------------------------------");
    log('=====================================');
    //   log(jsonEncode(model.job));
    log('=====================================');
  }

//------------------------TESTEND--------------//

  static bool validateResponse(Response r) {
    final Map<String, dynamic> body;
    try {
      body = json.decode(r.body);
      print(body);
    } catch (e) {
      print(e);
      if (r.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    }

    if (r.statusCode == 200) {
      return true;
    } else {
      String errorMessage = '';
      try {
        errorMessage = getErrorMessage(body['message']);
      } catch (e) {
        errorMessage = body['message'];
      }
      K.showToast(message: errorMessage);
      return false;
    }
  }

  static String getErrorMessage(Map<String, dynamic> errors) {
    String errorMessage = '';
    for (var i in errors.values) {
      errorMessage +=
          i.toString().replaceAll('[', '').replaceAll(']', '') + '\n';
    }
    if (errorMessage.contains('\n')) {
      return errorMessage.substring(0, errorMessage.length - 1);
    }

    return errorMessage;
  }

  static List<UserModel> parseUserResponse(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<UserModel>((json) => UserModel.fromJson(json)).toList();
  }

  static Map<String, String> getAuthHeader() {
    final UserController _controller = Get.find(tag: K.userControllerTag);
    return {
      HttpHeaders.authorizationHeader: 'Bearer ${_controller.userToken}',
    };
  }
}
