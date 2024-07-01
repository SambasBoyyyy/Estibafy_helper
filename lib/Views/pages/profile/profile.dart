import 'package:country_code_picker/country_code_picker.dart';
import 'package:estibafy_helpers/Controllers/user_controller.dart';
import 'package:estibafy_helpers/models/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Controllers/Tab Controllers/profile controller.dart';
import '../../../models/Example Object/example_object.dart';
import '../../../models/utils/constant.dart';
import '../../../models/widgets/input_widget.dart';
import '../drawer.dart';

class Profile extends StatefulWidget {
  final bool isBackButton;

  const Profile({Key? key, required this.isBackButton}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileController profileController =Get.put(ProfileController());
  final UserController _userController =Get.find(tag: K.userControllerTag);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String? provinceChoose;
  String? countryChoose ;

  @override
  Widget build(BuildContext context) {
    final userData = K.localStorage.read(K.userControllerTag);
    final userName = userData != null ? userData['name'] : 'Guest';
    final userEmail = userData != null ? userData['email'] : 'guest@example.com';
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: secondaryColor,
        drawer: const SideDrawer(),
        appBar: widget.isBackButton == true
            ? getAppBar6('Profile', _scaffoldKey, context)
            : getAppBar5('Profile', _scaffoldKey),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 850,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color:sixthColor),
                        borderRadius: BorderRadius.circular(15),
                        color:secondaryColor,
                        boxShadow: [
                          BoxShadow(
                            color:primaryColor.withOpacity(0.5),
                            blurRadius: 9,
                            offset: const Offset(4, 8), // Shadow position
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 40),
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      margin: const EdgeInsets.only(
                        top: 60,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: input4(
                                      text: _userController.user.value.name,
                                      controller: _userController.nameControllerSignup),
                                ),
                                // Expanded(
                                //   child: input4(
                                //       text: 'Martinez',
                                //       controller: profileController.lastNameController),
                                // ),
                              ],
                            ),
                            input4(
                                text: _userController.user.value.email,
                                controller: profileController.emailController),
                            // input4(
                            //     text: 'Comandato',
                            //     controller: profileController.companyController),
                            Row(
                              children: [
                                // Expanded(
                                //   child: Stack(
                                //     children: [
                                //       Center(
                                //         child: CountryCodePicker(
                                //           initialSelection: 'ec',
                                //           showCountryOnly: false,
                                //           showOnlyCountryWhenClosed: false,
                                //           alignLeft: true,
                                //           favorite: const ['+593', 'ec'],
                                //           textStyle: textStyle3,
                                //         ),
                                //       ),
                                //       Positioned(
                                //         left: 0,
                                //         right: 0,
                                //         bottom: 0,
                                //         child: Padding(
                                //           padding: const EdgeInsets.symmetric(
                                //               horizontal: 17),
                                //           child: Divider(
                                //               color:
                                //               sixthColor.withOpacity(0.8)),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                Expanded(
                                  child: input4(
                                      text: _userController.user.value.phoneNumber,
                                      controller:_userController.contactControllerSignup ),
                                ),
                              ],
                            ),
                            // input4(text: '67778889', controller: profileController.IDController),
                            input4(
                                text: (_userController.user.value.address!=null && _userController.user.value.address!.isEmpty)
                                  ?'${_userController.user.value.address}'
                                  :"N/A"
                                ,controller: profileController.addressController),
                            Row(
                              children: [
                                Expanded(
                                  child: input4(
                                      text: (_userController.user.value.city!=null && _userController.user.value.city!.isEmpty)
                                          ?'${_userController.user.value.city}'
                                          :"N/A",
                                      controller: profileController.cityController),
                                ),
                                Expanded(
                                  child: input4(
                                      text: (_userController.user.value.state!=null && _userController.user.value.state!.isEmpty)
                                          ?'${_userController.user.value.state}'
                                          :"N/A",
                                      controller: profileController.stateController),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 36,
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 30),
                                            child: Text((_userController.user.value.country!=null && _userController.user.value.country!.isEmpty)
                                                ?'${_userController.user.value.country}'
                                                :"N/A",
                                                style: textStyle3),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 17),
                                        child: Divider(
                                            color: sixthColor.withOpacity(0.8)),
                                      ),
                                    ],
                                  ),
                                ),
                                // Expanded(
                                //   child: input4(
                                //       text: '000000',
                                //       controller: profileController.zipCodeController),
                                // ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            // Row(
                            //   children: [
                            //     ClipRRect(
                            //       clipBehavior: Clip.hardEdge,
                            //       borderRadius: const BorderRadius.all(
                            //           Radius.circular(5)),
                            //       child: Transform.scale(
                            //         scale: 0.9,
                            //         child: Theme(
                            //           data: ThemeData(
                            //               unselectedWidgetColor: fourthColor),
                            //           child: Checkbox(
                            //             checkColor: secondaryColor,
                            //             focusColor: primaryColor,
                            //             hoverColor: secondaryColor,
                            //             activeColor: primaryColor,
                            //             value: profileController.isShowCompanyChecked.value,
                            //             onChanged: (bool? value) {
                            //               setState(() {
                            //                 profileController.isShowCompanyChecked.value = value!;
                            //               });
                            //             },
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //     Text(
                            //       "Show as company",
                            //       style: textStyle2,
                            //     ),
                            //   ],
                            // ),
                            Divider(
                              color: tertiaryColor.withOpacity(0.5),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text('Password', style: textStyle3),
                            const SizedBox(
                              height: 5,
                            ),
                            Stack(
                              children: [
                                TextField(
                                  controller: _userController.passwordControllerSignup,
                                  cursorColor: primaryColor,
                                  obscureText: profileController.isObscurePassword,
                                  decoration: InputDecoration(
                                    hintText: _userController.user.value.password,
                                    hintStyle: textStyle3,
                                    border: InputBorder.none,
                                    prefixIcon: const Icon(
                                      FontAwesomeIcons.key,
                                      color: tenthColor,
                                      size: 16,
                                    ),
                                    suffix: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (profileController.isObscurePassword == true) {
                                            profileController.isObscurePassword = false;
                                          } else {
                                            profileController.isObscurePassword = true;
                                          }
                                        });
                                      },
                                      icon:  const Icon(
                                        Icons.remove_red_eye,
                                        color: tenthColor,
                                        size: 20,
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.only(
                                        left: 10, top: 10, bottom: 10),
                                  ),
                                  textAlign: TextAlign.center,
                                  style: textStyle3,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: SizedBox(
                                height: 55,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    await _userController.updateProfile();
                                    _userController.loadUserData();
                                    setState(() {});
                                  },
                                  style: ElevatedButton.styleFrom(
                                      foregroundColor: secondaryColor, backgroundColor: primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      )),
                                  child: Text(
                                    'Save',
                                    style: textStyle3.copyWith(
                                        color: secondaryColor),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: secondaryColor,
                          border: Border.all(color: tertiaryColor),
                        ),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              profileController.getImage();
                            },
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: tertiaryColor),
                              ),
                              child:  profileController.displayImage(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
