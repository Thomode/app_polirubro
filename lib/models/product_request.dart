import 'package:json_annotation/json_annotation.dart';
part 'product_request.g.dart';

@JsonSerializable()
class ProductRequest {
  String name;
  String? barcode;
  String description;
  double buyPrice;
  double salePrice;
  int quantityStock;
  int categoryId;

  ProductRequest({
    this.barcode,
    required this.name,
    required this.description,
    required this.buyPrice,
    required this.salePrice,
    required this.quantityStock,
    required this.categoryId
  });

  factory ProductRequest.fromJson(Map<String, dynamic> json) => _$ProductRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ProductRequestToJson(this);
}