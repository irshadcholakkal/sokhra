// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_product_variant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MapProductVariant _$$_MapProductVariantFromJson(Map<String, dynamic> json) =>
    _$_MapProductVariant(
      id: json['_id'] as String?,
      variant: json['variant'] == null
          ? null
          : ProductVariant.fromJson(json['variant'] as Map<String, dynamic>),
      isDefault: json['isDefault'] as bool?,
      price: (json['price'] as num?)?.toDouble(),
      quantity: json['quantity'] as int?,
      reductionPrice: (json['reductionPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_MapProductVariantToJson(
    _$_MapProductVariant instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('variant', instance.variant?.toJson());
  writeNotNull('isDefault', instance.isDefault);
  writeNotNull('price', instance.price);
  writeNotNull('quantity', instance.quantity);
  writeNotNull('reductionPrice', instance.reductionPrice);
  return val;
}
