import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/home_screen.dart';
import '../screens/user_screen.dart';

class StoreBottomNavigationBar extends StatelessWidget {

  final int currentIndex;

  StoreBottomNavigationBar({@required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      backgroundColor: Colors.white.withOpacity(0.97),
      showUnselectedLabels: false,
      showSelectedLabels: false,
      iconSize: 22,
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == currentIndex)
          return;
        if (index == 0)
          Navigator.pushReplacementNamed(context, HomeScreen.id);
        if (index == 2)
          Navigator.pushReplacementNamed(context, UserScreen.id);
      },
      selectedItemColor: Colors.black,
      items: [
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.tag_solid), title: Text("")),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.eye_solid), title: Text("")),
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.userAlt), title: Text("")),
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.shoppingBag), title: Text(""))
      ],
    );
  }
}