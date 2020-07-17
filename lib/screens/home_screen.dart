import 'package:flutter/material.dart';
import 'package:growapp/models/app_data.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  static String id = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (context, data, child) {
        return Scaffold(
          backgroundColor: Colors.redAccent,
          body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white
                      ),
                      child: Text(data.user.email),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red
                      ),
                    ),
                  ),
                ],
              )
          ),
        );
      }
    );
  }
}
