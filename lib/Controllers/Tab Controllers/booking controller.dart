import 'package:estibafy_helpers/Views/pages/booking/bookings.dart';
import 'package:estibafy_helpers/models/earning_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/Classes/web_apis.dart';

class BookingController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  DateTime? date = DateTime.now();
  Rxn<Map<String, dynamic>> myJobsList = Rxn<Map<String, dynamic>>();

  Rxn<EarningModel> earningModel = Rxn<EarningModel>();

 // Rxn<List> myJobsList = Rxn<List>();

  void getMyJobsApi() async {
    final Map<String, dynamic>? result = await WebAPIs.getMyJobsData();

    print("Here's Response");

    // print("---WELCOME--- $result");

    if (result != null) {
      // print("---All Active Jobs---${result['data']['active_jobs']}");
      myJobsList.value = result['helper'];
      //print(myJobsList!.value['email'].toString());
    }
  }

  Future<EarningModel?> getMyEarnings() async {
    final Map<String, dynamic>? result = await WebAPIs.getMyEarnings();

    print("Here's Response");

     print("---WELCOME--- $result");

    if (result != null) {
      var model = EarningModel.fromMap(result);
      print(model.data?.unreleasedPaymentEarning);
      return model;
    }else{
      return null;
    }
  }

}
