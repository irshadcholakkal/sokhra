import 'package:freezed_annotation/freezed_annotation.dart';

part 'zone_info.freezed.dart';
part 'zone_info.g.dart';

@freezed
class ZoneInfo with _$ZoneInfo {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory ZoneInfo({
    @JsonKey(name: '_id') final String? id,
    final String? nameEn,
    final String? nameAr,
  }) = _ZoneInfo;

  factory ZoneInfo.fromJson(Map<String, dynamic> json) =>
      _$ZoneInfoFromJson(json);
}
