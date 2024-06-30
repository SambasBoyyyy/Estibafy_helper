import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:flutter/material.dart';

Widget input(
    {obscure = false,
    text,
    prefix,
    prefixColor = tenthColor,
    controller,
    suffix,
    onChanged,
    TextInputType? inputType}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: SizedBox(
      height: 58,
      child: Column(
        children: [
          SizedBox(
            height: 42,
            child: Stack(
              children: [
                TextField(
                  onChanged: onChanged,
                  controller: controller,
                  obscureText: obscure,
                  cursorColor: primaryColor,
                  keyboardType: inputType,
                  decoration: InputDecoration(
                    hintText: text,
                    hintStyle:
                        textStyle2.copyWith(color: tenthColor.withOpacity(0.8)),
                    border: InputBorder.none,
                    contentPadding:
                        const EdgeInsets.only(left: 40, top: 10, bottom: 10),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(top: 10, left: 5),
                      child: Icon(
                        prefix,
                        color: prefixColor,
                      ),
                    ),
                  ),
                  textAlign: TextAlign.center,
                  style: textStyle2.copyWith(fontSize: 16),
                ),
                suffix != null
                    ? Positioned(top: 5, right: 0, child: suffix)
                    : Container(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Divider(color: sixthColor.withOpacity(0.8)),
          ),
        ],
      ),
    ),
  );
}

Widget input2(
    {obscure = false,
    text,
    prefix,
    prefixColor = tenthColor,
    suffix,
    controller}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: SizedBox(
      height: 58,
      child: Column(
        children: [
          SizedBox(
            height: 42,
            child: Stack(
              children: [
                TextField(
                  controller: controller,
                  obscureText: obscure,
                  cursorColor: primaryColor,
                  decoration: InputDecoration(
                    hintText: text,
                    hintStyle:
                        textStyle2.copyWith(color: tenthColor.withOpacity(0.8)),
                    border: InputBorder.none,
                    contentPadding:
                        const EdgeInsets.only(left: 40, top: 10, bottom: 10),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(top: 10, left: 5),
                      child: Icon(
                        prefix,
                        color: prefixColor,
                      ),
                    ),
                  ),
                  textAlign: TextAlign.center,
                  style: textStyle2.copyWith(fontSize: 16),
                ),
                Positioned(top: 10, right: 0, child: suffix),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Divider(color: sixthColor.withOpacity(0.8)),
          ),
        ],
      ),
    ),
  );
}

Widget input3({text, suffix, controller}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Container(
      height: 58,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: fourteenColor,
      ),
      child: Stack(
        children: [
          TextField(
            controller: controller,
            cursorColor: secondaryColor,
            decoration: InputDecoration(
              hintText: text,
              hintStyle:
                  textStyle2.copyWith(color: secondaryColor.withOpacity(0.8)),
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.only(left: 20, top: 15, bottom: 15),
            ),
            style: textStyle2.copyWith(fontSize: 16, color: secondaryColor),
          ),
          suffix != null
              ? Positioned(top: 0, bottom: 0, right: 10, child: suffix)
              : Container(),
        ],
      ),
    ),
  );
}

Widget input4({text, controller, prefixIcon, onChanged}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 1),
    child: SizedBox(
      height: 52,
      child: Column(
        children: [
          SizedBox(
            height: 36,
            child: Stack(
              children: [
                TextField(
                  controller: controller,
                  cursorColor: primaryColor,
                  decoration: InputDecoration(
                    hintText: text,
                    hintStyle: textStyle3,
                    border: InputBorder.none,
                    contentPadding:
                        const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  ),
                  textAlign: TextAlign.center,
                  style: textStyle3,
                  onChanged: onChanged,
                ),
                if (prefixIcon != null)
                  Positioned(
                    top: 10,
                    bottom: 0,
                    left: 20,
                    child: Icon(
                      prefixIcon,
                      color: primaryColor,
                      size: 15,
                    ),
                  )
                else
                  Container(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Divider(color: sixthColor.withOpacity(0.8)),
          ),
        ],
      ),
    ),
  );
}
