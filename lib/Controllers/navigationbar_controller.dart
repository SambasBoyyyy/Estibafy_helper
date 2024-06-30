

import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
class NavigationBarController extends GetxController{
  final currentIndex = 2.obs;

  final tabController = PersistentTabController(initialIndex: 0);
}