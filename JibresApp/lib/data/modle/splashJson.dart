import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class json extends StatefulWidget {
  json({Key? key}) : super(key: key);

  @override
  State<json> createState() => _jsonState();
}

//splash
String logo =
    "https://cdn.jibres.ir/logo/icon-white/png/Jibres-Logo-icon-white-1024.png";
String theme = "Jibres";
String title = "جیبرس";
String desc = "بفروش و لذت ببر";
String meta = "قدرت گرفته از جیبرس";
int sleep = 3000;
String from = "#c80a5a";
String to = "#c80a5a";
String primary = "#ffffff";
String secondary = "#eeeeee";

class _jsonState extends State<json> {
  @override
  void initState() {
    _getDataSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void _getDataSplash() async {
    var uri = Uri.parse('https://core.jibres.ir/r10/android/splash');
    Response response = await get(uri);

    setState(() {
      logo = jsonDecode(response.body)["result"]["logo"];
      theme = jsonDecode(response.body)["result"]["theme"];
      title = jsonDecode(response.body)["result"]["title"];
      desc = jsonDecode(response.body)["result"]["desc"];
      meta = jsonDecode(response.body)["result"]["meta"];
      sleep = jsonDecode(response.body)["result"]["sleep"];
      from = jsonDecode(response.body)["result"]["bg"]["from"];
      to = jsonDecode(response.body)["result"]["bg"]["to"];
      primary = jsonDecode(response.body)["result"]["color"]["primary"];
      secondary = jsonDecode(response.body)["result"]["color"]["secondary"];
    });
  }
}
