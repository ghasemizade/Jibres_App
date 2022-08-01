import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: "https://jibres.ir/enter?referer=my",
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
