import 'dart:io';

import 'package:estibafy_helpers/Views/pages/Authentication%20Screens/signup_documents.dart';
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:estibafy_helpers/models/widgets/appbar.dart';
import 'package:estibafy_helpers/models/widgets/pressed_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Controllers/Authentication Controllers/signup controller.dart';

class SignUpTakeASelfie extends StatefulWidget {
  const SignUpTakeASelfie({Key? key}) : super(key: key);

  @override
  State<SignUpTakeASelfie> createState() => _SignUpTakeASelfieState();
}

class _SignUpTakeASelfieState extends State<SignUpTakeASelfie> {
  SignUpController signUpController = Get.find(tag: K.signUpController);

  Widget displayImage() {
    if (_image == null) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: IconButton(
          onPressed: () {
            getImage();
          },
          icon: const Icon(
            FontAwesomeIcons.camera,
            size: 45,
          ),
        ),
      );
    } else {
      return Center(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  left: 30, right: 30, bottom: 20, top: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: Image.file(
                  _image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 40,
              child: CircleAvatar(
                backgroundColor: secondaryColor,
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        _image = null;
                      });
                    },
                    icon: const Icon(
                      FontAwesomeIcons.times,
                      color: fourthColor,
                    )),
              ),
            ),
          ],
        ),
      );
    }
  }

  File? _image;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 75);
    setState(() {
      _image = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      backgroundColor: secondaryColor,
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: Icon(
                  FontAwesomeIcons.camera,
                  size: 30,
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              Text(
                'Take a selfie',
                style: textStyle1.copyWith(fontSize: 25),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Please take a photo of yourself',
            style: textStyle2.copyWith(color: sixthColor),
          ),
          Expanded(
            child: displayImage(),
          ),
        ],
      ),
      bottomNavigationBar: _image != null
          ? Padding(
              padding: const EdgeInsets.only(bottom: 22),
              child: customButton(
                function: () {
                  signUpController.selfie = _image;
                  Get.to(() => const SignUpDocuments());
                },
                text: 'Next',
                textColor: secondaryColor,
                arrowColor: secondaryColor,
                fillColor: primaryColor,
                borderColor: primaryColor,
                height: 55.0,
                margin: 20.0,
              ),
            )
          : Container(
              height: 55,
            ),
    );
  }
}
