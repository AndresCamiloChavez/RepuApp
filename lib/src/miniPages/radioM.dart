import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RadioPageM extends StatefulWidget {
  @override
  _RadioPageMState createState() => _RadioPageMState();
}

class _RadioPageMState extends State<RadioPageM> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      width: 200,
      child: WebView(
        initialUrl: 'http://republicanaradio.com/',
      ),
    );
  }
}
