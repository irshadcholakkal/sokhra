// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zones.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Zones _$$_ZonesFromJson(Map<String, dynamic> json) => _$_Zones(
      id: json['_id'] as String?,
      zoneName: json['zoneName'] as String?,
      zoneNameAr: json['zoneNameAr'] as String?,
      zoneNameFr: json['zoneNameFr'] as String?,
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

Map<String, dynamic> _$$_ZonesToJson(_$_Zones instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('zoneName', instance.zoneName);
  writeNotNull('zoneNameAr', instance.zoneNameAr);
  writeNotNull('zoneNameFr', instance.zoneNameFr);
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
