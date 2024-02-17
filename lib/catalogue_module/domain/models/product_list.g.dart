// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductList _$$_ProductListFromJson(Map<String, dynamic> json) =>
    _$_ProductList(
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      totalCount: json['totalCount'] as int,
    );

Map<String, dynamic> _$$_ProductListToJson(_$_ProductList instance) =>
    <String, dynamic>{
      'products': instance.products.map((e) => e.toJson()).toList(),
      'totalCount': instance.totalCount,
    };
