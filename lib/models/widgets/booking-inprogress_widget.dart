import 'package:dotted_border/dotted_border.dart';
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../Views/pages/booking/book_sheet.dart';

Widget buildBookingInProgressCard(BuildContext context, int index, Map<String, dynamic> data) {

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 9),
    child: GestureDetector(
      onTap: () {
        showCupertinoModalBottomSheet(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          context: context,
          builder: (context) => BookingSheet(jobID: data['job_id'].toString(),status:true),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
           // color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 0),
              )
            ]),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 55,
                  width: 180,
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(12)),
                  ),
                  child: Center(
                      child: Text(
                      '${data['user']['name']}',
                     // 'User',
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
                          image: DecorationImage(image: AssetImage('assets/bookinglogo.png'), fit: BoxFit.cover)),
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
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(12)),
                        border: Border.all(color: sixthColor, width: 0.5)),
                    child: Center(
                        child: Text(
                      'Order #\n${data['job_id']}',
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
                    data['created_at'].toString(),
                    style: textStyle5,
                  ),
                ],
              ),
            ),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: DottedBorder(
                strokeCap: StrokeCap.round,
                borderType: BorderType.RRect,
                dashPattern: const [5, 5],
                color: sixthColor.withOpacity(0.8),
                radius: const Radius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [

                          /////////////////////////////////////////////////  Comment By Qaim  /////////////////////
                    /*      Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: fourthColor,
                                backgroundImage: NetworkImage(
                                  staticData.imagePath,
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
                                    staticData.rating,
                                    style: textStyle5,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                ],
                              ),
                            ],
                          ),*/
                          Column(
                            children: [
                              Text(
                                '${data['job']['name']}',
                                style: textStyle2.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 150,
                                child: Text(
                                  '${data['job']['address']}',
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
                      //////////////////////////////////////////////////////////////////////////
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          Row(
                            children:  [
                               Text(
                                'Total Helper:',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  //color: fourthColor,
                                  color: primaryColor,
                                  wordSpacing: 0.5,
                                  letterSpacing: 0.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(

                                //' ${data['total_helpers']}',
                                '${data['job']['checkout']['total_helpers']}',
                                style:  TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  //color: fourthColor,
                                  color: primaryColor,
                                  wordSpacing: 0.5,
                                  letterSpacing: 0.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          /////////////////////
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            children:  [
                              Text(
                                'Pricing:',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  //color: fourthColor
                                  // ,
                                  color: primaryColor,
                                  //color: Colors.grey,
                                  wordSpacing: 0.5,
                                  letterSpacing: 0.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '${data['job']['checkout']['total']}',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  //color: fourthColor,
                                  color: primaryColor,
                                  //color: Colors.grey,

                                  wordSpacing: 0.5,
                                  letterSpacing: 0.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),

                      /*   Text(
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
                      ),*/
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
