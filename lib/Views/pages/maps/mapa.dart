import 'package:flutter/material.dart';

class Mapa extends StatelessWidget {
  const Mapa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/mapestibafy.png'),
        fit: BoxFit.fill,
      )),
    );
  }
}
