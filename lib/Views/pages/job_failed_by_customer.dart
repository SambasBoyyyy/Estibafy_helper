import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:estibafy_helpers/models/widgets/appbar.dart';
import 'package:estibafy_helpers/models/widgets/pressed_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'drawer.dart';
import 'navbar.dart';

class JobFailedByCustomer extends StatelessWidget {
  JobFailedByCustomer({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
              'FAILED !',
              style: textStyle6.copyWith(color: ninthColor),
            ),
            Column(
              children: [
                const Icon(
                  Icons.cancel,
                  color: ninthColor,
                  size: 150,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'YOUR JOB WAS NOT ACCEPTED\nBY THE CUSTOMER',
                  style: textStyle3,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'CONTACT THE CUSTOMER\nMORE INFORMATION.',
                  style: textStyle3,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            customButton5('Back', secondaryColor, fifthColor, () {
              Get.offAll(const NavBar());
            }, margin: 140.0),
            Text(
              'Contact Customer',
              style: textStyle2,
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
          ],
        ),
      ),
    );
  }
}
