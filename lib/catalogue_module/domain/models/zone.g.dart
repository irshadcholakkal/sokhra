// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Zone _$$_ZoneFromJson(Map<String, dynamic> json) => _$_Zone(
      zoneId: json['_id'] as String?,
      zoneName: json['zoneName'] as String?,
      pincodes: (json['pincodes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isActive: json['isActive'] as bool?,
      deliveryDays: (json['deliveryDays'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$DaysEnumMap, e))
          .toList(),
      deliveryCharge: (json['deliveryCharge'] as num?)?.toDouble(),
      minimumPurchaseAmount:
          (json['minimumPurchaseAmount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_ZoneToJson(_$_Zone instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.zoneId);
  writeNotNull('zoneName', instance.zoneName);
  writeNotNull('pincodes', instance.pincodes);
  writeNotNull('isActive', instance.isActive);
  writeNotNull('deliveryDays',
      instance.deliveryDays?.map((e) => _$DaysEnumMap[e]!).toList());
  writeNotNull('deliveryCharge', instance.deliveryCharge);
  writeNotNull('minimumPurchaseAmount', instance.minimumPurchaseAmount);
  return val;
}

const _$DaysEnumMap = {
  Days.Sunday: 'Sunday',
  Days.Monday: 'Monday',
  Days.Tuesday: 'Tuesday',
  Days.Wednesday: 'Wednesday',
  Days.Thursday: 'Thursday',
  Days.Friday: 'Friday',
  Days.Saturday: 'Saturday',
};
