import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../Controllers/Tab Controllers/DashBoardControllers/dashboard_controller.dart';
import '../../../Controllers/Tab Controllers/booking controller.dart';
import '../../../models/widgets/appbar.dart';
import '../booking/in_progress.dart';
import '../drawer.dart';
import 'job_widget.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // DashboardController dashboardController = Get.put(DashboardController(), tag: K.dashboardController);
  BookingController bookingController = Get.put(BookingController());
  Map<String, dynamic>? data;
  // var active_jobs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // dashboardController.getJobsApi();
    bookingController.getMyJobsApi();
    // active_jobs = dashboardController.jobsList.value?.length;
    // var data = dashboardController.activeJobData;
  }

  @override
  Widget build(BuildContext context) {
    var height1 = MediaQuery.of(context).size.height;
    var widht1 = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: getAppBar4('Dashboard', _scaffoldKey),
      key: _scaffoldKey,
      backgroundColor: secondaryColor,
      drawer: const SideDrawer(),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: widht1 * 0.02,
                      ),

                      ////////////////////////////////// Comment  by Qaim    ////////////////////////////

                      /*      Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: sixthColor, width: 0.7),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: TextEditingController(),
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    FontAwesomeIcons.search,
                                    color: fourthColor,
                                    size: 20,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                              child: VerticalDivider(
                                color: sixthColor,
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  FontAwesomeIcons.solidCalendarAlt,
                                  color: fourthColor,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  FontAwesomeIcons.cog,
                                  color: fourthColor,
                                )),
                          ],
                        ),
                      ),
                    ),*/
                      const SizedBox(
                        height: 10,
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: bookingController.myJobsList.value?.length != 0 ? Obx(() => InProgress(
                            dataSource: bookingController.myJobsList.value != null
                                ? (bookingController.myJobsList.value!['inprocess'] ?? []).reversed.toList()
                                : [])):const Center(child: Text('Waiting for new jobs'),)
                      ),
                    ],
                  ),
                ),

                /////////////////////////////////////////// comment by Qaim ////////////////////
                /*    Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: primaryColor),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'TOTAL',
                        style: textStyle3.copyWith(
                            color: secondaryColor, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$231.00',
                        style: textStyle2.copyWith(
                            color: secondaryColor, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),*/
              ],
            ),
          ),
          // bottomJobsCard(),
        ]
      ),
    );
  }
  // bottomJobsCard() {
  //   return Positioned(
  //     left: 0,
  //     right: 0,
  //     bottom: 10,
  //     child: Card(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(15),
  //       ),
  //       margin: const EdgeInsets.symmetric(horizontal: 15),
  //       elevation: 5,
  //       child: Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Column(
  //           children: [
  //             Text(
  //               'JOBS',
  //               style: textStyle3.copyWith(fontSize: 16),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Column(
  //                     children: [
  //                       Padding(
  //                         padding: const EdgeInsets.all(4.0),
  //                         child: Text(
  //                           'Pendings',
  //                           style: textStyle5,
  //                         ),
  //                       ),
  //                       Material(
  //                         color: secondaryColor,
  //                         shadowColor: fourthColor,
  //                         borderRadius: BorderRadius.circular(60),
  //                         elevation: 30,
  //                         child: SizedBox(
  //                           height: 70,
  //                           width: 70,
  //                           child: Center(
  //                               child: Text(
  //                                 '4',
  //                                 style: textStyle1,
  //                               )),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   Column(
  //                     children: [
  //                       Padding(
  //                         padding: const EdgeInsets.all(4.0),
  //                         child: Text(
  //                           'Actives',
  //                           style: textStyle5,
  //                         ),
  //                       ),
  //                       Material(
  //                         color: secondaryColor,
  //                         shadowColor: fourthColor,
  //                         borderRadius: BorderRadius.circular(60),
  //                         elevation: 30,
  //                         child: SizedBox(
  //                           height: 70,
  //                           width: 70,
  //                           child: Center(
  //                               child: Text(
  //                                 '${active_jobs}',
  //                                 style: textStyle1,
  //                               )),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   Column(
  //                     children: [
  //                       Padding(
  //                         padding: const EdgeInsets.all(4.0),
  //                         child: Text(
  //                           'Declined',
  //                           style: textStyle5,
  //                         ),
  //                       ),
  //                       Material(
  //                         color: secondaryColor,
  //                         shadowColor: fourthColor,
  //                         borderRadius: BorderRadius.circular(60),
  //                         elevation: 30,
  //                         child: SizedBox(
  //                           height: 70,
  //                           width: 70,
  //                           child: Center(
  //                               child: Text(
  //                                 '5',
  //                                 style: textStyle1.copyWith(color: ninthColor),
  //                               )),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

}
