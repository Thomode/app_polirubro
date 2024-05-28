import 'dart:convert';
import 'package:app_polirubro/constants/constants.dart';
import 'package:app_polirubro/models/auth.dart';
import 'package:app_polirubro/models/login.dart';
import 'package:http/http.dart' as http;

class AuthService{
  Future<Auth> login(Login login) async {
    final res = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(login.toJson())
    );

    if(res.statusCode == 200){
      final data = await jsonDecode(res.body);
      return Auth.fromJson(data);

    } else {
      throw Exception(res.body);
    }
  }

  Future<Auth> register(Login login) async {
    final res = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(login.toJson())
    );

    if(res.statusCode == 200){
      final data = await jsonDecode(res.body);
      return Auth.fromJson(data);

    } else {
      throw Exception(res.body);
    }
  }
}