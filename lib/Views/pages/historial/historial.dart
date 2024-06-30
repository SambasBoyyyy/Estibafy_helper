import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:estibafy_helpers/models/widgets/appbar.dart';
import 'package:flutter/material.dart';

import '../drawer.dart';

class Historial extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final bool isBackButton;
   Historial({Key? key, this.isBackButton=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:isBackButton == true
          ? getAppBar3('Historial', _scaffoldKey)
          : getAppBar4('Historial', _scaffoldKey),
      key: _scaffoldKey,
      backgroundColor: secondaryColor,
      drawer: const SideDrawer(),
      body: Center(
          child: Text(
        'No history to show',
        style: textStyle2.copyWith(color: sixthColor),
      )),
    );
  }
}
