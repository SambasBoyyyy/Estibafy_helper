import 'package:estibafy_helpers/Controllers/Tab%20Controllers/booking%20controller.dart';
import 'package:estibafy_helpers/models/booking_cancelled_model.dart';
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:estibafy_helpers/models/widgets/booking_cancelled_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Cancelled extends StatefulWidget {
  // const Cancelled({Key? key}) : super(key: key);
  final List<dynamic> dataSource;
  const Cancelled({Key? key, required this.dataSource}) : super(key: key);
  @override
  State<Cancelled> createState() => _CancelledState();
}

class _CancelledState extends State<Cancelled> {
 BookingController bookingController= Get.put(BookingController());

 @override
 void initState() {
   // TODO: implement initState
   super.initState();
   print(widget.dataSource);
 }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                ////////////////////////////////////// Commented by Qaim  //////////////////////
       /*         Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: sixthColor, width: 0.7),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: bookingController.searchController,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                FontAwesomeIcons.search,
                                color: fourthColor,
                                size: 20,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                          child: VerticalDivider(
                            color: sixthColor,
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              FontAwesomeIcons.solidCalendarAlt,
                              color: fourthColor,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              FontAwesomeIcons.cog,
                              color: fourthColor,
                            )),
                      ],
                    ),
                  ),
                ),*/
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Cancelled',
                  style: textStyle2.copyWith(
                      fontWeight: FontWeight.bold, color: ninthColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.dataSource.length,
                  itemBuilder: (BuildContext context, int index) =>
                      buildBookingCancelledCard(
                    context,
                    index,
                        widget.dataSource[index],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: primaryColor),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TOTAL',
                  style: textStyle3.copyWith(
                      color: secondaryColor, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$231.00',
                  style: textStyle2.copyWith(
                      color: secondaryColor, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
