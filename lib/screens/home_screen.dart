import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:growapp/models/app_data.dart';
import 'package:growapp/widgets/store_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  static String id = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (context, data, child) {
        return Scaffold(
          bottomNavigationBar: StoreBottomNavigationBar(currentIndex: 0),
          backgroundColor: Colors.white.withOpacity(0.97),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Colors.black.withOpacity(0.05),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search",
                                ),
                                onTap: () {

                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 26),
                        CircleAvatar(
                          radius: 22,
                          child: Icon(FontAwesomeIcons.tag, size: 16, color: Colors.black),
                          backgroundColor: Colors.black.withOpacity(0.05),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return BestSellersCard(index: index);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}

class BestSellersCard extends StatelessWidget {

  final int index;

  const BestSellersCard({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: <Widget>[
          Container(
            width: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
          ),
          Positioned(
            child: Container(
              width: 250,
              height: 220,
              decoration: BoxDecoration(
                  color: Color(0xFFfac8c2),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), topLeft: Radius.circular(15), topRight: Radius.circular(15))
              ),
            ),
          ),
        ],
      ),
    );
  }
}
