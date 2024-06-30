import 'package:estibafy_helpers/Views/pages/navbar.dart';
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:estibafy_helpers/models/widgets/appbar.dart';
import 'package:estibafy_helpers/models/widgets/pressed_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'booking/bookings.dart';
import 'drawer.dart';
import 'maps/mapa_complete_job.dart';

class JobAcceptedByCustomer extends StatelessWidget {
  JobAcceptedByCustomer(
      {Key? key, this.isStarting = false, required this.jobID})
      : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final bool isStarting;
  final String jobID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      key: _scaffoldKey,
      appBar: getAppBar2(context, _scaffoldKey),
      drawer: const SideDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'SUCCESS !',
              style: textStyle6,
            ),
            Column(
              children: [
                const Icon(
                  FontAwesomeIcons.solidCheckCircle,
                  color: fifthColor,
                  size: 150,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  isStarting
                      ? 'JOB STARTED SUCCESSFULLY'
                      : 'YOUR JOB WAS SUCCESSFULLY\nACCEPTED BY THE CUSTOMER',
                  style: textStyle3,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  isStarting
                      ? 'PRESS DONE TO MOVE ON'
                      : 'PRESS DONE TO RETURN TO DASHBOARD',
                  style: textStyle3,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            customButton5('Done', secondaryColor, fifthColor, () {
              isStarting
                  // ? PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                  //     context,
                  //     settings: const RouteSettings(name: '/completeJob'),
                  //     // screen: CompleteJob(jobID: jobID),
                  //      screen: Booking(isBackButton: false,),
                  //     withNavBar: true,
                  //
                  //   )
                  ?Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Booking(isBackButton: false),
                  settings: const RouteSettings(name: '/completeJob'),
                ),
              )
                  : Get.offAll(() => const NavBar());
            }, margin: 140.0),
          ],
        ),
      ),
    );
  }
}
