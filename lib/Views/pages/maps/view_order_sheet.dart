import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:estibafy_helpers/models/widgets/pressed_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'gps_route_selection_sheet.dart';
import 'mapa_complete_job.dart';

class ViewOrderSheet extends StatefulWidget {
  const ViewOrderSheet({Key? key}) : super(key: key);

  @override
  State<ViewOrderSheet> createState() => _ViewOrderSheetState();
}

class _ViewOrderSheetState extends State<ViewOrderSheet> {
  bool isDialogShows = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 45),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
              child: SingleChildScrollView(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              'Order # 3456776',
                              style: textStyle2,
                            ),
                          ],
                        ),
                        CircleAvatar(
                            backgroundColor: fourteenColor,
                            radius: 18,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Colors.transparent,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      builder: (builder) {
                                        return const GPSRouteSelectionSheet();
                                      });
                                },
                                icon: const Icon(CupertinoIcons.arrow_branch,
                                    color: secondaryColor))),
                      ],
                    ),
                    upperTile(
                        'Customer', FontAwesomeIcons.userAlt, 'Jorge Romero'),
                    upperTile(
                        'Company', FontAwesomeIcons.solidBuilding, 'Comandato'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 4),
                          child: Text(
                            'Job Date',
                            style: textStyle2.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Start',
                                style: textStyle2,
                              ),
                              Text(
                                'Date',
                                style: textStyle2,
                              ),
                              Text(
                                'Time',
                                style: textStyle2,
                              ),
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
                                      FontAwesomeIcons.solidCalendarAlt,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                'Oct 23, 2021',
                                style: textStyle2,
                              ),
                              Text(
                                '8:00 AM',
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'End',
                                style: textStyle2,
                              ),
                              Text(
                                'Date',
                                style: textStyle2,
                              ),
                              Text(
                                'Time',
                                style: textStyle2,
                              ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                'Oct 23, 2021',
                                style: textStyle2,
                              ),
                              Text(
                                '8:00 AM',
                                style: textStyle2,
                              ),
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
                            'Ave. Leopoldo Carrera 107, Los Olivos'),
                        Positioned(
                          right: 5,
                          top: 38,
                          child: CircleAvatar(
                              backgroundColor: fourteenColor,
                              radius: 15,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    CupertinoIcons.arrow_branch,
                                    color: secondaryColor,
                                    size: 17,
                                  ))),
                        ),
                      ],
                    ),
                    upperTile('Job Type', FontAwesomeIcons.briefcase,
                        'Container 20 | Packing : Boxes, Pallets'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 4),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                '\$ 25.00',
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
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 52,
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 25),
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
                        ),
                        Expanded(
                          child: Container(
                            height: 52,
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 25),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: secondaryColor, backgroundColor: fifthColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  )),
                              child: const Icon(
                                Icons.phone,
                                color: secondaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    customButton5('START JOB', secondaryColor, fifthColor, () {
                      setState(() {
                        isDialogShows = true;
                      });
                    }),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
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
                            () {
                          setState(() {
                            isDialogShows = false;
                          });
                          PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                            context,
                            settings: const RouteSettings(name: '/completeJob'),
                            screen: const CompleteJob(jobID: '11'),
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
