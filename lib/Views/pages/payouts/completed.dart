import 'package:estibafy_helpers/models/payouts_completed_model.dart';
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:estibafy_helpers/models/widgets/payouts_completed_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class CompletedPayouts extends StatefulWidget {
  const CompletedPayouts({Key? key}) : super(key: key);

  @override
  State<CompletedPayouts> createState() => _CompletedPayoutsState();
}

class _CompletedPayoutsState extends State<CompletedPayouts> {
  DateTime? date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
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
                    Text(DateFormat.yMMMMEEEEd().format(date!)),
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
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'TOTAL : \$ 1,050.00',
                  style: textStyle3,
                ),
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: PayoutsCompletedList.list.length,
            itemBuilder: (BuildContext context, int index) =>
                buildPayoutsCompletedCard(
              context,
              index,
            ),
          ),
        ],
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
        initialDate: date!,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        date = picked;
      });
    }
  }
}
