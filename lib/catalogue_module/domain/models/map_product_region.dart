import 'package:freezed_annotation/freezed_annotation.dart';

import 'map_product_variant.dart';
import 'product.dart';
import 'region.dart';

part 'map_product_region.freezed.dart';
part 'map_product_region.g.dart';

@freezed
class MapProductRegion with _$MapProductRegion {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory MapProductRegion(
      {@JsonKey(name: "_id") final String? id,
      final Product? product,
      final String? status,
      final Region? region,
      final bool? featured,
      final bool? hasOffer,
      final List<MapProductVariant>? variants}) = _MapProductRegion;

  factory MapProductRegion.fromJson(Map<String, dynamic> json) =>
      _$MapProductRegionFromJson(json);
}
