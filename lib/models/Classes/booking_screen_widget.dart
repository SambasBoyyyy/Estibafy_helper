import 'package:cupertino_tabbar/cupertino_tabbar.dart' as CupertinoTabBar;
import 'package:estibafy_helpers/Controllers/Tab%20Controllers/booking%20controller.dart';
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Views/pages/booking/activejobs.dart';
import '../../Views/pages/booking/cancelled.dart';
import '../../Views/pages/booking/completed.dart';
import '../../Views/pages/booking/in_progress.dart';
import '../../Views/pages/booking/my_earnings.dart';

var isStartingIndex = 0;

class BookingScreenWidget extends StatefulWidget {
  const BookingScreenWidget({Key? key}) : super(key: key);

  @override
  State<BookingScreenWidget> createState() => _BookingScreenWidgetState();
}

class _BookingScreenWidgetState extends State<BookingScreenWidget> {
  BookingController bookingController = Get.put(BookingController());
  int cupertinoTabBarIIIValue = isStartingIndex;
  int cupertinoTabBarIIIValueGetter() => cupertinoTabBarIIIValue;

  @override
  void initState() {
    super.initState();
    bookingController.getMyJobsApi();
  }

  void _refreshData() {
    bookingController.getMyJobsApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: sixthColor, width: 0.5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: CupertinoTabBar.CupertinoTabBar(
                  Colors.transparent,
                  primaryColor,
                  [
                    Text(
                      "In Process",
                      style: textStyle2.copyWith(
                          color: cupertinoTabBarIIIValue == 0
                              ? secondaryColor
                              : seventhColor),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Active Jobs",
                      style: textStyle2.copyWith(
                          color: cupertinoTabBarIIIValue == 1
                              ? secondaryColor
                              : twelveColor),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Completed",
                      style: textStyle2.copyWith(color: fifthColor),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Cancelled",
                      style: textStyle2.copyWith(color: ninthColor),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "My Earnings",
                      style: textStyle2.copyWith(
                          color: cupertinoTabBarIIIValue == 4
                              ? secondaryColor
                              : tertiaryColor),
                      textAlign: TextAlign.center,
                    ),
                  ],
                  cupertinoTabBarIIIValueGetter,
                      (int index) {
                    setState(() {
                      cupertinoTabBarIIIValue = index;
                    });
                  },
                  useShadow: false,
                  allowExpand: true,
                  useSeparators: false,
                  innerVerticalPadding: 14,
                  innerHorizontalPadding: 15,
                  outerHorizontalPadding: 15,
                  outerVerticalPadding: 12,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              child: cupertinoTabBarIIIValue == 0
                  ? Obx(() => InProgress(
                  dataSource: bookingController.myJobsList.value != null
                      ? (bookingController.myJobsList.value!['inprocess'] ?? []).reversed.toList()
                      : []))
                  : cupertinoTabBarIIIValue == 1
                  ? Obx(() => ActiveJobs(
                  dataSource: bookingController.myJobsList.value != null
                      ? (bookingController.myJobsList.value!['inprogress'] ?? []).reversed.toList()
                      : []))
                  : cupertinoTabBarIIIValue == 2
                  ? Obx(() => Completed(
                  dataSource: bookingController.myJobsList.value != null
                      ? (bookingController.myJobsList.value!['completed'] ?? []).reversed.toList()
                      : []))
                  : cupertinoTabBarIIIValue == 3
                  ? Obx(() => Cancelled(
                  dataSource: bookingController.myJobsList.value != null
                      ? (bookingController.myJobsList.value!['declined'] ?? []).reversed.toList()
                      : []))
                  : MyEarnings(),
            )


          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshData,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
