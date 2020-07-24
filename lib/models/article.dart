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
  DateTime _created_at = DateTime.now();
  DateTime _updated_at = DateTime.now();
  String _imageUrl = "null";

  Article(
      this._id,
      this._name,
      this._description,
      this._price,
      this._quota,
      this._type,
      this._primary,
      this._created_at,
      this._updated_at,
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
  DateTime get updatedAt => _updated_at;
  DateTime get createdAt => _created_at;
}
