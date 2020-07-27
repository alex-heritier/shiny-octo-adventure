import 'package:chinese_fluent/screen/home.dart';
import 'package:chinese_fluent/value/styles.dart';
import 'package:flutter/material.dart';

void main() => runApp(ChineseFluent());

class ChineseFluent extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chinese Fluent',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
//        primarySwatch: Colors.red, // Colors.blue,
//        primaryColor: Styles.THEME_RED,
      ),
      home: Home(),
    );
  }
}
