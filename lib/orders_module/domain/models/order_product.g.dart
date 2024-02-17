// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderProduct _$$_OrderProductFromJson(Map<String, dynamic> json) =>
    _$_OrderProduct(
      pricing: json['pricing'] == null
          ? null
          : OrderProductPricing.fromJson(
              json['pricing'] as Map<String, dynamic>),
      productInfo: json['productInfo'] == null
          ? null
          : OrderProductInfo.fromJson(
              json['productInfo'] as Map<String, dynamic>),
      quantity: json['quantity'] as int?,
    );

Map<String, dynamic> _$$_OrderProductToJson(_$_OrderProduct instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pricing', instance.pricing?.toJson());
  writeNotNull('productInfo', instance.productInfo?.toJson());
  writeNotNull('quantity', instance.quantity);
  return val;
}
