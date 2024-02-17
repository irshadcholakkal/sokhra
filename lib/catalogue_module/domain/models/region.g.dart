// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Region _$$_RegionFromJson(Map<String, dynamic> json) => _$_Region(
      regionId: json['_id'] as String?,
      name: json['name'] as String?,
      isActive: json['isActive'] as bool?,
      hasSameDayDelivery: json['hasSameDayDelivery'] as bool?,
      hasSameDayShipping: json['hasSameDayShipping'] as bool?,
      cutOfTime: json['cutOfTime'] as String?,
      zones: (json['zones'] as List<dynamic>?)
          ?.map((e) => Zone.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RegionToJson(_$_Region instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.regionId);
  writeNotNull('name', instance.name);
  writeNotNull('isActive', instance.isActive);
  writeNotNull('hasSameDayDelivery', instance.hasSameDayDelivery);
  writeNotNull('hasSameDayShipping', instance.hasSameDayShipping);
  writeNotNull('cutOfTime', instance.cutOfTime);
  writeNotNull('zones', instance.zones?.map((e) => e.toJson()).toList());
  return val;
}
