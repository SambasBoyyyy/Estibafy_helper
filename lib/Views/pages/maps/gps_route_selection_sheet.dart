
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GPSRouteSelectionSheet extends StatelessWidget {
  const GPSRouteSelectionSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.arrow_branch,
                        color: fifthColor,
                      )),
                  Text(
                    'Select a GPS',
                    style: textStyle3,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        CupertinoIcons.multiply_circle,
                        color: tertiaryColor,
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'WAZE',
                          style: textStyle3.copyWith(fontSize: 16),
                        )),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(
                        color: tertiaryColor,
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'GOOGLE MAPS',
                          style: textStyle3.copyWith(fontSize: 16),
                        )),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(
                        color: tertiaryColor,
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'MAPS',
                          style: textStyle3.copyWith(fontSize: 16),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
