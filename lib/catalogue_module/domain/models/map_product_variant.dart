import 'package:freezed_annotation/freezed_annotation.dart';

import 'product_variant.dart';

part 'map_product_variant.freezed.dart';
part 'map_product_variant.g.dart';

@freezed
class MapProductVariant with _$MapProductVariant {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory MapProductVariant({
    @JsonKey(name: "_id") final String? id,
    final ProductVariant? variant,
    final bool? isDefault,
    final double? price,
    final int? quantity,
    final double? reductionPrice,
  }) = _MapProductVariant;

  factory MapProductVariant.fromJson(Map<String, dynamic> json) =>
      _$MapProductVariantFromJson(json);
}
