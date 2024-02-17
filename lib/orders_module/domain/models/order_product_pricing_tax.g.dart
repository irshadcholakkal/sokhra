// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_product_pricing_tax.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderProductPricingTax _$$_OrderProductPricingTaxFromJson(
        Map<String, dynamic> json) =>
    _$_OrderProductPricingTax(
      hsnCode: json['hsnCode'] as String?,
      taxes: (json['taxes'] as List<dynamic>?)
          ?.map((e) => TaxDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_OrderProductPricingTaxToJson(
    _$_OrderProductPricingTax instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('hsnCode', instance.hsnCode);
  writeNotNull('taxes', instance.taxes?.map((e) => e.toJson()).toList());
  return val;
}
