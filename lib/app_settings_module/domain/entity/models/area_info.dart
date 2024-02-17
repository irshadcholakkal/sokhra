import 'package:freezed_annotation/freezed_annotation.dart';

import 'zone_info.dart';

part 'area_info.freezed.dart';
part 'area_info.g.dart';

@freezed
class AreaInfo with _$AreaInfo {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory AreaInfo({
    @JsonKey(name: '_id') final String? id,
    final String? nameEn,
    final String? nameAr,
    @JsonKey(defaultValue: []) final List<ZoneInfo>? zones,
  }) = _AreaInfo;

  factory AreaInfo.fromJson(Map<String, dynamic> json) =>
      _$AreaInfoFromJson(json);
}
