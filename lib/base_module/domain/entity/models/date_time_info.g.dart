// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_time_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DateTimeInfo _$$_DateTimeInfoFromJson(Map<String, dynamic> json) =>
    _$_DateTimeInfo(
      utcDateTime: json['utcDateTime'] as String?,
    );

Map<String, dynamic> _$$_DateTimeInfoToJson(_$_DateTimeInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('utcDateTime', instance.utcDateTime);
  return val;
}
