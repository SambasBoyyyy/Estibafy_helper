import 'package:estibafy_helpers/Views/pages/booking/bookings.dart';
import 'package:estibafy_helpers/Views/pages/maps/view_order_sheet.dart';
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math' as math;

import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
// import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../models/Classes/booking_screen_widget.dart';
import '../drawer.dart';
import 'mapa.dart';
import 'order_accepted_card.dart';

var isOrderAccept = false;

class MapMain extends StatefulWidget {
  const MapMain({Key? key}) : super(key: key);

  @override
  State<MapMain> createState() => _MapMainState();
}

class _MapMainState extends State<MapMain> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String status = 'online';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      key: _scaffoldKey,
      backgroundColor: secondaryColor,
      drawer: const SideDrawer(),
    );
  }

  getBody() {
    return Stack(
      children: [
        GestureDetector(
            onTap: () {
              showCupertinoModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  context: context,
                  builder: (context) => orderComingSheet());
            },
            child: const Mapa()
        ),
        upperMenu(_scaffoldKey),
        status == 'online' ? upperOnlineTile() : upperOfflineTile(),
        upperBookingEarningTile(),
        bottomJobsCard(),
        isOrderAccept == true ? bottomOrderAcceptedCard(context) : Container(),
      ],
    );
  }

  upperOnlineTile() {
    return Positioned(
      left: 0,
      right: 0,
      top: 15,
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                    CircleAvatar(
                      backgroundColor: fifthColor,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            status='offline';
                          });
                        },
                        child: const Icon(
                          FontAwesomeIcons.exchangeAlt,
                          color: fourthColor,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  upperOfflineTile() {
    return Positioned(
      left: 0,
      right: 0,
      top: 15,
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 3, right: 20, top: 3, bottom: 3),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: fifthColor,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            status='online';
                          });
                        },
                        child: const Icon(
                          FontAwesomeIcons.exchangeAlt,
                          color: fourthColor,
                          size: 18,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Text(
                      'Offline',
                      style: textStyle2.copyWith(color: eighthColor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  upperBookingEarningTile() {
    return Positioned(
      right: 0,
      top: 15,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Column(
                  children: [
                    Material(
                      color: fourthColor,
                      shadowColor: fourthColor,
                      borderRadius: BorderRadius.circular(60),
                      elevation: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                isStartingIndex = 0;
                              });

                              Get.to(const Booking(isBackButton: true,));
                            },
                            icon: const Icon(
                              FontAwesomeIcons.solidFileAlt,
                              color: secondaryColor,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'Booking',
                        style: textStyle2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Material(
                      color: fourthColor,
                      shadowColor: fourthColor,
                      borderRadius: BorderRadius.circular(60),
                      elevation: 30,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8, top: 8, bottom: 8, right: 10),
                        child: Transform.rotate(
                          angle: -math.pi / 5,
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  isStartingIndex = 3;
                                });
                                Get.to(const Booking(isBackButton: true,));
                              },
                              icon: const Icon(
                                FontAwesomeIcons.moneyBillWave,
                                color: secondaryColor,
                              )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'My Earnings',
                        style: textStyle2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  upperMenu(key) {
    return Positioned(
      left: 0,
      top: 15,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Material(
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
      ),
    );
  }

  bottomJobsCard() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'JOBS',
                style: textStyle3.copyWith(fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            'Pendings',
                            style: textStyle5,
                          ),
                        ),
                        Material(
                          color: secondaryColor,
                          shadowColor: fourthColor,
                          borderRadius: BorderRadius.circular(60),
                          elevation: 30,
                          child: SizedBox(
                            height: 70,
                            width: 70,
                            child: Center(
                                child: Text(
                              '4',
                              style: textStyle1,
                            )),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            'Actives',
                            style: textStyle5,
                          ),
                        ),
                        Material(
                          color: secondaryColor,
                          shadowColor: fourthColor,
                          borderRadius: BorderRadius.circular(60),
                          elevation: 30,
                          child: SizedBox(
                            height: 70,
                            width: 70,
                            child: Center(
                                child: Text(
                              '2',
                              style: textStyle1,
                            )),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            'Declined',
                            style: textStyle5,
                          ),
                        ),
                        Material(
                          color: secondaryColor,
                          shadowColor: fourthColor,
                          borderRadius: BorderRadius.circular(60),
                          elevation: 30,
                          child: SizedBox(
                            height: 70,
                            width: 70,
                            child: Center(
                                child: Text(
                              '5',
                              style: textStyle1.copyWith(color: ninthColor),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  orderComingSheet() {
    return SizedBox(
      height: 670,
      child: Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.only(top: 55),
            elevation: 5,
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 25, bottom: 5),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  pointIcon(FontAwesomeIcons.warehouse),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Comandato',
                                        style: textStyle2,
                                      ),
                                      Text(
                                        'Jorge Romero',
                                        style: textStyle2,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              TextButton(
                                  onPressed: () {
                                    showCupertinoModalBottomSheet(
                                        backgroundColor: Colors.transparent,
                                        elevation: 0.0,
                                        context: context,
                                        builder: (context) => const ViewOrderSheet()
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        'View Order',
                                        style: textStyle2.copyWith(
                                            color: tertiaryColor),
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
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              pointIcon(FontAwesomeIcons.solidCalendar),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'START : OCTOBER 10, 2021 @ 8:00 AM',
                                    style: textStyle2,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'END: OCTUBRE 10, 2021 @ 6:00 PM',
                                    style: textStyle2,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              pointIcon(FontAwesomeIcons.busAlt),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Container 20',
                                style: textStyle2,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              pointIcon(FontAwesomeIcons.boxOpen),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Packing: Boxes, Pallets, Sacos',
                                style: textStyle2,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              pointIcon(FontAwesomeIcons.locationArrow),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Ave. Leopoldo Carrera, los Olivos',
                                style: textStyle2,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          Text(
                            'YOU WIL EARN',
                            style: textStyle2,
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: primaryColor,
                            child: Text(
                              '\$25',
                              style: textStyle1.copyWith(
                                  color: secondaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    setState(() {
                                      isOrderAccept = true;
                                      if (kDebugMode) {
                                        print(isOrderAccept);
                                      }
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      foregroundColor: secondaryColor, backgroundColor: fifthColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      )),
                                  child: Text(
                                    'ACCEPT',
                                    style: textStyle2.copyWith(
                                        color: secondaryColor),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                width: double.infinity,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    side:
                                        const BorderSide(color: secondaryColor),
                                  )),
                                  child: Text(
                                    'DECLINE',
                                    style:
                                        textStyle2.copyWith(color: ninthColor),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            child: CircleAvatar(
              backgroundColor: primaryColor,
              radius: 50,
              child: CircleAvatar(
                radius: 40,
                backgroundColor: secondaryColor,
                child: Text(
                  '45',
                  style: textStyle1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  pointIcon(icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Icon(
        icon,
        color: primaryColor,
        size: 16,
      ),
    );
  }
}
