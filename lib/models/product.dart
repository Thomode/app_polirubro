import 'package:json_annotation/json_annotation.dart';
import 'category.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  int id;
  String barcode;
  String name;
  String description;
  String image;
  double buyPrice;
  double salePrice;
  int quantityStock;
  Category? category;

  Product({
    required this.id,
    required this.barcode,
    required this.name,
    required this.description,
    required this.image,
    required this.buyPrice,
    required this.salePrice,
    required this.quantityStock,
    this.category
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

}
