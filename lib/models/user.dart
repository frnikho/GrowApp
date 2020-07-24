import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

const String ip = "192.168.1.16";

enum LoginStatus {success, api_connection_error, api_request_error, bad_email_format, bad_password_format}

class User extends ChangeNotifier {
  String _id = "0";
  String _password = "password";
  String _email = "email";
  String _phone = "No number";
  String _firstName = "Unknow";
  String _lastName = "";
  DateTime _date = DateTime.now();

  Future<bool> loadFromStorage(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString("user_email");
    String passwd = prefs.getString("user_password");
    if (email == null || passwd == null)
      return false;
    _email = email;
    _password = passwd;
    await refresh(email, passwd);
    return true;
  }

  Future<void> registerIntoStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user_email", _email);
    prefs.setString("user_password", _password);
  }

  Future<bool> refresh(String userEmail, String userPassword) async {
    var params = {
      "email": userEmail,
      "password": userPassword,
    };
    final uri = Uri.http('$ip:3030', '/users', params);
    var jsonResponse = await http.get(uri)
        .then((value) => value)
        .catchError((error) {
      print("Error while connecting !");
    });
    if (jsonResponse.statusCode != 200 || jsonResponse.body == null)
      return false;
    var json = jsonDecode(jsonResponse.body);
    _id = json['id'];
    _date = DateTime.parse(json['date']).toLocal();
    _firstName = json['firstname'];
    _lastName = json['lastname'];
    _phone = json['phone'];
    return true;
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<LoginStatus> login() async {
    var params = {
      "email": email,
      "password": password,
    };
    final uri = Uri.http("$ip:3030", '/users', params);
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
    _firstName = json['firstname'];
    _lastName = json['lastname'];
    _phone = json['phone'];
    await registerIntoStorage();
    return (LoginStatus.success);
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
  String get lastName => _lastName;
  String get firstName => _firstName;
}