import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growapp/models/article.dart';
import 'package:growapp/models/article_type.dart';

import 'package:growapp/utils.dart';

class ArticleScreen extends StatelessWidget {

  static String id = "ArticleScreen";

  final Article article;

  ArticleScreen(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: article.primary,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Hero(
                        tag: article,
                        child: Image.network(article.imageUrl),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: CircleAvatar(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.transparent,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(CupertinoIcons.back)
                        ),
                      )
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.menu, color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.purple.withOpacity(0.05),
                            borderRadius: BorderRadius.all(Radius.circular(22))
                        ),
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text("${getTypeName(article.type).capitalize()}", style: GoogleFonts.almarai(color: Colors.deepPurple.withOpacity(0.6), fontSize: 17)),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Text("${article.name}", style: GoogleFonts.almarai(fontSize: 28, fontWeight: FontWeight.bold))
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: Text("${article.description}")
                          ),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    right: 0,
                    top: 45,
                    child: Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                        color: Colors.orangeAccent.withOpacity(0.9)
                      ),
                      child: Center(child: Text("\$${article.price.toStringAsFixed(2)}", style: GoogleFonts.almarai(fontSize: 20),)),
                    ),
                  )
                ],
              )
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.05),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.black.withOpacity(0.05),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25))
                          ),
                        ),
                      ),
                    )
                  ],
                )
              )
            ),
          ],
        ),
      ),
    );
  }
}
