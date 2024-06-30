import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../models/Classes/country choose.dart';
import '../../../models/Classes/province choose.dart';
import '../../../models/utils/constant.dart';

class ProfileController extends GetxController{

  @override
  void onInit() {
    super.onInit();
    passwordController.text = passwordText;
  }


  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController IDController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  RxBool isShowCompanyChecked = true.obs;
  String passwordText = "12345678";
  bool isObscurePassword = true;


  File? _image;
  Widget displayImage() {
    if (_image == null) {
      return Container(
        height: 80,
        width: 80,
        decoration:  const BoxDecoration(
          shape: BoxShape.circle,
          color: secondaryColor,
        ),
        child: ClipRRect(
          child: Image.network(
            'https://images.unsplash.com/photo-1618641986557-1ecd230959aa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(75),
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(75),
        child: Image.file(
          _image!,
          fit: BoxFit.cover,
        ),
      );
    }
  }
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile!.path);
    });
  }

  void setState(Null Function() param0) {}
}

class CheckoutItem {
  List<ProvinceChoose> MyprovinceChoose;
  List<CountryChoose> MycountryChoose;

  CheckoutItem({
    required this.MyprovinceChoose,
    required this.MycountryChoose,
  });
}