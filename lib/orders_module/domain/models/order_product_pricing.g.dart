// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_product_pricing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderProductPricing _$$_OrderProductPricingFromJson(
        Map<String, dynamic> json) =>
    _$_OrderProductPricing(
      netAmount: (json['netAmount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_OrderProductPricingToJson(
    _$_OrderProductPricing instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('netAmount', instance.netAmount);
  return val;
}
