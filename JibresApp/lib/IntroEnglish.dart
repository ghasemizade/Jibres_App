import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/modle/splashJson.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class IntroSlideEnglish extends StatefulWidget {
  const IntroSlideEnglish({Key? key}) : super(key: key);

  @override
  IntroSlideEnglishState createState() => IntroSlideEnglishState();
}

class IntroSlideEnglishState extends State<IntroSlideEnglish> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        title: "Hello",
        description: "Welcome to the world of Jibbers",
        pathImage: "Images/logo.png",
        backgroundColor: HexColor(from),
      ),
    );
    slides.add(
      Slide(
        title: "Sell and Enjoy",
        description: "Platform electronic commerce",
        pathImage: "Images/logo.png",
        backgroundColor: HexColor(from),
      ),
    );
    slides.add(
      Slide(
        title: "Jibres",
        description: "Sometimes you need a big change",
        pathImage: "Images/logo.png",
        backgroundColor: HexColor(from),
      ),
    );
  }


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
                  initialUrl: ('https://jibres.com/my'),
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
