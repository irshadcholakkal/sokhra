import 'package:freezed_annotation/freezed_annotation.dart';

part 'color.freezed.dart';
part 'color.g.dart';

@freezed
class Color with _$Color {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory Color(
      {@JsonKey(name: "_id") final String? id,
      final String? name,
      final String? code}) = _Color;

  factory Color.fromJson(Map<String, dynamic> json) => _$ColorFromJson(json);
}
