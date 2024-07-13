import 'package:estibafy_helpers/models/earning_model.dart';
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../Controllers/Tab Controllers/booking controller.dart';

class MyEarnings extends StatefulWidget {
  const MyEarnings({Key? key}) : super(key: key);

  @override
  State<MyEarnings> createState() => _MyEarningsState();
}

class _MyEarningsState extends State<MyEarnings> {

  BookingController bookingController= Get.put(BookingController());
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: FutureBuilder(
        future: bookingController.getMyEarnings(),
        builder: (context,snapshot) {
          if(snapshot.hasData){

            var model = snapshot.data as EarningModel;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: sixthColor),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              FontAwesomeIcons.solidCalendarAlt,
                              color: fourthColor,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 11,
                          ),
                          Text(DateFormat.yMMMMEEEEd().format(bookingController.date!)),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              _date(context);
                            },
                            borderRadius: BorderRadius.circular(20),
                            child: const Icon(
                              Icons.arrow_drop_down_outlined,
                              size: 30,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                        child: VerticalDivider(
                          color: sixthColor,
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FontAwesomeIcons.cog,
                            size: 20,
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(color: sixthColor, width: 0.5),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Stack(
                              children: const [
                                SizedBox(
                                    height: 60,
                                    width: 90,
                                    child: RotatedBox(
                                        quarterTurns: 1,
                                        child: Icon(
                                          FontAwesomeIcons.solidMoneyBillAlt,
                                          color: fifthColor,
                                          size: 32,
                                        ))),
                                Positioned(
                                  bottom: 5,
                                  left: 0,
                                  right: 0,
                                  child: Icon(
                                    FontAwesomeIcons.handHolding,
                                    color: fourthColor,
                                    size: 32,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    'Jobs',
                                    style: textStyle3,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${model.data!.unreleasedPaymentEarning!.totalJobsDone.toString()}',
                                  style: textStyle6.copyWith(
                                      color: fourthColor, fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                          child: VerticalDivider(
                            color: tenthColor,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'Tips',
                                style: textStyle3,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '\$ ${model.data!.unreleasedPaymentEarning!.totalAmount}',
                              style: textStyle6.copyWith(
                                  color: fourthColor, fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: middleBoxes('Total Number Of Days Worked', FontAwesomeIcons.calendarDay, '${model.data!.unreleasedPaymentEarning!.totalNumberOfDaysWorked.toString()}'),
                    ),
                    // Expanded(
                    //   child: middleBoxes(
                    //       'Average Rating', FontAwesomeIcons.solidStar, '4.7',
                    //       iconColor: Colors.yellow),
                    // ),
                    // Expanded(
                    //   child: middleBoxes(
                    //       'Total Distance', FontAwesomeIcons.locationArrow, '18 Km',
                    //       iconColor: tertiaryColor),
                    // ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Expanded(
                    //   child: middleBoxes(
                    //       'Time Online', FontAwesomeIcons.clock, '3h 21m'),
                    // ),
                    // Expanded(
                    //   child: middleBoxes(
                    //     'Time Offline',
                    //     FontAwesomeIcons.clock,
                    //     '6h 21m',
                    //   ),
                    // ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  color: primaryColor,
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Total Jobs + Tips',
                            style: textStyle3.copyWith(color: secondaryColor),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '\$ ${model.data!.unreleasedPaymentEarning!.totalAmount}',
                            style: textStyle6.copyWith(
                                color: secondaryColor, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            );
          }else{
            return const Center(child: CircularProgressIndicator(),);
          }
        }
      ),
    );
  }

  middleBoxes(title, icon, text, {iconColor = fourthColor}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: sixthColor, width: 0.5),
      ),
      elevation: 5,
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5, left: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style:
                      textStyle2.copyWith(letterSpacing: 0.0, wordSpacing: 0.0),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      icon,
                      color: iconColor,
                      size: 22,
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    text,
                    style: textStyle3.copyWith(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _date(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: primaryColor, // header background color
                onPrimary: secondaryColor, // header text color
                onSurface: primaryColor, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: primaryColor, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        initialDate: bookingController.date!,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        bookingController.date = picked;
      });
    }
  }
}
