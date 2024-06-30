import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

getAppBar(
  BuildContext context, {
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          FontAwesomeIcons.arrowCircleLeft,
          color: primaryColor,
        )),
    actions: actions,
  );
}

getAppBar2(BuildContext context, key) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    toolbarHeight: 65,
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        Material(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(30),
          elevation: 5,
          child: IconButton(
              onPressed: () {
                key.currentState.openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: fourthColor,
              )),
        ),
      ],
    ),
  );
}

getAppBar3(title, key) {
  return AppBar(
    backgroundColor: secondaryColor,
    centerTitle: true,
    elevation: 0.0,
    automaticallyImplyLeading: false,
    iconTheme: const IconThemeData(color: fourthColor),
    leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: fourthColor,
          size: 20,
        )),
    title: Text(
      title,
      style: textStyle3,
    ),
  );
}

getAppBar4(title, key) {
  return AppBar(
    backgroundColor: secondaryColor,
    centerTitle: true,
    elevation: 0.0,
    automaticallyImplyLeading: false,
    iconTheme: const IconThemeData(color: fourthColor),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(30),
          elevation: 3,
          child: IconButton(
              onPressed: () {
                key.currentState.openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: fourthColor,
              )),
        ),
        Text(
          title,
          style: textStyle3,
        ),
        const SizedBox(
          width: 40,
        ),
      ],
    ),
  );
}

getAppBar5(title, key) {
  return AppBar(
    backgroundColor: primaryColor,
    elevation: 0.0,
    toolbarHeight: 70,
    centerTitle: true,
    leading: Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: CircleAvatar(
          backgroundColor: secondaryColor,
          radius: 18,
          child: IconButton(
              onPressed: () {
                key.currentState.openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: fourthColor,
                size: 20,
              )),
        ),
      ),
    ),
    title: Text(
      title,
      style: textStyle2.copyWith(fontSize: 18, color: secondaryColor),
    ),
  );
}

getAppBar6(title, key, context) {
  return AppBar(
    backgroundColor: primaryColor,
    elevation: 0.0,
    toolbarHeight: 90,
    automaticallyImplyLeading: false,
    centerTitle: true,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CircleAvatar(
          backgroundColor: secondaryColor,
          radius: 16,
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                FontAwesomeIcons.arrowLeft,
                color: fourthColor,
                size: 15,
              )),
        ),
        const SizedBox(
          height: 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: secondaryColor,
              radius: 16,
              child: IconButton(
                  onPressed: () {
                    key.currentState.openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: fourthColor,
                    size: 17.5,
                  )),
            ),
            Text(
              title,
              style: textStyle2.copyWith(fontSize: 18, color: secondaryColor),
            ),
            const SizedBox(
              width: 40,
            ),
          ],
        ),
      ],
    ),
  );
}
