import 'package:estibafy_helpers/Views/pages/maps/view_order_sheet.dart';
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:estibafy_helpers/models/widgets/pressed_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'mapa_dialogs.dart';

bottomOrderAcceptedCard(BuildContext context) {
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
                  customButton5('START JOB', secondaryColor, fifthColor, () {
                    youCantStartThisJobDialog(context);
                  })
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
