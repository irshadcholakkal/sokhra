// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Color _$$_ColorFromJson(Map<String, dynamic> json) => _$_Color(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$$_ColorToJson(_$_Color instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('code', instance.code);
  return val;
}
