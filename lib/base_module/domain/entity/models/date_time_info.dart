import 'package:freezed_annotation/freezed_annotation.dart';

part 'date_time_info.freezed.dart';
part 'date_time_info.g.dart';

@freezed
class DateTimeInfo with _$DateTimeInfo {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory DateTimeInfo({
    final String? utcDateTime,
  }) = _DateTimeInfo;

  factory DateTimeInfo.fromJson(Map<String, dynamic> json) =>
      _$DateTimeInfoFromJson(json);
}
