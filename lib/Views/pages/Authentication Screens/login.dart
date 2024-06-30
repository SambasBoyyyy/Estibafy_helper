import 'package:estibafy_helpers/models/Authentication%20Form/authentication%20form.dart';
import 'package:estibafy_helpers/models/utils/constant.dart';
import 'package:estibafy_helpers/models/widgets/appbar.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      backgroundColor: secondaryColor,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: const LoginForm(),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
