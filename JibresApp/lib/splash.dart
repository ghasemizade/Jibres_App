import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Lang.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'data/modle/splashJson.dart';

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
      backgroundColor: HexColor(from),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 180.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80),
              child: Image(
                image: NetworkImage(logo),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 28,
                color: HexColor(primary),
              ),
            ),
            Text(
              desc,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 20,
                color: HexColor(primary),
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
                color: HexColor(primary),
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

  void _handleSplash() async {
    await Future.delayed(Duration(milliseconds: sleep));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return Scaffold(
          body: Language(),
        );
      }),
    );
  }
}
