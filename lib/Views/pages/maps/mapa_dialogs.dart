import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:estibafy_helpers/models/widgets/pressed_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../navbar.dart';
import 'map_main.dart';

youCantStartThisJobDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, StateSetter setState) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              height: 350,
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(25.0)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Icon(
                          Icons.cancel,
                          size: 100,
                          color: ninthColor,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                            child: Text(
                          'You can’t start this job on a date\nthat has not been requested?',
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
                          const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                      child: customButton5(
                          'Ok Thanks', secondaryColor, fifthColor, () {
                        add(setState);
                        Get.offAll(const NavBar());
                      }),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      });
}

void add(setState) {
  setState(() {
    isOrderAccept = false;
  });
}
