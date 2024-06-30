import 'package:dotted_border/dotted_border.dart';
import 'package:estibafy_helpers/models/schedule_model.dart';
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget buildBookingScheduleCard(BuildContext context, int index) {
  final data = BookingsScheduleList.list[index];
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Column(
      children: [
        Row(
          children: [
            Container(
              height: 55,
              width: 180,
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(6)),
              ),
              child: Center(
                  child: Text(
                'Comandato',
                style: textStyle3.copyWith(color: secondaryColor),
              )),
            ),
            Container(
              height: 55,
              width: 60,
              decoration: BoxDecoration(
                  border: Border.all(color: sixthColor, width: 0.5)),
              child: Center(
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/bookinglogo.png'),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.only(topRight: Radius.circular(6)),
                    border: Border.all(color: sixthColor, width: 0.5)),
                child: Center(
                    child: Text(
                  'Order #\n${data.orderNumber}',
                  style: textStyle2,
                  textAlign: TextAlign.center,
                )),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                data.date,
                style: textStyle5,
              ),
              Text(
                ' @ ',
                style: textStyle5,
              ),
              Text(
                data.time,
                style: textStyle5,
              ),
            ],
          ),
        ),
        Card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: DottedBorder(
            strokeCap: StrokeCap.round,
            borderType: BorderType.RRect,
            dashPattern: const [5, 5],
            color: sixthColor.withOpacity(0.8),
            radius: const Radius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: fourthColor,
                                backgroundImage: NetworkImage(
                                  data.imagePath,
                                ),
                                radius: 24,
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: ninthColor,
                                    size: 16,
                                  ),
                                  const SizedBox(
                                    width: 1.5,
                                  ),
                                  Text(
                                    data.rating,
                                    style: textStyle5,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                data.customerName,
                                style: textStyle2.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 150,
                                child: Text(
                                  data.address,
                                  style: textStyle5,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 60,
                        child: VerticalDivider(
                          color: sixthColor.withOpacity(0.5),
                          width: 0.5,
                        ),
                      ),
                      Text(
                        'Special\nInstructions',
                        style: textStyle5,
                        textAlign: TextAlign.center,
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              FontAwesomeIcons.questionCircle,
                              color: fifthColor,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      color: sixthColor.withOpacity(0.5),
                      thickness: 0.5,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 20, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'TOTAL',
                          style: textStyle3.copyWith(
                              fontWeight: FontWeight.bold, color: primaryColor),
                        ),
                        Text(
                          '\$${data.totalPrice}',
                          style: textStyle3.copyWith(
                              fontWeight: FontWeight.bold, color: primaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
