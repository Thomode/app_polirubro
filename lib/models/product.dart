import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  int id;
  String name;
  String description;
  String image;
  double price;
  int quantityStock;

  Product({required this.id, required this.name, required this.description, required this.image, required this.price, required this.quantityStock});

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

}
