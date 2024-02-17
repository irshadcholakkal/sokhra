import 'package:freezed_annotation/freezed_annotation.dart';

import 'category.dart';

part 'brand.freezed.dart';
part 'brand.g.dart';

@freezed
class Brand with _$Brand {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory Brand({
    @JsonKey(name: "_id") final String? brandId,
    final String? code,
    final String? name,
    final bool? isActive,
    final bool? isTrending,
    final List<Categorys>? categories,
    final String? image,
    final String? logo,
    final int? order,
  }) = _Brand;

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
}
