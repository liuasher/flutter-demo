import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

const kAndroidUserAgent = 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final flutterWebviewPlugin = new FlutterWebviewPlugin();

//    flutterWebviewPlugin.onUrlChanged.listen((String url) {
//      print('----------');
//      print(url);
//    });

    flutterWebviewPlugin.getCookies().then((m) {

//      Map<String, dynamic> info = m;//json.decode(m);
      print('-------------------↓');
      print(m);
      print(m['userId']);


      flutterWebviewPlugin.evalJavascript('alert(1111111111)');

    });

    return MaterialApp(
      title: 'aqara',
      routes: {
        '/': (_) {
          return WebviewScaffold(
            url: 'http://saas.aqara.cn',
            hidden: true,
              withLocalStorage: true,
            userAgent: kAndroidUserAgent
          );
        },
      },
    );
  }
}
