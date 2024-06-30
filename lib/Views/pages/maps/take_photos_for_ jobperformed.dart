import 'dart:convert';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:estibafy_helpers/models/Classes/web_apis.dart';
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:estibafy_helpers/models/widgets/pressed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../drawer.dart';
import '../job_accepted_by_customer.dart';
import 'mapa.dart';

class TakePhotosForJobPerformed extends StatefulWidget {
  const TakePhotosForJobPerformed(
      {Key? key, this.isStarting = false, required this.jobID})
      : super(key: key);

  final bool isStarting;
  final String jobID;

  @override
  State<TakePhotosForJobPerformed> createState() =>
      _TakePhotosForJobPerformedState();
}

class _TakePhotosForJobPerformedState extends State<TakePhotosForJobPerformed> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget displayImage1() {
    if (_image1 == null) {
      return DottedBorder(
        color: sixthColor,
        strokeWidth: 1,
        dashPattern: const [9, 9],
        child: const SizedBox(
            height: 70,
            width: 70,
            child: Icon(
              FontAwesomeIcons.solidImage,
              color: tertiaryColor,
            )),
      );
    } else {
      return Center(
        child: DottedBorder(
          color: Colors.black,
          strokeWidth: 1,
          dashPattern: const [9, 9],
          child: SizedBox(
            height: 70,
            width: 70,
            child: Image.file(
              _image1!,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }
  }

  Widget displayImage2() {
    if (_image2 == null) {
      return DottedBorder(
        color: sixthColor,
        strokeWidth: 1,
        dashPattern: const [9, 9],
        child: const SizedBox(
            height: 70,
            width: 70,
            child: Icon(
              FontAwesomeIcons.solidImage,
              color: tertiaryColor,
            )),
      );
    } else {
      return Center(
        child: DottedBorder(
          color: Colors.black,
          strokeWidth: 1,
          dashPattern: const [9, 9],
          child: SizedBox(
            height: 70,
            width: 70,
            child: Image.file(
              _image2!,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }
  }

  Widget displayImage3() {
    if (_image3 == null) {
      return DottedBorder(
        color: sixthColor,
        strokeWidth: 1,
        dashPattern: const [9, 9],
        child: const SizedBox(
            height: 70,
            width: 70,
            child: Icon(
              FontAwesomeIcons.solidImage,
              color: tertiaryColor,
            )),
      );
    } else {
      return Center(
        child: DottedBorder(
          color: Colors.black,
          strokeWidth: 1,
          dashPattern: const [9, 9],
          child: SizedBox(
            height: 70,
            width: 70,
            child: Image.file(
              _image3!,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }
  }

  File? _image1;
  File? _image2;
  File? _image3;

  final picker = ImagePicker();

  Future getImage1() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 75);
    setState(() {
      _image1 = File(pickedFile!.path);
    });
  }

  Future getImage2() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 75);
    setState(() {
      _image2 = File(pickedFile!.path);
    });
  }

  Future getImage3() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 75);
    setState(() {
      _image3 = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: getBody(context),
        drawer: const SideDrawer(),
      ),
    );
  }

  getBody(BuildContext context) {
    return Stack(
      children: [
        const Mapa(),
        upperOnlineTile(_scaffoldKey),
        bottomOrderAcceptedCard(),
      ],
    );
  }

  bottomOrderAcceptedCard() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 5,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        child: SizedBox(
          height: 400,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.isStarting
                    ? 'Take some photos of Check in'
                    : 'Take some photos for the job performed',
                style: textStyle2,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.isStarting
                    ? 'Before starting take some photos for Record'
                    : 'Before sending request to the customer take\nsome photos from the job  performed',
                style: textStyle2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera_alt_rounded,
                      size: 60,
                    )),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () {
                        getImage1();
                      },
                      child: displayImage1()),
                  GestureDetector(
                      onTap: () {
                        getImage2();
                      },
                      child: displayImage2()),
                  GestureDetector(
                      onTap: () {
                        getImage3();
                      },
                      child: displayImage3())
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              customButton5(widget.isStarting ? 'START JOB' : 'COMPLETE JOB',
                  secondaryColor, fifthColor, () async {
                File? selectedImage;

                if (_image1 == null && _image2 == null && _image3 == null) {
                  K.showToast(message: 'Take at least one picture');
                  return;
                }

                EasyLoading.show();

                selectedImage = _image1 ?? _image2 ?? _image3;

                final byteImage = await selectedImage!.readAsBytes();
                final imageToUpload = base64Encode(byteImage.toList());

                bool result = false;
                if (widget.isStarting) {
                  result = await WebAPIs.setJobStatus(
                    id: widget.jobID,
                    image: imageToUpload,
                    status: 'started',
                  );
                } else {
                  result = await WebAPIs.setJobStatus(
                    id: widget.jobID,
                    image: imageToUpload,
                    status: 'completed',
                  );
                }

                if (!result) {
                  K.showToast(
                    message:
                        "Couldn't ${widget.isStarting ? 'start' : 'complete'} job",
                  );
                  EasyLoading.dismiss();
                  return;
                }

                PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                  context,
                  settings: const RouteSettings(name: '/jobAcceptedByCustomer'),
                  screen: JobAcceptedByCustomer(
                      isStarting: widget.isStarting, jobID: widget.jobID),
                  withNavBar: true,
                );
                EasyLoading.dismiss();
              }),
            ],
          ),
        ),
      ),
    );
  }

  upperOnlineTile(key) {
    return Positioned(
      left: 0,
      right: 0,
      top: 15,
      child: SizedBox(
        height: 90,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Material(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(30),
                elevation: 20,
                child: IconButton(
                    onPressed: () {
                      key.currentState.openDrawer();
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: fourthColor,
                    )),
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 3, top: 3, bottom: 3),
                  child: Row(
                    children: [
                      Text(
                        'Online',
                        style: textStyle2,
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      const CircleAvatar(
                        backgroundColor: fifthColor,
                        child: Icon(
                          FontAwesomeIcons.solidHandshake,
                          color: fourthColor,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
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
}
