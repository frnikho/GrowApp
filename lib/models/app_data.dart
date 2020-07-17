import 'package:flutter/cupertino.dart';
import 'package:growapp/models/article.dart';
import 'package:growapp/models/user.dart';

class AppData extends ChangeNotifier {

  User _user;
  List<Article> availableArticles;

  AppData() {
    _user = User();
  }

  User get user => _user;

  void loadArticles() async {

  }

}