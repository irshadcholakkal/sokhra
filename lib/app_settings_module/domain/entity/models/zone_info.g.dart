// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zone_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ZoneInfo _$$_ZoneInfoFromJson(Map<String, dynamic> json) => _$_ZoneInfo(
      id: json['_id'] as String?,
      nameEn: json['nameEn'] as String?,
      nameAr: json['nameAr'] as String?,
    );

Map<String, dynamic> _$$_ZoneInfoToJson(_$_ZoneInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('nameEn', instance.nameEn);
  writeNotNull('nameAr', instance.nameAr);
  return val;
}
