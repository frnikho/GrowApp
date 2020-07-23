import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:growapp/models/app_data.dart';
import 'package:growapp/screens/home_screen.dart';
import 'package:growapp/screens/login_screen.dart';
import 'package:growapp/screens/user_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

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
        home: Consumer<AppData>(
          builder: (context, data, child) {
            return LoginOrHomeScreen(data);
          },
        ),
      ),
    );
  }
}

class LoginOrHomeScreen extends StatelessWidget {

  final AppData data;

  LoginOrHomeScreen(this.data);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: data.user.loadFromStorage(context),
      builder: (context, snap) {
        if (snap.hasData && snap.data == false) {
          return LoginScreen();
        } else if (snap.hasData && snap.data == true) {
          return HomeScreen();
        }
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
