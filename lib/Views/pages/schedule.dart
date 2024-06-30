import 'package:estibafy_helpers/models/schedule_model.dart';
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:estibafy_helpers/models/widgets/appbar.dart';
import 'package:estibafy_helpers/models/widgets/schedule_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'drawer.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  final TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar3('Schedule', _scaffoldKey),
      backgroundColor: secondaryColor,
      key: _scaffoldKey,
      drawer: const SideDrawer(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
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
                          controller: searchController,
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
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Schedule',
                style: textStyle2.copyWith(
                    fontWeight: FontWeight.bold, color: fifthColor),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: BookingsScheduleList.list.length,
                itemBuilder: (BuildContext context, int index) =>
                    buildBookingScheduleCard(
                  context,
                  index,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
