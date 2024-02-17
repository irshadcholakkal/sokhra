import 'package:freezed_annotation/freezed_annotation.dart';

import 'product.dart';

part 'product_variant.freezed.dart';
part 'product_variant.g.dart';

@freezed
class ProductVariant with _$ProductVariant {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory ProductVariant(
      {@JsonKey(name: "_id") final String? id,
      final Product? product,
      final String? name,
      final int? minimumQuantity,
      final int? maximumQuantity}) = _ProductVariant;

  factory ProductVariant.fromJson(Map<String, dynamic> json) =>
      _$ProductVariantFromJson(json);
}
