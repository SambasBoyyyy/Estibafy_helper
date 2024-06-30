import 'package:cupertino_tabbar/cupertino_tabbar.dart' as CupertinoTabBar;
import 'package:estibafy_helpers/Views/pages/payouts/upcoming.dart';
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:estibafy_helpers/models/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controllers/Tab Controllers/payout controller.dart';
import '../drawer.dart';
import 'completed.dart';

class Payout extends StatefulWidget {
  const Payout({Key? key}) : super(key: key);


  @override
  State<Payout> createState() => _PayoutState();
}

class _PayoutState extends State<Payout> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PayoutController payoutController= Get.put(PayoutController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:getAppBar3('Payouts',_scaffoldKey),
      key: _scaffoldKey,
      backgroundColor: secondaryColor,
      drawer: const SideDrawer(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: sixthColor, width: 0.5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: CupertinoTabBar.CupertinoTabBar(
                    Colors.transparent,
                    primaryColor,
                    [
                      Text(
                        "Completed Payouts",
                        style: textStyle2.copyWith(
                            color:payoutController.cupertinoTabBarIIIValue == 0
                                ? secondaryColor
                                : fifthColor),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Upcoming Payouts",
                        style: textStyle2.copyWith(
                            color: payoutController.cupertinoTabBarIIIValue == 1
                                ? secondaryColor
                                : primaryColor),
                        textAlign: TextAlign.center,
                      ),
                    ],
                    payoutController.cupertinoTabBarIIIValueGetter,
                    (int index) {
                      setState(() {
                        payoutController. cupertinoTabBarIIIValue = index;
                      });
                    },
                    useShadow: false,
                    allowExpand: true,
                    useSeparators: false,
                    innerVerticalPadding: 14,
                    innerHorizontalPadding: 15,
                    outerHorizontalPadding: 15,
                    outerVerticalPadding: 12,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                  child: payoutController.cupertinoTabBarIIIValue == 0
                      ? const CompletedPayouts()
                      : const UpComingsPayouts()),
            ),
          ],
        ),
      ),
    );
  }
}
