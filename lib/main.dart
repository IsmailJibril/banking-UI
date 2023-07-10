import 'package:flutter/material.dart';

import 'pages/root_page.dart';

void main(){
  runApp(MaterialApp(
    
    debugShowCheckedModeBanner: false,
    theme: appThemeData,
    home: RootApp(),
  ));
}

final ThemeData appThemeData = ThemeData(
  primaryColor: Colors.blueAccent,
  backgroundColor: Colors.white,
  hintColor: Colors.blue,
  fontFamily: 'Georgia',
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  ),
);