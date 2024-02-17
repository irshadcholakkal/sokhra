import 'package:freezed_annotation/freezed_annotation.dart';
import 'category.dart';

part 'category_list.freezed.dart';

part 'category_list.g.dart';

@freezed
class CategoryList with _$CategoryList {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory CategoryList({
    final List<Categorys>? categories,
  }) = _CategoryList;

  factory CategoryList.fromJson(Map<String, dynamic> json) =>
      _$CategoryListFromJson(json);
}
