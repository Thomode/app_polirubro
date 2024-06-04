// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductRequest _$ProductRequestFromJson(Map<String, dynamic> json) =>
    ProductRequest(
      barcode: json['barcode'] as String?,
      name: json['name'] as String,
      description: json['description'] as String,
      buyPrice: (json['buyPrice'] as num).toDouble(),
      salePrice: (json['salePrice'] as num).toDouble(),
      quantityStock: (json['quantityStock'] as num).toInt(),
      categoryId: (json['categoryId'] as num).toInt(),
    );

Map<String, dynamic> _$ProductRequestToJson(ProductRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'barcode': instance.barcode,
      'description': instance.description,
      'buyPrice': instance.buyPrice,
      'salePrice': instance.salePrice,
      'quantityStock': instance.quantityStock,
      'categoryId': instance.categoryId,
    };
