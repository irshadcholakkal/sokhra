// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_zones.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetAllZones _$$_GetAllZonesFromJson(Map<String, dynamic> json) =>
    _$_GetAllZones(
      zones: (json['zones'] as List<dynamic>?)
          ?.map((e) => Zones.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['totalCount'] as int?,
    );

Map<String, dynamic> _$$_GetAllZonesToJson(_$_GetAllZones instance) =>
    <String, dynamic>{
      'zones': instance.zones,
      'totalCount': instance.totalCount,
    };
