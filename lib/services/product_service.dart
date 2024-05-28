import 'dart:convert';

import 'package:app_polirubro/constants/constants.dart';
import 'package:app_polirubro/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProductService {
  Future<List<Product>> findAll() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token') ?? '';

    final res = await http.get(
      Uri.parse('$baseUrl/products'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if(res.statusCode == 200){
      final List<dynamic> data = jsonDecode(res.body);
      return data.map((json) => Product.fromJson(json)).toList();

    }else{
      throw Exception(res.body);
    }
  }
}