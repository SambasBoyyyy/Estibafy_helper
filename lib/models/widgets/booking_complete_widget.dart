import 'package:dotted_border/dotted_border.dart';
import 'package:estibafy_helpers/models/booking_complete_model.dart';
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget buildBookingCompletedCard(BuildContext context, int index,Map<String, dynamic> data) {
  // final data = BookingsCompletedList.list[index];

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 9),
    child: GestureDetector(
      onTap: () {
      },
      child: Container(

        decoration: BoxDecoration(
            color: Colors.white,
            //color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 0),
              )
            ]
        ),
        //color: Colors.yellow,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 55,
                  width: 180,
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      //bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Center(
                      child: Text(
                        '${data['user']['name']}',
                        // 'Comandato',
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
                  // Text(
                  //   ' @ ',
                  //   style: textStyle5,
                  // ),
                  // Text(
                  //   data.time,
                  //   style: textStyle5,
                  // ),
                ],
              ),
            ),
            Card(
              //color: Colors.yellow,
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
              ),
              child: DottedBorder(
                strokeCap: StrokeCap.round,
                borderType: BorderType.RRect,
                dashPattern: const [5, 5],
                color: sixthColor.withOpacity(0.8),
                radius:  Radius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [

                          ////////////////////////////////// Commented by Qaim /////////////////////////////////
                      /*    Column(
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
                          SizedBox(height: 2,),
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
                                style:  TextStyle(
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
                      SizedBox(width: 20,),



                      /*  Column(
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
