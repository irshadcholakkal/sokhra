// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Settings _$$_SettingsFromJson(Map<String, dynamic> json) => _$_Settings(
      id: json['_id'] as String?,
      whatsappSettings: json['whatsappSettings'] == null
          ? null
          : WhatsappConfig.fromJson(
              json['whatsappSettings'] as Map<String, dynamic>),
      appVersion: json['appVersion'] == null
          ? null
          : AppVersion.fromJson(json['appVersion'] as Map<String, dynamic>),
      defaultPincode: json['defaultPincode'] as String?,
    );

Map<String, dynamic> _$$_SettingsToJson(_$_Settings instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'whatsappSettings': instance.whatsappSettings,
      'appVersion': instance.appVersion,
      'defaultPincode': instance.defaultPincode,
    };
