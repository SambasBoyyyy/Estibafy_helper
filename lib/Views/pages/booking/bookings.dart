import 'package:estibafy_helpers/models/Classes/booking_screen_widget.dart';
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:estibafy_helpers/models/widgets/appbar.dart';
import 'package:flutter/material.dart';

import '../drawer.dart';

class Booking extends StatefulWidget {
  final bool isBackButton;

  const Booking({Key? key, this.isBackButton = false}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isBackButton == true
          ? getAppBar3('Bookings', _scaffoldKey)
          : getAppBar4('Bookings', _scaffoldKey),
      key: _scaffoldKey,
      backgroundColor: secondaryColor,
      drawer: const SideDrawer(),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child:  BookingScreenWidget(),
      ),
    );
  }
}
