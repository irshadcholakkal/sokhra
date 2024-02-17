import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_pricing.freezed.dart';

part 'order_pricing.g.dart';

@freezed
class OrderPricing with _$OrderPricing {
  @JsonSerializable(includeIfNull: false)
  const factory OrderPricing({
    final double? tax,
    final double? deliveryCharge,
    final double? billedValue,
  }) = _OrderPricing;

  factory OrderPricing.fromJson(Map<String, dynamic> json) =>
      _$OrderPricingFromJson(json);
}

// import 'package:freezed_annotation/freezed_annotation.dart';
//
// part 'order_pricing.freezed.dart';
// part 'order_pricing.g.dart';
//
// @freezed
// class OrderPricing with _$OrderPricing {
//   @JsonSerializable(explicitToJson: true, includeIfNull: false)
//   const factory OrderPricing(
//       {final double? price,
//       final double? discount,
//       final double? netAmount,
//       final double? basePrice,
//       final double? walletAmount,
//       final double? tax,
//       final double? deliveryCharge,
//       final double? paidAmount,
//       final double? billedValue}) = _OrderPricing;
//
//   factory OrderPricing.fromJson(Map<String, dynamic> json) =>
//       _$OrderPricingFromJson(json);
// }
