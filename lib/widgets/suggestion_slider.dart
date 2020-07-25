import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growapp/models/article.dart';
import 'package:growapp/models/article_type.dart';
import 'package:growapp/screens/article_screen.dart';

class SuggestionList extends StatelessWidget {

  final List<Article> articles;

  SuggestionList({@required this.articles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return SuggestionCard(article: articles[index]);
      },
    );
  }
}

class SuggestionCard extends StatelessWidget {

  final Article article;

  SuggestionCard({@required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ArticleScreen(article);
          },
          )
        );
      },
      child: Container(
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
                    color: article.primary,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), topLeft: Radius.circular(15), topRight: Radius.circular(15))
                ),
                child: Hero(
                  tag: article,
                  child: Image.network(article.imageUrl)
                ),
              ),
            ),
            Positioned(
              top: 5,
              left: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(color: article.primary.withOpacity(1.0),
                      blurRadius: 4,
                      spreadRadius: 6,
                      offset: Offset(0, 2),
                    )
                  ]
                ),
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  child: Container(
                    child: Text("\$${article.price.toStringAsFixed(2)}", style: GoogleFonts.roboto(color: Colors.black)),
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 40,
                left: 20,
                child: Container(
                    child: Text("${article.name}", style: GoogleFonts.sourceSansPro(fontSize: 20),)
                )
            ),
            Positioned(
                bottom: 20,
                left: 20,
                child: Container(
                    child: Text("${getTypeName(article.type)}", style: GoogleFonts.sourceSansPro(fontSize: 16, color: Colors.black.withOpacity(0.6)),)
                )
            ),
          ],
        ),
      ),
    );
  }
}