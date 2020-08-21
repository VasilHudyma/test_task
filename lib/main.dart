import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Test Task', home: Scaffold(body: MyHomePage()));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _backgroundColor;
  Color _textColor;

  Color _generateRandomColor() {
    var _random = Random();
    return Color.fromRGBO(
        _random.nextInt(256), _random.nextInt(256), _random.nextInt(256), 1.0);
  }

  void _changeBackgroundAndTextColor() {
    _backgroundColor = _generateRandomColor();

    //for better contrast, if background is dark then text color is white, if background is light then text color is black
    _textColor =
        _backgroundColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Text(
          "Hey there",
          style: TextStyle(fontSize: 20, color: _textColor),
        ),
        alignment: Alignment.center,
        color: _backgroundColor,
      ),
      onTap: () {
        Vibration.vibrate(duration: 100);
        setState(() {
          _changeBackgroundAndTextColor();
        });
      },
    );
  }
}
