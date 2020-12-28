import 'package:flutter/material.dart';
import 'package:soket_io/core/utils/hexcolor.dart';
import 'dart:async';

import 'package:soket_io/features/home/home.dart';

class SplashScreen extends StatelessWidget {
  static const String myRoute = '/';
  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 300), () async {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Home()),
          (Route<dynamic> route) => false);
    });

    return Scaffold(
      backgroundColor: HexColor("#262223"),
      body: Container(),
    );
  }
}
