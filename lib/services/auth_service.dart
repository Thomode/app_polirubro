import 'dart:convert';
import 'package:app_polirubro/constants/constants.dart';
import 'package:app_polirubro/models/auth.dart';
import 'package:app_polirubro/models/login.dart';
import 'package:http/http.dart' as http;

class AuthService{
  Future<Auth> login(Login login) async {
    try{
      final res = await http.post(
        Uri.http(baseUrl, "/auth/login"),
        body: login.toJson(),
        headers: {"Content-Type": "application/json"},
      );

      if (res.statusCode == 200) {
        final json = jsonDecode(res.body);
        return Auth.fromJson(json);

      } else {
        throw Exception('Failed to login');
      }
    }catch(e){
      throw Exception('Failed to login');
    }
  }
}