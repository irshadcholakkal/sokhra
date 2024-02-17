// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      id: json['_id'] as String,
      nameEn: json['nameEn'] as String,
      nameAr: json['nameAr'] as String,
      descriptionEn: json['descriptionEn'] as String,
      descriptionAr: json['descriptionAr'] as String,
      images: (json['avatar'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      price: (json['price'] as num?)?.toDouble() ?? 0,
      isQuantityInMeters: json['isQuantityInMeters'] as bool? ?? true,
      minimumQuantity: (json['minimumQuantity'] as num?)?.toDouble() ?? 1,
      quantity: (json['quantity'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'nameEn': instance.nameEn,
      'nameAr': instance.nameAr,
      'descriptionEn': instance.descriptionEn,
      'descriptionAr': instance.descriptionAr,
      'avatar': instance.images,
      'price': instance.price,
      'isQuantityInMeters': instance.isQuantityInMeters,
      'minimumQuantity': instance.minimumQuantity,
      'quantity': instance.quantity,
    };
