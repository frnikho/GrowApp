import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:growapp/models/article_type.dart';

class Article {
  String _id = "0";
  String _name = "unknow";
  double _price = 0.00;
  int _quota = -1;
  ArticleType _type = ArticleType.unknown;
  Color _primary = Colors.white;
  Color _secondary = Colors.white;
  DateTime _dateTime = DateTime.now();
  int _waterNeeded = 0;
  String _imageUrl = "/";

  Article(
      this._id,
      this._name,
      this._price,
      this._quota,
      this._type,
      this._primary,
      this._secondary,
      this._dateTime,
      this._waterNeeded,
      this._imageUrl
  );

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      json['id'],
      json['name'],
      json['price'],
      json['quota'],
      getTypeFromName(json['type']),
      json['primary_color'],
      json['secondary_color'],
      DateTime.parse(json['date']),
      json['water_needed'],
      json['image_url']
    );
  }

  String get imageUrl => _imageUrl;
  int get waterNeeded => _waterNeeded;
  DateTime get dateTime => _dateTime;
  Color get secondary => _secondary;
  Color get primary => _primary;
  ArticleType get type => _type;
  int get quota => _quota;
  double get price => _price;
  String get name => _name;
  String get id => _id;
}
