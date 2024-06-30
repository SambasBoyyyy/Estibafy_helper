import 'package:estibafy_helpers/Views/pages/Authentication%20Screens/login.dart';
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:estibafy_helpers/models/widgets/pressed_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ApplicationSuccessfullySent extends StatelessWidget {
  const ApplicationSuccessfullySent({Key? key, required this.name})
      : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 120),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: primaryColor.withOpacity(0.5)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      FontAwesomeIcons.checkCircle,
                      color: fifthColor,
                      size: 150,
                    ),
                    Text(
                      'Your application was successfully sent'
                      '\nWe will send you and email and text'
                      '\nmessage in 24 to 48 hours',
                      style: textStyle2,
                      textAlign: TextAlign.center,
                    ),
                    customButton4('Done', () {
                      K.showToast(message: 'Welcome $name');
                      Get.offAll(() => const Login());
                    }),
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
