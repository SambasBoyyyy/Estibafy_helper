import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget customButton(
    {function,
    text,
    borderColor,
    textColor,
    arrowColor,
    fillColor,
    margin,
    height}) {
  return Container(
    height: 55,
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: margin),
    child: ElevatedButton(
      onPressed: function,
      style: ElevatedButton.styleFrom(
          backgroundColor: fillColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 30,
            ),
            Text(
              text,
              style: textStyle3.copyWith(color: textColor),
            ),
            Icon(
              FontAwesomeIcons.solidArrowAltCircleRight,
              color: arrowColor,
              size: 30,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget customButton2(
    {function,
    text,
    borderColor,
    textColor,
    arrowColor,
    fillColor,
    margin,
    height}) {
  return Container(
    height: 55,
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: margin),
    child: ElevatedButton(
      onPressed: function,
      style: ElevatedButton.styleFrom(
          backgroundColor: fillColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 30,
            ),
            Text(
              text,
              style: textStyle3.copyWith(color: textColor),
            ),
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: secondaryColor)),
              child: Padding(
                padding: const EdgeInsets.all(3.5),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: arrowColor,
                  size: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget customButton3(
    {function,
    text,
    borderColor,
    textColor,
    iconColor,
    fillColor,
    margin,
    height}) {
  return Container(
    height: 55,
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: margin),
    child: ElevatedButton(
      onPressed: function,
      style: ElevatedButton.styleFrom(
          backgroundColor: fillColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              FontAwesomeIcons.solidHandshake,
              color: iconColor,
              size: 30,
            ),
            Text(
              text,
              style: textStyle3.copyWith(color: textColor),
            ),
            const SizedBox(
              width: 30,
            ),
          ],
        ),
      ),
    ),
  );
}

customButton4(text, function) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 22, left: 20, right: 20),
    child: SizedBox(
      height: 55,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
            foregroundColor: secondaryColor, backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        child: Text(
          text,
          style: textStyle3.copyWith(color: secondaryColor),
        ),
      ),
    ),
  );
}

customButton5(text, textColor, color, function, {margin = 50.0}) {
  return Container(
    height: 52,
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: margin),
    child: ElevatedButton(
      onPressed: function,
      style: ElevatedButton.styleFrom(
          foregroundColor: secondaryColor, backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          )),
      child: Text(
        text,
        style: textStyle3.copyWith(color: textColor),
      ),
    ),
  );
}
