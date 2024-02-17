// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AreaInfo _$$_AreaInfoFromJson(Map<String, dynamic> json) => _$_AreaInfo(
      id: json['_id'] as String?,
      nameEn: json['nameEn'] as String?,
      nameAr: json['nameAr'] as String?,
      zones: (json['zones'] as List<dynamic>?)
              ?.map((e) => ZoneInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_AreaInfoToJson(_$_AreaInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('nameEn', instance.nameEn);
  writeNotNull('nameAr', instance.nameAr);
  writeNotNull('zones', instance.zones?.map((e) => e.toJson()).toList());
  return val;
}
