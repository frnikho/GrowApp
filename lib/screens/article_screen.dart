import 'package:flutter/material.dart';
import 'package:growapp/models/article.dart';

class ArticleScreen extends StatelessWidget {

  static String id = "ArticleScreen";

  final Article article;

  ArticleScreen(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
