import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:growapp/models/app_data.dart';
import 'package:growapp/screens/login_screen.dart';
import 'package:growapp/widgets/store_bottom_navigation_bar.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class UserScreen extends StatelessWidget {

  static String id = "UserScreen";

  @override
  Widget build(BuildContext context) {
    Color primary = Colors.black.withOpacity(0.8);
    return Scaffold(
      bottomNavigationBar: StoreBottomNavigationBar(currentIndex: 2),
      backgroundColor: Colors.white.withOpacity(0.9),
      body: SafeArea(
        child: Consumer<AppData>(
          builder: (context, data, child) {
            return Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Material(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5)),
                    elevation: 3,
                    shadowColor: Colors.white,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(CupertinoIcons.back, size: 26, color: primary)
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await data.user.logout();
                                  Navigator.pushReplacementNamed(context, LoginScreen.id);
                                },
                                child: Icon(FontAwesomeIcons.signOutAlt, size: 24, color: primary)
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Text("My Profile", style:
                              TextStyle(
                                fontSize: 15,
                              ),
                            )
                          ),
                          Center(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(bottom: 20, top: 10),
                                    child: Icon(FontAwesomeIcons.user, color: primary)
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('${data.user.firstName} '),
                                      Text(data.user.lastName)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                            child: GestureDetector(
                              onTap: () async{
                                String uri = "tel:${data.user.phone}";
                                if (await canLaunch(uri)) {
                                  await launch(uri);
                                }
                              },
                              child: Row(
                                children: [
                                  Icon(OMIcons.phone, color: primary),
                                  SizedBox(width: 10),
                                  Text('${data.user.phone}'),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                            child: GestureDetector(
                              onTap: () async {
                                String uri = "mailto:${data.user.email}";
                                if (await canLaunch(uri)) {
                                  await launch(uri);
                                }
                              },
                              child: Row(
                                children: <Widget>[
                                  Icon(OMIcons.email, color: primary),
                                  SizedBox(width: 10),
                                  Text('${data.user.email}'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
