import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag.freezed.dart';
part 'tag.g.dart';

@freezed
class Tag with _$Tag {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory Tag(
      {@JsonKey(name: "_id") final String? id,
      final String? nameEn,
      final String? nameAr}) = _Tag;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}
