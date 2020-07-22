import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:growapp/models/login_status.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

const String localAddress = "www.192.168.0.26.com";

class User extends ChangeNotifier {
  String _id = "0";
  String _password = "password";
  String _email = "email";
  String _phone = "No number";
  String _firstname = "Unknow";
  String _lastname = "";
  DateTime _date = DateTime.now();

  Future<bool> loadFromStorage(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _id = prefs.getString("user_id");
    print(_id);
  }

  void registerIntoStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user_id", _id);
  }

  Future<bool> refresh() async {

  }

  Future<LoginStatus> login() async {
    var params = {
      "email": email,
      "password": password,
    };
    final uri = Uri.http("192.168.0.26:3030", '/users', params);
    var jsonResponse = await http.get(uri)
        .then((value) => value)
        .catchError((error) {
          print("Error while connecting !");
    });
    if (jsonResponse == null)
      return LoginStatus.api_connection_error;
    print("response: ${jsonResponse.statusCode}");
    var json = jsonDecode(jsonResponse.body);

    var error = json['error'];
    var status = json['status'];
    if (error != null || status == 400)
      return (LoginStatus.api_request_error);

    _id = json['id'];
    _date = DateTime.parse(json['date']).toLocal();
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _phone = json['phone'];
    return (LoginStatus.success);
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
  String get lastName => _lastname;
  String get firstName => _firstname;
}