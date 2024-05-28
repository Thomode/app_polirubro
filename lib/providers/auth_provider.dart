import 'package:app_polirubro/models/auth.dart';
import 'package:app_polirubro/models/login.dart';
import 'package:app_polirubro/services/auth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier{
  final AuthService _authService = AuthService();

  bool _isAuthenticated = false;
  String _token = '';

  bool get isAuthenticated => _isAuthenticated;
  String get token => _token;

  Future<void> login(String username, String password) async {
    final Auth auth = await _authService
        .login(Login(username: username, password: password));

    _isAuthenticated = true;
    _token = auth.token;

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool('isAuthenticated', _isAuthenticated);
    await sharedPreferences.setString('token', _token);

    notifyListeners();
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