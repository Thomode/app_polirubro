import 'package:app_polirubro/models/image.dart';
import 'package:json_annotation/json_annotation.dart';
import 'category.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  int id;
  String barcode;
  String name;
  String description;
  double buyPrice;
  double salePrice;
  int quantityStock;
  Category? category;
  Image? image;

  Product({
    required this.id,
    required this.barcode,
    required this.name,
    required this.description,
    required this.buyPrice,
    required this.salePrice,
    required this.quantityStock,
    this.category,
    this.image
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
