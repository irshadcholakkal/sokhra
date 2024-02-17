// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_variant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductVariant _$$_ProductVariantFromJson(Map<String, dynamic> json) =>
    _$_ProductVariant(
      id: json['_id'] as String?,
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      name: json['name'] as String?,
      minimumQuantity: json['minimumQuantity'] as int?,
      maximumQuantity: json['maximumQuantity'] as int?,
    );

Map<String, dynamic> _$$_ProductVariantToJson(_$_ProductVariant instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('product', instance.product?.toJson());
  writeNotNull('name', instance.name);
  writeNotNull('minimumQuantity', instance.minimumQuantity);
  writeNotNull('maximumQuantity', instance.maximumQuantity);
  return val;
}
