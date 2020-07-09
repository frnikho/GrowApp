import 'package:flutter/material.dart';
import 'package:growapp/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  static String id = "MainAppScreen";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        MyApp.id: (context) => MyApp(),
        HomeScreen.id: (context) => HomeScreen(),
      },
      home: HomeScreen(),
    );
  }
}
