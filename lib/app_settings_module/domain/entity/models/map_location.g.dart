// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MapLocation _$$_MapLocationFromJson(Map<String, dynamic> json) =>
    _$_MapLocation(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_MapLocationToJson(_$_MapLocation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('latitude', instance.latitude);
  writeNotNull('longitude', instance.longitude);
  return val;
}
