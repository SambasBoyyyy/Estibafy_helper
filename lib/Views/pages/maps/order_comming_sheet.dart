
import 'package:estibafy_helpers/Views/pages/maps/view_order_sheet.dart';
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'map_main.dart';

class OrderComingSheet extends StatefulWidget {
  const OrderComingSheet({Key? key}) : super(key: key);

  @override
  State<OrderComingSheet> createState() => _OrderComingSheetState();
}

class _OrderComingSheetState extends State<OrderComingSheet> {
  @override
  Widget build(BuildContext context) {
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
                                        builder: (context) =>
                                        const ViewOrderSheet());
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
                                     isOrderAccept=true;
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
