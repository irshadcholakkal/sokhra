import 'package:freezed_annotation/freezed_annotation.dart';

part 'sort_input.freezed.dart';
part 'sort_input.g.dart';

@freezed
class SortInput with _$SortInput {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory SortInput({
    final SortType? price,
    final SortType? createdAt,
  }) = _SortInput;

  factory SortInput.fromJson(Map<String, dynamic> json) =>
      _$SortInputFromJson(json);
}

// class SortType {
//   static const ascending = "Asc";
//   static const descending = "Desc";
// }
enum SortType { Desc, Asc }

// ignore: constant_identifier_names
enum SortItem { PRICE_LOW, PRICE_HIGH }
