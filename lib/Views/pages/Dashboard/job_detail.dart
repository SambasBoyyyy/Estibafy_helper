import 'package:estibafy_helpers/Controllers/Tab%20Controllers/DashBoardControllers/dashboard_controller.dart';
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:estibafy_helpers/models/widgets/pressed_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Controllers/Tab Controllers/DashBoardControllers/JobDetail/JobDetails.dart';
import '../maps/gps_route_selection_sheet.dart';
import 'dashboard.dart';

class JobDetail extends StatefulWidget {
  const JobDetail({Key? key, required this.jobID}) : super(key: key);

  final String jobID;

  @override
  State<JobDetail> createState() => _JobDetailState();
}

class _JobDetailState extends State<JobDetail> {
  bool isDialogShows = false;

  final JobDetails controller = Get.put(JobDetails());

  //Future<JobDetailsModel>? result;  //= await WebAPIs.getJobsDetails();

  Future? my_result;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // _controller.getJobDetailApi();
  }

/*
  getdata() async{
    result= await WebAPIs.getJobsDetails();

  }*/

  @override
  Widget build(BuildContext context) {
    var height1 = MediaQuery.of(context).size.height;
    var widht1 = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 29, 0, 0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 45),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 0),
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 14, right: 14, top: 12, bottom: 30),
                  child: FutureBuilder(
                    future: controller.getJobDetailApi(index: widget.jobID),
                    builder: (context, snapshot) {
                      var data = snapshot.data as Map<String, dynamic>?;
                      if (snapshot.hasData && data != null) {
                        return SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(
                                        Icons.cancel_outlined,
                                        color: fourthColor,
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        FontAwesomeIcons.solidFile,
                                        size: 20,
                                        color: primaryColor,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Order # ${data['data']['id']}',
                                        style: textStyle2,
                                      ),
                                    ],
                                  ),
                                  CircleAvatar(
                                      backgroundColor: fourteenColor,
                                      radius: 18,
                                      child: IconButton(
                                          onPressed: () {
                                            // Navigator.pop(context);
                                            // showModalBottomSheet(
                                            //     context: context,
                                            //     backgroundColor:
                                            //         Colors.transparent,
                                            //     clipBehavior:
                                            //         Clip.antiAliasWithSaveLayer,
                                            //     builder: (builder) {
                                            //       return const GPSRouteSelectionSheet();
                                            //     });
                                            openMap(
                                                latitude: data['data']
                                                        ['latitude'] ??
                                                    "",
                                                longitude: data['data']
                                                        ['longitude'] ??
                                                    "");
                                          },
                                          icon: const Icon(
                                              CupertinoIcons.arrow_branch,
                                              color: secondaryColor))),
                                ],
                              ),
                              upperTile('Customer', FontAwesomeIcons.userAlt,
                                  'Jorge Romero'),
                              // upperTile('Company', FontAwesomeIcons.solidBuilding,
                              //     'Comandato'),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, bottom: 4),
                                    child: Text(
                                      'Job Date',
                                      style: textStyle2.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 35,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Start',
                                          style: textStyle2,
                                        ),
                                        Text(
                                          'Date Time',
                                          style: textStyle2,
                                        ),
                                        // Text(
                                        //   'Time',
                                        //   style: textStyle2,
                                        // ),
                                        Row(
                                          children: [
                                            Text(
                                              'Add',
                                              style: textStyle2.copyWith(
                                                  color: tertiaryColor),
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                FontAwesomeIcons
                                                    .solidCalendarAlt,
                                                color: tertiaryColor,
                                                size: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: twelveColor.withOpacity(0.1),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Icon(
                                            FontAwesomeIcons.solidCalendarCheck,
                                            color: primaryColor,
                                            size: 17,
                                          ),
                                        ),
                                        Text(
                                          //result![index].job?.id.toString()??"",
                                          // result![index].job?.createdAt.toString()??"",

                                          //_controller,
                                          '${data['data']['start_time']}',
                                          style: textStyle2,
                                        ),
                                        const SizedBox(
                                          width: 80,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 35,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'End',
                                          style: textStyle2,
                                        ),
                                        Text(
                                          'Date Time',
                                          style: textStyle2,
                                        ),
                                        // Text(
                                        //   'Time',
                                        //   style: textStyle2,
                                        // ),
                                        const SizedBox(
                                          width: 70,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: twelveColor.withOpacity(0.1),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Icon(
                                            FontAwesomeIcons.solidCalendarCheck,
                                            color: primaryColor,
                                            size: 17,
                                          ),
                                        ),
                                        Text(
                                          '${data['data']['end_time']}',
                                          style: textStyle2,
                                        ),
                                        // Text(
                                        //   '8:00 AM',
                                        //   style: textStyle2,
                                        // ),
                                        const SizedBox(
                                          width: 80,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  upperTile(
                                    'Job Location',
                                    FontAwesomeIcons.locationArrow,
                                    '${data['data']['address']}',
                                  ),
                                  Positioned(
                                    right: 5,
                                    top: 38,
                                    child: CircleAvatar(
                                        backgroundColor: fourteenColor,
                                        radius: 15,
                                        child: IconButton(
                                            onPressed: () {
                                              openMap(
                                                  latitude: data['data']
                                                          ['latitude'] ??
                                                      "",
                                                  longitude: data['data']
                                                          ['longitude'] ??
                                                      "");
                                            },
                                            icon: const Icon(
                                              CupertinoIcons.arrow_branch,
                                              color: secondaryColor,
                                              size: 17,
                                            ))),
                                  ),
                                ],
                              ),
                              upperTile(
                                  'Job Type',
                                  FontAwesomeIcons.briefcase,
                                  data['data']['package_type'] ??
                                      'Container 20 | Packing : Boxes, Pallets'),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, bottom: 4),
                                    child: Text(
                                      'Earning',
                                      style: textStyle2.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: twelveColor.withOpacity(0.1),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(
                                            FontAwesomeIcons.moneyCheck,
                                            color: primaryColor,
                                            size: 17,
                                          ),
                                        ),
                                        Text(
                                          "\$ ${data['data']['checkout']['base_fare']}",
                                          style: textStyle2.copyWith(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextButton(
                                            onPressed: () {},
                                            child: Row(
                                              children: [
                                                Text(
                                                  'View Wallet',
                                                  style: textStyle2.copyWith(
                                                      color: tertiaryColor),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const Icon(
                                                  FontAwesomeIcons.arrowRight,
                                                  color: tertiaryColor,
                                                  size: 15,
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  /*      Expanded(
                              child: Container(
                                height: 52,
                                width: double.infinity,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: OutlinedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  )),
                                  child: const Icon(
                                    Icons.chat_bubble_outline,
                                    color: fifthColor,
                                  ),
                                ),
                              ),
                            ),*/
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    //width: double.infinity,

                                    //margin: const EdgeInsets.symmetric(horizontal: 25),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        launchPhone(phone: "+926381946715");
                                      },
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: secondaryColor, backgroundColor: Colors.white, elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.phone,
                                          size: 30,
                                          color: fifthColor,
                                          // color: secondaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              customButton5(
                                  'Accept', secondaryColor, fifthColor, () {
                                setState(() {
                                  isDialogShows = true;
                                });
                              }),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ),
            ),
            isDialogShows == true
                ? areYouSureYouWantToStartThisJobDialog(context)
                : Container(),
            Positioned(
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  height: 90,
                  width: 90,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/bookinglogo.png'),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  upperTile(title, icon, text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Text(
            title,
            style: textStyle2.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: twelveColor.withOpacity(0.1),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  icon,
                  color: primaryColor,
                  size: 17,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                text,
                style: textStyle2,
              ),
            ],
          ),
        ),
      ],
    );
  }

  areYouSureYouWantToStartThisJobDialog(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        elevation: 20,
        child: SizedBox(
          height: 350,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Icon(
                      FontAwesomeIcons.solidHandshake,
                      size: 50,
                      color: fourthColor,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                        child: Text(
                      'Are you sure you want to\nStart the job?',
                      style: textStyle3,
                      textAlign: TextAlign.center,
                    )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: customButton5('YES', secondaryColor, fifthColor,
                            () async {
                          setState(() {
                            isDialogShows = false;
                          });
                          final result = await controller.apiForJobAccept(
                              id: widget.jobID);
                          if (result) {
                            DashboardController _controller =
                                Get.find(tag: K.dashboardController);
                            _controller.getJobsApi().whenComplete(() {
                              K.showToast(
                                  message:
                                  'Job Accepted, You can start your Job from Accepted Jobs',
                                  toastLength: Toast.LENGTH_LONG);
                              Get.back(result: const DashBoard());
                            });

                          } else {
                            K.showToast(message: 'Failed to accept Job');
                          }
                        }, margin: 2.0),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: customButton5(
                            'NOT YET', secondaryColor, ninthColor, () {
                          setState(() {
                            isDialogShows = false;
                          });
                        }, margin: 2.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Future<void> openMap(
      {required double latitude, required double longitude}) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (!await launchUrl(Uri.parse(googleUrl))) {
      throw 'Could not launch $googleUrl';
    }
  }

  static Future<void> launchPhone({required String phone}) async {
    if (await canLaunch("tel:$phone")) {
      await launch("tel:$phone");
    } else {
      throw 'Could not launch $phone';
    }
  }
}
