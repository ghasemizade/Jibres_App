import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Intro.dart';
import 'package:flutter_application_1/data/json.dart';
import 'data/json.dart';
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

  String logo = '';
  String theme = '';
  String title = '';
  String desc = '';
  String meta = '';
  String from = '';
  String to = '';
  String primary = '';
  String secondary = '';

  @override
  void initState() {
    _getData();
    getConnectivity();
    super.initState();
    _handleSplash();
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
                image: NetworkImage(
                    'https://cdn.jibres.ir/logo/icon-white/png/Jibres-Logo-icon-white-1024.png'),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 32,
                color: Colors.white,
              ),
            ),
            Text(
              desc,
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
              meta,
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

  void _getData() async {
    var uri = Uri.parse('https://core.jibres.ir/r10/android/splash');
    Response response = await get(uri);
    String logo1 = jsonDecode(response.body)['result']['logo'];
    String theme1 = jsonDecode(response.body)['result']['theme'];
    String title1 = jsonDecode(response.body)['result']['title'];
    String desc1 = jsonDecode(response.body)['result']['desc'];
    String meta1 = jsonDecode(response.body)['result']['meta'];
    int sleep1 = jsonDecode(response.body)['result']['sleep'];
    String from1 = jsonDecode(response.body)['result']['bg']['from'];
    String to1 = jsonDecode(response.body)['result']['bg']['to'];
    String primary1 = jsonDecode(response.body)['result']['color']['primary'];
    String secondary1 =
        jsonDecode(response.body)['result']['color']['secondary'];

    setState(() {
      logo = logo1;
      theme = theme1;
      title = title1;
      desc = desc1;
      meta = meta1;
      from = from1;
      to = to1;
      primary = primary1;
      secondary = secondary1;
    });
  }

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
