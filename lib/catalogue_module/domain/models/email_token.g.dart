// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EmailToken _$$_EmailTokenFromJson(Map<String, dynamic> json) =>
    _$_EmailToken(
      value: json['value'] as String?,
    );

Map<String, dynamic> _$$_EmailTokenToJson(_$_EmailToken instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('value', instance.value);
  return val;
}
