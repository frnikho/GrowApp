import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

const String localAddress = "www.192.168.0.26.com";

class User extends ChangeNotifier {
  String _id = "0";
  String _password = "password";
  String _email = "email";
  String _phone = "No number";
  DateTime _date = DateTime.now();

  Future<bool> loadFromStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString("user_id");
    String username = prefs.getString("username");
    String password = prefs.getString("password");
    String email = prefs.getString("email");
    if (id == null || username == null || password == null || email == null)
      return (false);
    this._id = id;
    this._email = email;
    this._password = password;
    return (true);
  }

  Future<bool> login() async {

    var params = {
      "email": email,
      "password": password,
    };

    final uri = Uri.http("192.168.0.26:3030", '/users', params);
    var jsonResponse = await http.get(uri).then((value) => value.body);
    var json = jsonDecode(jsonResponse);

    var error = json['error'];
    var status = json['status'];
    if (error != null || status == 400)
      return (false);

    _id = json['id'];
    _date = DateTime.parse(json['date']).toLocal();
    return (true);
  }

  Future<bool> exists() async {
    return (true);
  }

  Future<bool> register() async {
    if (_id.isEmpty || _id == null || _password.isEmpty || _password == null || _email.isEmpty || _email == null) {
      return (false);
    }
  }

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  String get email => _email;
  String get password => _password;
  String get id => _id;
  DateTime get date => _date;
  String get phone => _phone;
}