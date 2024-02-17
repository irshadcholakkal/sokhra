// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SettingsList _$$_SettingsListFromJson(Map<String, dynamic> json) =>
    _$_SettingsList(
      settings: (json['Settings'] as List<dynamic>?)
          ?.map((e) => Settings.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['totalCount'] as int?,
    );

Map<String, dynamic> _$$_SettingsListToJson(_$_SettingsList instance) =>
    <String, dynamic>{
      'Settings': instance.settings,
      'totalCount': instance.totalCount,
    };
