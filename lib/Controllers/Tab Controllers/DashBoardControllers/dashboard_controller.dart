import 'package:estibafy_helpers/models/JobDetail/JobDetailModel.dart';
import 'package:get/get.dart';

import '../../../../models/Classes/web_apis.dart';

class DashboardController extends GetxController {
  Rxn<List> jobsList = Rxn<List>();

  void getActiveJobs() {
    //print("api called");
    // WebAPIs.getJson(url: "");
  }

  Future<void> getJobsApi() async {
    final Map<String, dynamic>? result = await WebAPIs.getJobsData();

    print("Here's Response -------");

     print(result);

    // print("---WELCOME--- $result");

    print("Here's Response -------");

    if (result != null) {
      // print("---All Active Jobs---${result['data']['active_jobs']}");
      jobsList.value = result['data']['active_jobs'];
    }
  }

  @override
  void onInit() {
    getJobsApi();
    super.onInit();
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
