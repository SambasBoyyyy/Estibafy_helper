import 'package:estibafy_helpers/Views/pages/maps/take_photos_for_%20jobperformed.dart';
import 'package:estibafy_helpers/Views/pages/maps/view_order_sheet.dart';
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:estibafy_helpers/models/widgets/pressed_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../drawer.dart';
import 'mapa.dart';

class CompleteJob extends StatefulWidget {
  const CompleteJob({Key? key, this.isStarting = false, required this.jobID})
      : super(key: key);

  final bool isStarting;
  final String jobID;

  @override
  State<CompleteJob> createState() => _CompleteJobState();
}

class _CompleteJobState extends State<CompleteJob> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  CountdownTimerController? controller;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 10000;

  void onEnd() {
    if (kDebugMode) {
      print('onEnd');
    }
  }

  void initState() {
    controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
  }

  bool isDialogShows = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: getBody(context),
        drawer: const SideDrawer(),
      ),
    );
  }

  getBody(BuildContext context) {
    return Stack(
      children: [
        const Mapa(),
        upperOnlineTile(_scaffoldKey),
        upperTimer(),
        bottomCompleteJobCard(),
        isDialogShows == true
            ? areYouSureYouWantToMarkThisJobAsCompletedDialog(context)
            : Container(),
      ],
    );
  }

  upperOnlineTile(key) {
    return Positioned(
      left: 0,
      right: 0,
      top: 15,
      child: SizedBox(
        height: 90,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Material(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(30),
                elevation: 20,
                child: IconButton(
                    onPressed: () {
                      key.currentState.openDrawer();
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: fourthColor,
                    )),
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 3, top: 3, bottom: 3),
                  child: Row(
                    children: [
                      Text(
                        'Online',
                        style: textStyle2,
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      const CircleAvatar(
                        backgroundColor: fifthColor,
                        child: Icon(
                          FontAwesomeIcons.solidHandshake,
                          color: fourthColor,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  upperTimer() {
    return Positioned(
      left: 0,
      right: 0,
      top: 90,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        elevation: 10,
        child: SizedBox(
          height: 80,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              children: [
                const Icon(
                  FontAwesomeIcons.stopwatch,
                  color: fourthColor,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Start',
                        style: textStyle5.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '8:20 AM',
                        style: textStyle5.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Timer',
                        style: textStyle5.copyWith(fontWeight: FontWeight.bold),
                      ),
                      CountdownTimer(
                        endTime: endTime,
                        widgetBuilder: (_, CurrentRemainingTime? time) {
                          if (time == null) {
                            return Text(
                              'Time over',
                              style: textStyle5.copyWith(
                                  fontWeight: FontWeight.bold),
                            );
                          }
                          return Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${time.hours} : ',
                                  style: textStyle2.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${time.min} : ',
                                  style: textStyle2.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${time.sec}',
                                  style: textStyle2.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                  child: VerticalDivider(
                    color: sixthColor,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'End',
                        style: textStyle5.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '5:30 PM',
                        style: textStyle5.copyWith(fontWeight: FontWeight.bold),
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

  bottomCompleteJobCard() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 45),
            child: Container(
              height: 250,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ACCEPTED',
                          style: textStyle2.copyWith(
                              color: fifthColor, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {
                              showCupertinoModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0.0,
                                  context: context,
                                  builder: (context) => const ViewOrderSheet());
                            },
                            child: Row(
                              children: [
                                Text(
                                  'View Order',
                                  style:
                                      textStyle2.copyWith(color: tertiaryColor),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(
                                  FontAwesomeIcons.arrowRight,
                                  color: primaryColor,
                                  size: 15,
                                ),
                              ],
                            )),
                      ],
                    ),
                    Text(
                      'Comandato',
                      style: textStyle2.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text('Jorge Romero', style: textStyle2),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Order # 234556676', style: textStyle2),
                    const SizedBox(
                      height: 30,
                    ),
                    customButton5(
                        widget.isStarting ? 'START JOB' : 'COMPLETE JOB',
                        secondaryColor,
                        fifthColor, () {
                      setState(() {
                        isDialogShows = true;
                      });
                    }),
                  ],
                ),
              ),
            ),
          ),
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
    );
  }

  areYouSureYouWantToMarkThisJobAsCompletedDialog(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        elevation: 20,
        child: Container(
          height: 350,
          decoration: BoxDecoration(
              color: secondaryColor, borderRadius: BorderRadius.circular(25.0)),
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
                      widget.isStarting
                          ? 'Are you sure you want to start this job?'
                          : 'Are you sure you want to\nMark this job as completed?',
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
                            () {
                          setState(() {
                            isDialogShows = false;
                          });
                          PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                            context,
                            settings: const RouteSettings(
                                name: '/takePhotosForJobPerformed'),
                            screen: TakePhotosForJobPerformed(
                                isStarting: widget.isStarting,
                                jobID: widget.jobID),
                            withNavBar: true,
                          );
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
}
