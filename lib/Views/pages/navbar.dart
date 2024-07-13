import 'package:estibafy_helpers/Controllers/navigationbar_controller.dart';
import 'package:estibafy_helpers/Views/pages/Dashboard/dashboard.dart';
import 'package:estibafy_helpers/Views/pages/profile/profile.dart';
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'booking/bookings.dart';
import 'maps/map_main.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final tabs = [
    const DashBoard(),
    //Historial(),
    // const MapMain(),
    const Booking(),
    const Profile(isBackButton: false),
  ];

  NavigationBarController navigationBarController = Get.put(NavigationBarController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PersistentTabView(
          context,
          controller: navigationBarController.tabController,
          screens: tabs,
          confineInSafeArea: true,
          navBarHeight: 60,
          backgroundColor: fourthColor,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 200),
            curve: Curves.bounceIn,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style6,
          items: persistentItems(context),
        ),
      ),
    );
  }
}

List<PersistentBottomNavBarItem> persistentItems(context) {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(FontAwesomeIcons.home, size: 20),
      title: 'Dashboard',
      textStyle: textStyle4,
      activeColorPrimary: secondaryColor,
      activeColorSecondary: secondaryColor,
    ),
    // PersistentBottomNavBarItem(
    //   icon: const Icon(FontAwesomeIcons.solidMap, size: 20),
    //   title: 'Maps',
    //   textStyle: textStyle4,
    //   activeColorPrimary: secondaryColor,
    //   activeColorSecondary: secondaryColor,
    // ),
    PersistentBottomNavBarItem(
      icon: const Icon(FontAwesomeIcons.bookOpen, size: 20),
      title: 'My Jobs',
      textStyle: textStyle4,
      activeColorPrimary: secondaryColor,
      activeColorSecondary: secondaryColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(FontAwesomeIcons.userAlt, size: 20),
      title: 'Profile',
      textStyle: textStyle4,
      activeColorPrimary: secondaryColor,
      activeColorSecondary: secondaryColor,
    ),
  ];
}
