import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:growapp/models/app_data.dart';
import 'package:growapp/screens/home_screen.dart';
import 'package:growapp/screens/login_screen.dart';
import 'package:growapp/screens/user_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  static String id = "MainAppScreen";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppData>(
      create: (context) => AppData(),
      child: MaterialApp(
        routes: {
          MyApp.id: (_) => MyApp(),
          HomeScreen.id: (_) => HomeScreen(),
          UserScreen.id: (_) => UserScreen(),
        },
        home: LoginScreen(),
      ),
    );
  }
}
