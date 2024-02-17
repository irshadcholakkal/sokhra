// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_shift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeliveryShift _$$_DeliveryShiftFromJson(Map<String, dynamic> json) =>
    _$_DeliveryShift(
      id: json['_id'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      isAvailableforBooking: json['isAvailableforBooking'] as bool?,
    );

Map<String, dynamic> _$$_DeliveryShiftToJson(_$_DeliveryShift instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('startTime', instance.startTime);
  writeNotNull('endTime', instance.endTime);
  writeNotNull('isAvailableforBooking', instance.isAvailableforBooking);
  return val;
}
