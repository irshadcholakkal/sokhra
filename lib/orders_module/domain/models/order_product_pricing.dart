import 'package:freezed_annotation/freezed_annotation.dart';


part 'order_product_pricing.freezed.dart';

part 'order_product_pricing.g.dart';

@freezed
class OrderProductPricing with _$OrderProductPricing {
  @JsonSerializable(includeIfNull: false)
  const factory OrderProductPricing({
    final double? netAmount,
  }) = _OrderProductPricing;

  factory OrderProductPricing.fromJson(Map<String, dynamic> json) =>
      _$OrderProductPricingFromJson(json);
}
