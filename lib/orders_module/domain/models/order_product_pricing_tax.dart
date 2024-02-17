import 'package:freezed_annotation/freezed_annotation.dart';

import 'tax_details.dart';

part 'order_product_pricing_tax.freezed.dart';
part 'order_product_pricing_tax.g.dart';

@freezed
class OrderProductPricingTax with _$OrderProductPricingTax {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory OrderProductPricingTax({
    final String? hsnCode,
    @JsonValue([]) final List<TaxDetails>? taxes,
  }) = _OrderProductPricingTax;

  factory OrderProductPricingTax.fromJson(Map<String, dynamic> json) =>
      _$OrderProductPricingTaxFromJson(json);
}
