import 'package:flutter/material.dart';
import 'package:growapp/models/app_data.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {

  static String id = "UserScreen";

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (context, data, child) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              child: Text(data.user.email),
            ),
          ),
        );
      },
    );
  }
}
