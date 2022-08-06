import 'package:flutter/material.dart';
import 'package:flutter_application_1/IntroEnglish.dart';
import 'package:flutter_application_1/IntroPersian.dart';
import 'package:flutter_application_1/data/modle/splashJson.dart';
import 'package:hexcolor/hexcolor.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 231, 224),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                _handlePersian();
              },
              child: Container(
                width: 170.0,
                height: 145.0,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(15.0),
                child: Text(
                  '!سلام\n .من جیبرس هستم\n\n\n فارسی',
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                _handleEnglish();
              },
              child: Container(
                width: 170.0,
                height: 145.0,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Hello! \n Im jibres. \n\n\n English',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handlePersian() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return Scaffold(
          backgroundColor: HexColor(from),
          body: SafeArea(
            child: IntroSlide(),
          ),
        );
      }),
    );
  }

  void _handleEnglish() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) {
          return Scaffold(
            backgroundColor: HexColor(from),
            body: SafeArea(
              child: IntroSlideEnglish(),
            ),
          );
        }),
      ),
    );
  }
}
