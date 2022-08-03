import 'package:flutter/material.dart';
import 'package:flutter_application_1/IntroEnglish.dart';
//import 'package:flutter_application_1/HomePage.dart';
import 'package:flutter_application_1/IntroPersian.dart';
import 'package:flutter_application_1/Lang.dart';
import 'package:flutter_application_1/splash.dart';

// import 'package:flutter_application_1/Login.dart';
// import 'package:flutter_application_1/chooseLang.dart';
// import 'package:flutter_application_1/splash.dart';
// import 'package:introduction_screen/introduction_screen.dart';
//import 'package:dio/dio.dart';
//import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'vazir'),
      home: splashScreen(),
    );
  }
}
