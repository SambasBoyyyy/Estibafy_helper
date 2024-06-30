import 'package:estibafy_helpers/Controllers/user_controller.dart';
import 'package:estibafy_helpers/models/JobDetail/JobDetailModel.dart';
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../../models/Classes/web_apis.dart';

class JobDetails extends GetxController {
  Rxn<Map<String, dynamic>> jobsDetailList = Rxn<Map<String, dynamic>>();
  Rxn<Map<String, dynamic>> jobsDetail = Rxn<Map<String, dynamic>>();

  Future<Map<String, dynamic>?> getJobDetailApi({required String index}) async {
    UserController controller = Get.find(tag: K.userControllerTag);
    print(controller.userToken);
    EasyLoading.show();

    print("im going to call JobDetailAPi");
    //  WebAPIs.getJson(url: "");

    final Map<String, dynamic>? result = await WebAPIs.getJobsDetails(index);

    print("Here's Response of JOB DEtail");
    print("------ $result");

    if (result != null) {
      // print("---All Active Jobs---${result['data']['active_jobs']}");
      EasyLoading.dismiss();
      return jobsDetail.value = result['data'];
      return result;
    }
    EasyLoading.dismiss();
    return null;
  }

  Future<bool> apiForJobAccept({required String id}) async {
    EasyLoading.show();

    print("im going to call apiForJobAccept");
    //  WebAPIs.getJson(url: "");

    final bool result = await WebAPIs.jobAccept(id);

    print("Here's Response of JOB DEtail");
    print("------ $result");

    if (result) {
      EasyLoading.dismiss();
      return true;

      //response = result;

      // user.value = User(
      //   name: result['data']['users']['name'],
      //   email: email,
      //   phoneNumber: result['data']['users']['name'],
      //   password: password,
      // );

      // K.localStorage
      //     .write(K.loggedInUser, result['data']['token']['access_token']);
      // userToken = data.accessToken.toString();
      // K.localStorage.write('userToken', data.accessToken.toString());

      // K.showToast(message: 'Welcome ${data.name}');
      // Get.offAll(() => NavBar());

      // print("ya hmary aporanad s dfajns" + data.accessToken.toString());
    }

    EasyLoading.dismiss();
    return false;
  }
}
//////////////////////////////////

/*

class JobDetails extends GetxController {
  var isLoading = true.obs;

  RxList<JobDetailsModel> myJobDetails = [JobDetailsModel()].obs;

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await WebAPIs().getData();
      if (products != null) {
        myJobDetails.value = products as List<JobDetailsModel> ;
      }
    } finally {
      isLoading(false);
    }
  }




  @override
  void onInit() {
    //getJobDetailApi();
    fetchProducts();
    super.onInit();
  }

}
*/
