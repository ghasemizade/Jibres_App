import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
        title: "سلام",
        description: "به دنیای جیبرس خوش آمدید",
        pathImage: "Images/Jibres-Logo-icon-white-1024.png",
        backgroundColor: const Color.fromARGB(255, 200, 10, 90),
      ),
    );
    slides.add(
      Slide(
        title: "بفروش و لذت ببر",
        description: "پلتفرم تجارت الکترونیک همه کاره",
        pathImage: "Images/Jibres-Logo-icon-white-1024.png",
        backgroundColor: const Color.fromARGB(255, 200, 10, 90),
      ),
    );
    slides.add(
      Slide(
        title: "جیبرس",
        description: ".برخی اوقات شما نیاز به یک تغییر بزرگ دارید",
        pathImage: "Images/Jibres-Logo-icon-white-1024.png",
        backgroundColor: const Color.fromARGB(255, 200, 10, 90),
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
            return WebView(
              initialUrl: ('https://jibres.ir/'),
              javascriptMode: JavascriptMode.unrestricted,
            );
          }),
        );
      },
    );
  }
}
