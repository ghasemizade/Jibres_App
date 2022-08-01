import 'dart:async';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Intro.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:webview_flutter/webview_flutter.dart';

class splashScreen extends StatefulWidget {
  splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen>
    with TickerProviderStateMixin {
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    getConnectivity();
    super.initState();
    _handleSplash();
    super.initState();
  }

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox();
            setState(() => isAlertSet = true);
          }
        },
      );

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //getData();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 200, 10, 90),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 180.0,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 80),
                child: Image(
                    image:
                        AssetImage('Images/Jibres-Logo-icon-white-1024.png'))),
            Text(
              "جیبرس",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 32,
                color: Colors.white,
              ),
            ),
            Text(
              "بفروش و لذت ببر",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 200.0,
            ),
            CircularProgressIndicator(
              strokeWidth: 2,
            ),
            Text(
              "قدرت گرفته از جیبرس",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  showDialogBox() => showCupertinoDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('No Connection'),
          content: const Text('Please check your internet connectivity'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.pop(context, 'Cancel');
                setState(() => isAlertSet = false);
                isDeviceConnected =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnected) {
                  showDialogBox();
                  setState(() => isAlertSet = true);
                }
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );

  // var logo = '';
  // var theme = '';
  // var title = '';
  // var desc = '';
  // var meta = '';
  // var from = '';
  // var to = '';
  // var primary = '';
  // var secondary = '';

  // void getData() async {
  //   var uri = Uri.parse('https://core.jibres.ir/r10/android/splash');

  //   Response response = await get(uri);

  //   setState(() {
  //     logo = jsonDecode(response.body)["result"]["logo"];
  //     theme = jsonDecode(response.body)["result"]["theme"];
  //     title = jsonDecode(response.body)["result"]["title"];
  //     desc = jsonDecode(response.body)["result"]["desc"];
  //     meta = jsonDecode(response.body)["result"]["meta"];
  //     sleep = jsonDecode(response.body)["result"]["sleep"];
  //     from = jsonDecode(response.body)["result"]["bg"]["from"];
  //     to = jsonDecode(response.body)["result"]["bg"]["to"];
  //     primary = jsonDecode(response.body)["result"]["color"]["primary"];
  //     secondary = jsonDecode(response.body)["result"]["color"]["primary"];
  //   });
  // }

  void _handleSplash() async {
    await Future.delayed(Duration(milliseconds: 3000));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return IntroSlide();
      }),
    );
  }
}
