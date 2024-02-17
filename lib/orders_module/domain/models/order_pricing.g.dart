// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_pricing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderPricing _$$_OrderPricingFromJson(Map<String, dynamic> json) =>
    _$_OrderPricing(
      tax: (json['tax'] as num?)?.toDouble(),
      deliveryCharge: (json['deliveryCharge'] as num?)?.toDouble(),
      billedValue: (json['billedValue'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_OrderPricingToJson(_$_OrderPricing instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tax', instance.tax);
  writeNotNull('deliveryCharge', instance.deliveryCharge);
  writeNotNull('billedValue', instance.billedValue);
  return val;
}
