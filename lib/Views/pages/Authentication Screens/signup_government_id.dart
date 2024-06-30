import 'dart:convert';
import 'dart:io';

import 'package:estibafy_helpers/Controllers/user_controller.dart';
import 'package:estibafy_helpers/Views/pages/Authentication%20Screens/succesfully_appli_sent.dart';
import 'package:estibafy_helpers/models/Classes/web_apis.dart';
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:estibafy_helpers/models/widgets/appbar.dart';
import 'package:estibafy_helpers/models/widgets/pressed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Controllers/Authentication Controllers/signup controller.dart';

class SignUpGovernmentID extends StatefulWidget {
  const SignUpGovernmentID({Key? key}) : super(key: key);

  @override
  State<SignUpGovernmentID> createState() => _SignUpGovernmentIDState();
}

class _SignUpGovernmentIDState extends State<SignUpGovernmentID> {
  SignUpController signUpController = Get.find(tag: K.signUpController);

  bool isFrontPic = true;
  bool isBackPic = false;

  final TextEditingController idController = TextEditingController();
  final TextEditingController mmController = TextEditingController();
  final TextEditingController yyController = TextEditingController();

  Widget displayFrontImage() {
    if (_image == null) {
      return Column(
        children: [
          Text(
            'Upload Front Picture of your ID',
            style: textStyle2.copyWith(color: sixthColor),
          ),
          useCameraButton(() {
            getCameraFrontImage();
          }),
          useGalleryButton(() {
            getGalleryFrontImage();
          }),
        ],
      );
    } else {
      return Center(
        child: Stack(
          children: [
            Container(
              height: 230,
              width: double.infinity,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  _image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 10,
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

  Widget displayBackImage() {
    if (_image2 == null) {
      return Column(
        children: [
          Text(
            'Upload Back Picture of License',
            style: textStyle2.copyWith(color: sixthColor),
          ),
          useCameraButton(() {
            getCameraBackImage();
          }),
          useGalleryButton(() {
            getGalleryBackImage();
          }),
        ],
      );
    } else {
      return Center(
        child: Stack(
          children: [
            Container(
              height: 230,
              width: double.infinity,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  _image2!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 40,
              child: CircleAvatar(
                backgroundColor: secondaryColor,
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        _image2 = null;
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
  File? _image2;

  final picker = ImagePicker();

  Future getCameraFrontImage() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 75);
    setState(() {
      _image = File(pickedFile!.path);
    });
  }

  Future getCameraBackImage() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 75);
    setState(() {
      _image2 = File(pickedFile!.path);
    });
  }

  Future getGalleryFrontImage() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 75);
    setState(() {
      _image = File(pickedFile!.path);
    });
  }

  Future getGalleryBackImage() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 75);
    setState(() {
      _image2 = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      backgroundColor: secondaryColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Government I.D',
                  style: textStyle1.copyWith(fontSize: 25),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Please upload the front picture\nof your Government issued ID',
              style: textStyle2.copyWith(color: sixthColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            idNumberField(controller: idController),
            const SizedBox(
              height: 20,
            ),
            expireDateFields(
                mmController: mmController, yyController: yyController),
            const SizedBox(
              height: 20,
            ),
            if (_image != null) Container(),
            const SizedBox(
              height: 30,
            ),
            displayFrontImage(),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      bottomNavigationBar: _image != null
          ? customButton4('Done', () async {
              if (signUpController.idNumber == '' ||
                  signUpController.month == '' ||
                  signUpController.year == '') {
                K.showToast(message: 'Please Fill all Fields');
                return;
              }

              try {
                int month = int.parse(signUpController.month);
                int.parse(signUpController.year);

                if (month < 1 || month > 12) {
                  K.showToast(message: 'Invalid month');
                  return;
                }

                if (signUpController.year.length < 4) {
                  K.showToast(message: 'Please input whole year e.g 2022');
                  return;
                }
              } catch (e) {
                K.showToast(message: 'Invalid month or year');
                return;
              }

              signUpController.govtIdFront = _image;
              signUpController.govtIdBack = _image2;

              EasyLoading.show();

              UserController _controller = Get.find(tag: K.userControllerTag);
              // final result = await _controller.signUp(
              //   name: signUpController.name,
              //   email: signUpController.email,
              //   phone: signUpController.phone,
              //   password: signUpController.password,
              //   passwordConfirm: signUpController.password,
              //
              // );
              //
              // final byteImage = await _image!.readAsBytes();
              // final imageToUpload = base64Encode(byteImage.toList());
              //
              // if (result) {
              //   final govtIDResult = await WebAPIs.addGovtData(
              //     id: signUpController.idNumber,
              //     image: imageToUpload,
              //     expiryDate:
              //         '${signUpController.year}/${signUpController.month}/01',
              //   );
              //   if (govtIDResult) {
              //     Get.to(
              //         ApplicationSuccessfullySent(name: signUpController.name));
              //   }
              // }

              EasyLoading.dismiss();
            })
          : Container(
              height: 20,
            ),
    );
  }

  idNumberField({controller}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'I.D. Number',
                style: textStyle2.copyWith(color: sixthColor),
              )),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: tertiaryColor.withOpacity(0.1),
          ),
          child: TextField(
            controller: controller,
            onChanged: (value) {
              signUpController.idNumber = value;
            },
            decoration: InputDecoration(
              hintText: 'I.D. Number',
              hintStyle: textStyle2.copyWith(color: tenthColor),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(left: 30),
            ),
          ),
        ),
      ],
    );
  }

  expireDateFields({mmController, yyController}) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Text(
            'Exp. Date',
            style: textStyle2,
          ),
        ),
        Container(
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: sixthColor, width: 0.5),
          ),
          child: TextField(
            controller: mmController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(2),
            ],
            decoration: InputDecoration(
              hintText: 'MM',
              hintStyle: textStyle2,
              border: InputBorder.none,
            ),
            onChanged: (value) {
              signUpController.month = value;
            },
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: sixthColor, width: 0.5),
          ),
          child: TextField(
            controller: yyController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(4),
            ],
            onChanged: (value) {
              signUpController.year = value;
            },
            decoration: InputDecoration(
              hintText: 'YY',
              hintStyle: textStyle2,
              border: InputBorder.none,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  useCameraButton(function) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 50),
          elevation: 8,
          child: Center(
            child: TextButton(
              onPressed: function,
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    FontAwesomeIcons.cameraRetro,
                    color: fourthColor,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Use Camera',
                    style: textStyle2,
                  ),
                ],
              ),
            ),
          )),
    );
  }

  useGalleryButton(function) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 50),
        elevation: 8,
        child: Center(
          child: TextButton(
            onPressed: function,
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.photo,
                  color: fourthColor,
                  size: 30,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'Upload from photo gallery',
                  style: textStyle2,
                ),
              ],
            ),
          ),
        ));
  }
}
