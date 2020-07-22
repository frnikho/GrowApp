import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:growapp/models/app_data.dart';
import 'package:growapp/models/login_status.dart';
import 'package:growapp/screens/user_screen.dart';
import 'package:provider/provider.dart';

const Duration sd = Duration(milliseconds: 1500);

class LoginScreen extends StatelessWidget {

  static String id = "LoginScreen";

  void _submit(AppData data, BuildContext _) async {
    SnackBar status;
    if (data.user.email == "email" || data.user.email.isEmpty)
      status = SnackBar(duration: sd, content: Text("Check your email"), backgroundColor: Colors.redAccent);
    if (status == null && (data.user.password == "password" || data.user.password.isEmpty))
      status = SnackBar(duration: sd, content: Text("Check your password"), backgroundColor: Colors.redAccent);

    if (status != null) {
      Scaffold.of(_).showSnackBar(status);
      return;
    }
    LoginStatus result = await data.user.login();
    if (result == LoginStatus.api_connection_error)
      status = SnackBar(duration: sd, content: Text("Error, api is offline"));
    if (result == LoginStatus.api_request_error)
      status = SnackBar(duration: sd, content: Text("Please check your email and your password"));
    if (result == LoginStatus.success) {
      Navigator.pushReplacementNamed(_, UserScreen.id);
      return;
    }
    Scaffold.of(_).showSnackBar(status);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: Consumer<AppData>(
        builder: (context, data, widget) {
          return SafeArea(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  child: Text("Login", style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 32, fontWeight: FontWeight.w600), textAlign: TextAlign.center)),
                Container(
                  height: 125,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.only(right: 60),
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(50), bottomRight: Radius.circular(50)),
                            color: Colors.white,
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: TextField(
                              onChanged: (value) {
                                data.user.setEmail(value);
                              },
                              textAlign: TextAlign.left,
                              keyboardType: TextInputType.emailAddress,
                              textAlignVertical: TextAlignVertical.bottom,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(FontAwesomeIcons.user, size: 20),
                                hintText: "Email Adress",
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.only(right: 60),
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(50), bottomRight: Radius.circular(50)),
                            color: Colors.white,
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: TextField(
                              onChanged: (value) {
                                data.user.setPassword(value);
                              },
                              onSubmitted: (value) {
                                _submit(data, context);
                              },
                              textAlign: TextAlign.left,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              textAlignVertical: TextAlignVertical.bottom,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(FontAwesomeIcons.lock, size: 20),
                                hintText: "***********",
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: EdgeInsets.only(right: 30),
                          child: GestureDetector(
                            onTap: () {
                              _submit(data, context);
                            },
                            child: CircleAvatar(
                              radius: 30,
                              child: Icon(FontAwesomeIcons.arrowRight, color: Colors.white, size: 28),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class ActionButtonWithIcon extends StatelessWidget {

  final Icon icon;
  final String name;

  ActionButtonWithIcon({@required this.name, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      height: 70,
      decoration: BoxDecoration(
        color: Color(0xFF2d93e8),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Colors.white
            ),
            child: icon,
          ),
          SizedBox(width: 40),
          Text("$name", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16)),
        ],
      ),
    );
  }
}
