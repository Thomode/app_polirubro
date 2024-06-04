import 'package:app_polirubro/models/product.dart';
import 'package:app_polirubro/models/product_request.dart';
import 'package:app_polirubro/services/product_service.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier{
  final ProductService _productService = ProductService();
  List<Product> _products = [];
  bool _isLoading = false;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  Future<void> findAll() async{
    _isLoading = true;
    _products = await _productService.findAll();
    _isLoading = false;

    notifyListeners();
  }

  Future<void> save(ProductRequest productRequest) async {
    await _productService.save(productRequest);

    notifyListeners();
  }
}