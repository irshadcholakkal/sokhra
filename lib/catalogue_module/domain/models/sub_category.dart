import 'package:freezed_annotation/freezed_annotation.dart';

import 'category.dart';

part 'sub_category.freezed.dart';
part 'sub_category.g.dart';

@freezed
class SubCategory with _$SubCategory {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory SubCategory({
    @JsonKey(name: "_id") final String? id,
    final String? code,
    final String? nameEn,
    final String? nameAr,
    final String? avatar,
    final int? order,
    final Categorys? category,
  }) = _SubCategory;

  factory SubCategory.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryFromJson(json);
}
