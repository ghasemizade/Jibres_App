import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'data/modle/introJson.dart';
import 'data/modle/splashJson.dart';

class IntroSlide extends StatefulWidget {
  const IntroSlide({Key? key}) : super(key: key);

  @override
  IntroSlideState createState() => IntroSlideState();
}

class IntroSlideState extends State<IntroSlide> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        title: title1,
        description: desc1,
        pathImage: "Images/logo.png",
        backgroundColor: HexColor(from),
      ),
    );
    slides.add(
      Slide(
        title: subtitle2,
        description: desc2,
        pathImage: "Images/logo.png",
        backgroundColor: HexColor(from),
      ),
    );
    slides.add(
      Slide(
        title: title,
        description: subtitle5,
        pathImage: "Images/logo.png",
        backgroundColor: HexColor(from),
      ),
    );
  }

  // void onDonePress() {
  //   // Do what you want
  //   log("End of slides");
  // }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: slides,
      onDonePress: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            return Scaffold(
              backgroundColor: HexColor(from),
              body: SafeArea(
                child: WebView(
                  initialUrl: ('https://jibres.ir/my'),
                  javascriptMode: JavascriptMode.unrestricted,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
