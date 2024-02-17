// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_pick.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PickedLocation _$$_PickedLocationFromJson(Map<String, dynamic> json) =>
    _$_PickedLocation(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_PickedLocationToJson(_$_PickedLocation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('lat', instance.lat);
  writeNotNull('lng', instance.lng);
  return val;
}
