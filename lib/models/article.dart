import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:growapp/models/article_type.dart';

class Article {
  String _id = "00000-00000";
  String _name = "unknow";
  String _description;
  double _price = 0.00;
  int _quota = -1;
  ArticleType _type = ArticleType.unknown;
  Color _primary = Colors.white;
  DateTime _createdAt = DateTime.now();
  DateTime _updatedAt = DateTime.now();
  String _imageUrl = "null";

  Article(
      this._id,
      this._name,
      this._description,
      this._price,
      this._quota,
      this._type,
      this._primary,
      this._createdAt,
      this._updatedAt,
      this._imageUrl
  );

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      json['id'],
      json['name'],
      json['description'],
      json['price'],
      json['quota'],
      getTypeFromName(json['type']),
      Colors.blueAccent,
      DateTime.parse(json['created_at']),
      DateTime.parse(json['updated_at']),
      "http://192.168.1.16:3030" + json['image_url']
    );
  }

  String get imageUrl => _imageUrl;
  Color get primary => _primary;
  ArticleType get type => _type;
  int get quota => _quota;
  double get price => _price;
  String get name => _name;
  String get id => _id;
  DateTime get updatedAt => _updatedAt;
  DateTime get createdAt => _createdAt;
  String get description => _description;
}
