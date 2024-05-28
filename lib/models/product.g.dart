// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: (json['id'] as num).toInt(),
      barcode: json['barcode'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      buyPrice: (json['buyPrice'] as num).toDouble(),
      salePrice: (json['salePrice'] as num).toDouble(),
      quantityStock: (json['quantityStock'] as num).toInt(),
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'barcode': instance.barcode,
      'name': instance.name,
      'description': instance.description,
      'buyPrice': instance.buyPrice,
      'salePrice': instance.salePrice,
      'quantityStock': instance.quantityStock,
      'category': instance.category,
    };
