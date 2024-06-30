import 'package:estibafy_helpers/models/payouts_completed_model.dart';
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math' as math;

Widget buildPayoutsCompletedCard(BuildContext context, int index) {
  final data = PayoutsCompletedList.list[index];
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 9, bottom: 9, top: 4),
          child: Text(
            data.date,
            style: textStyle5,
          ),
        ),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 30,
                ),
                Text(
                  data.price,
                  style: textStyle6.copyWith(fontSize: 20, color: fourthColor),
                ),
                Row(
                  children: [
                    Transform.rotate(
                        angle: -math.pi / 4,
                        child: Text(
                          'Paid',
                          style: textStyle1.copyWith(
                              color: fifthColor, fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: const [
                        Icon(
                          FontAwesomeIcons.infoCircle,
                          color: fourthColor,
                          size: 22,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}