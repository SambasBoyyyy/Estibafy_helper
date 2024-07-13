import 'package:estibafy_helpers/Views/pages/payouts/payouts.dart';
import 'package:estibafy_helpers/Views/pages/profile/profile.dart';
import 'package:estibafy_helpers/Views/pages/schedule.dart';
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../Controllers/user_controller.dart';
import '../../models/Classes/booking_screen_widget.dart';
import 'booking/bookings.dart';
import 'historial/historial.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  final UserController _userController = Get.find(tag: K.userControllerTag);

  @override
  Widget build(BuildContext context) {
    // Read user data from GetStorage
    final userData = K.localStorage.read(K.userControllerTag);
    final userName = userData != null ? userData['name'] : 'Guest';
    final userEmail = userData != null ? userData['email'] : 'guest@example.com';
    return SafeArea(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(80),
          bottomRight: Radius.circular(80),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          child: Drawer(
            child: Container(
              color: secondaryColor,
              child: Column(
                children: [
                  Expanded(
                    flex: 10,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 15, bottom: 5, top: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(const Profile(
                                          isBackButton: true,
                                        ));
                                      },
                                      child: const CircleAvatar(
                                        backgroundColor: fourthColor,
                                        backgroundImage: NetworkImage(
                                          'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDh8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                                        ),
                                        radius: 32,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    // Row(
                                    //   children: [
                                    //     const Icon(
                                    //       Icons.star,
                                    //       color: ninthColor,
                                    //       size: 16,
                                    //     ),
                                    //     const SizedBox(
                                    //       width: 1.5,
                                    //     ),
                                    //     Text(
                                    //       '4.8',
                                    //       style: textStyle2,
                                    //     ),
                                    //     const SizedBox(
                                    //       width: 8,
                                    //     ),
                                    //   ],
                                    // ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(userName,
                                        style: textStyle2.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: primaryColor)),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.email,
                                          size: 16,
                                          color: primaryColor,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          userEmail,
                                          style: textStyle2.copyWith(
                                              color: primaryColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 20),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       Text(
                          //         'Balance:',
                          //         style: textStyle3,
                          //       ),
                          //       Text('\$ 0 ',
                          //           style: textStyle3.copyWith(
                          //               fontWeight: FontWeight.bold)),
                          //     ],
                          //   ),
                          // ),
                          Divider(
                            color: sixthColor.withOpacity(0.2),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          // tile('Settings', () {}, Icons.settings),
                          tile(
                            'My Earnings',
                            () {
                              setState(() {
                                isStartingIndex = 3;
                              });
                              Get.to(const Booking(
                                isBackButton: true,
                              ));
                            },
                            FontAwesomeIcons.moneyBill,
                            size: 20.0,
                          ),
                          // tile(
                          //   'Historial',
                          //   () {
                          //     Get.to(Historial(
                          //       isBackButton: true,
                          //     ));
                          //   },
                          //   Icons.history,
                          // ),
                          // tile(
                          //   'Schedule',
                          //   () {
                          //     Get.to(const Schedule());
                          //   },
                          //   Icons.calendar_today_outlined,
                          //   size: 25.0,
                          // ),
                          // tile(
                          //   'Documents',
                          //   () {},
                          //   FontAwesomeIcons.file,
                          //   size: 22.0,
                          // ),
                          // tile(
                          //   'Payouts',
                          //   () {
                          //     Get.to(const Payout());
                          //   },
                          //   FontAwesomeIcons.dollarSign,
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        width: 120,
                        child: OutlinedButton(
                          onPressed: () {
                            final UserController _controller =
                                Get.find(tag: K.userControllerTag);
                            _controller.signOut();
                          },
                          style: OutlinedButton.styleFrom(
                              foregroundColor: sixthColor, shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 10,
                                child: Icon(
                                  Icons.logout,
                                  size: 20,
                                  color: eighthColor,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  'Log Out',
                                  style:
                                      textStyle2.copyWith(color: eighthColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  tile(text, function, icon, {size = 28.0}) {
    return Column(
      children: [
        SizedBox(
          height: 45,
          child: ListTile(
            onTap: function,
            leading: Icon(
              icon,
              color: tertiaryColor,
              size: size,
            ),
            title: Text(
              text,
              style: textStyle2.copyWith(
                color: primaryColor,
              ),
            ),
          ),
        ),
        Divider(
          color: sixthColor.withOpacity(0.2),
        ),
      ],
    );
  }
}
