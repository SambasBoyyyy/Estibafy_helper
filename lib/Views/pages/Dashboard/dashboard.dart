import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../Controllers/Tab Controllers/DashBoardControllers/dashboard_controller.dart';
import '../../../models/widgets/appbar.dart';
import '../drawer.dart';
import 'job_widget.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  DashboardController dashboardController = Get.put(DashboardController(), tag: K.dashboardController);
  Map<String, dynamic>? data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //dashboardController.getJobsApi();
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
      body: Padding(
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
                  Text(
                    'New Jobs',
                    style: textStyle2.copyWith(
                        fontWeight: FontWeight.bold, color: fifthColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Obx(
                      () => dashboardController.jobsList.value == null
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: primaryColor,
                              ),
                            )
                          : ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount:
                                  dashboardController.jobsList.value?.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  jobCard(context, dashboardController.jobsList.value![index],),
                            ),
                    ),
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
    );
  }
}
