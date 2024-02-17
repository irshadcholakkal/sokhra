import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'order_product_info.dart';
import 'order_product_pricing.dart';

part 'order_product.freezed.dart';

part 'order_product.g.dart';

@freezed
class OrderProduct with _$OrderProduct {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory OrderProduct({
    final OrderProductPricing? pricing,
    final OrderProductInfo? productInfo,
    final int? quantity,
  }) = _OrderProduct;

  factory OrderProduct.fromJson(Map<String, dynamic> json) =>
      _$OrderProductFromJson(json);
}
