import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:growapp/models/article.dart';
import 'package:growapp/models/user.dart';

import 'package:http/http.dart' as http;

const String ip = "192.168.0.26";

class AppData extends ChangeNotifier {

  User _user;
  List<Article> articles = [];
  List<Article> suggestionArticles = [];

  AppData() {
    _user = User();
  }

  Future<List<Article>> loadSuggestionArticles() async {
    http.Response response = await http.get('http://$ip:3030/articles/suggestion');
    List<dynamic> json = jsonDecode(response.body);
    List<Article> article = [];
    json.forEach((element) {
      article.add(Article.fromJson(element));
    });
    suggestionArticles = article;
    return (article);
  }

  Future<List<Article>> loadArticles() async {
    http.Response response = await http.get('http://$ip:3030/articles');
    List<dynamic> json = jsonDecode(response.body);
    List<Article> article = [];
    json.forEach((element) {
      article.add(Article.fromJson(element));
    });
    articles = article;
    return (article);
  }

  User get user => _user;

}