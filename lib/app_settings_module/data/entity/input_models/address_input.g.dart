// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddressInput _$$_AddressInputFromJson(Map<String, dynamic> json) =>
    _$_AddressInput(
      building: json['building'] as String?,
      street: json['street'] as String?,
      landMark: json['landMark'] as String?,
      mapLocation: json['mapLocation'] == null
          ? null
          : MapLocation.fromJson(json['mapLocation'] as Map<String, dynamic>),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$_AddressInputToJson(_$_AddressInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('building', instance.building);
  writeNotNull('street', instance.street);
  writeNotNull('landMark', instance.landMark);
  writeNotNull('mapLocation', instance.mapLocation?.toJson());
  writeNotNull('type', instance.type);
  return val;
}
