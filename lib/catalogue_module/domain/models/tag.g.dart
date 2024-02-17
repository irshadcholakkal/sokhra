// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tag _$$_TagFromJson(Map<String, dynamic> json) => _$_Tag(
      id: json['_id'] as String?,
      nameEn: json['nameEn'] as String?,
      nameAr: json['nameAr'] as String?,
    );

Map<String, dynamic> _$$_TagToJson(_$_Tag instance) {
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
