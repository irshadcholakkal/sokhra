import 'package:freezed_annotation/freezed_annotation.dart';

import 'sub_category.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Categorys with _$Categorys {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory Categorys({
    @JsonKey(name: "_id") final String? id,
    final String? code,
    final String? nameEn,
    final String? nameAr,
    final int? order,
    final String? avatar,
    final bool? active,
    @JsonKey(defaultValue: []) final List<SubCategory>? subCategories,
  }) = _Categorys;

  factory Categorys.fromJson(Map<String, dynamic> json) =>
      _$CategorysFromJson(json);
}
