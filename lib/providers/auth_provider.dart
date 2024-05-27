import 'dart:convert';

import 'package:app_polirubro/constants/constants.dart';
import 'package:app_polirubro/models/auth.dart';
import 'package:app_polirubro/models/login.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier{
  bool _isAuthenticated = false;
  String _token = '';

  bool get isAuthenticated => _isAuthenticated;
  String get token => _token;

  Future<void> login(String username, String password) async {
    final res = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(Login(username: username, password: password).toJson())
    );

    if(res.statusCode == 200){
      final data = await json.decode(res.body);
      final auth = Auth.fromJson(data);

      _isAuthenticated = true;
      _token = auth.token;

      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setBool('isAuthenticated', _isAuthenticated);
      await sharedPreferences.setString('token', _token);

      notifyListeners();
    } else {
      throw Exception(res.body);
    }
  }
  Future<void> logout() async {
    _isAuthenticated = false;
    _token = '';

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool('isAuthenticated', _isAuthenticated);
    await sharedPreferences.remove('token');

    notifyListeners();
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _isAuthenticated = sharedPreferences.getBool('isAuthenticated') ?? false;
    _token = sharedPreferences.getString('token') ?? '';

    notifyListeners();
  }
}