import 'dart:io';

import 'package:estibafy_helpers/Views/pages/Authentication%20Screens/signup_government_id.dart';
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:estibafy_helpers/models/widgets/appbar.dart';
import 'package:estibafy_helpers/models/widgets/pressed_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';

import '../../../Controllers/Authentication Controllers/signup controller.dart';

class SignUpDocuments extends StatefulWidget {
  const SignUpDocuments({Key? key}) : super(key: key);

  @override
  State<SignUpDocuments> createState() => _SignUpDocumentsState();
}

class _SignUpDocumentsState extends State<SignUpDocuments> {
  SignUpController signUpController = Get.find(tag: K.signUpController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, actions: [
        TextButton(
          onPressed: () {
            Get.to(() => const SignUpGovernmentID());
          },
          child: const Text('Skip'),
        )
      ]),
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
                  FontAwesomeIcons.solidFile,
                  size: 30,
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              Text(
                'Documents',
                style: textStyle1.copyWith(fontSize: 25),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Please upload the required documentation',
            style: textStyle2.copyWith(color: sixthColor),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: IconButton(
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    allowMultiple: true,
                    type: FileType.custom,
                    allowedExtensions: ['pdf', 'doc'],
                  );
                  if (result == null) return;
                  Get.to(
                      OpenFiles(files: result.files, onOpenedFile: openFile));
                  Get.snackbar(
                      'Estibafy', 'Please wait while document loading..',
                      backgroundColor: primaryColor, colorText: secondaryColor);
                },
                icon: const Icon(
                  FontAwesomeIcons.plus,
                  color: fourthColor,
                )),
          )),
        ],
      ),
    );
  }

  openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
}

class OpenFiles extends StatelessWidget {
  final List<PlatformFile> files;
  final ValueChanged<PlatformFile> onOpenedFile;

  const OpenFiles({Key? key, required this.files, required this.onOpenedFile})
      : super(key: key);
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
                  FontAwesomeIcons.solidFile,
                  size: 30,
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              Text(
                'Documents',
                style: textStyle1.copyWith(fontSize: 25),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Please upload the required documentation if any',
            style: textStyle2.copyWith(color: sixthColor),
          ),
          const SizedBox(
            height: 30,
          ),
          ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: files.length,
              itemBuilder: (context, index) {
                final file = files[index];
                return ListTile(
                  onTap: () => OpenFile.open(file.path!),
                  leading: const Icon(
                    Icons.check_circle,
                    color: tertiaryColor,
                  ),
                  title: Text(
                    file.name,
                    style: textStyle3,
                  ),
                );
              }),
        ],
      ),
      bottomNavigationBar: customButton4('Next', () {
        SignUpController signUpController = Get.find(tag: K.signUpController);
        signUpController.requiredDocs.clear();
        for (final element in files) {
          signUpController.requiredDocs.add(File(element.path!));
        }
        Get.to(const SignUpGovernmentID());
      }),
    );
  }
}
