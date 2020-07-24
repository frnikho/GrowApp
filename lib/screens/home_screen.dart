import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growapp/models/app_data.dart';
import 'package:growapp/models/article.dart';
import 'package:growapp/widgets/store_bottom_navigation_bar.dart';
import 'package:growapp/widgets/suggestion_slider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  static String id = "HomeScreen";

  _buildSuggestionArticles(AppData data) async {
    List<Article> articles = await data.loadSuggestionArticles();
    return (articles);
  }

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
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                    child: Row(
                      children: <Widget>[
                        Text("Best Sellers", style: GoogleFonts.almarai(fontSize: 24)),
                        SizedBox(width: 10),
                        Text("Daily Suggestion", style: GoogleFonts.almarai(fontSize: 16, color: Colors.grey)),
                      ],
                    ),
                  ),
                  Container(
                    height: 300,
                    child: FutureBuilder(
                      future: _buildSuggestionArticles(data),
                      builder: (context, snap) {
                        if (snap.hasData)
                          return SuggestionList(articles: snap.data);
                        return Center(child: CircularProgressIndicator());
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