import 'package:shared_preferences/shared_preferences.dart';

class User {
  String _id = "0";
  String _username = "unknown";
  String _password = "password";
  String _email = "email";

  Future<bool> loadFromStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString("user_id");
    String username = prefs.getString("username");
    String password = prefs.getString("password");
    String email = prefs.getString("email");
    if (id == null || username == null || password == null || email == null)
      return (false);
    this._id = id;
    this._username = username;
    this._email = email;
    this._password = password;
    return (true);
  }

  Future<bool> exists() async {
    return (true);
  }

  Future<bool> register() async {
    if (_id.isEmpty || _id == null || _username.isEmpty || _username == null || _password.isEmpty || _password == null || _email.isEmpty || _email == null) {
      return (false);
    }
  }

  String get email => _email;
  String get password => _password;
  String get username => _username;
  String get id => _id;
}