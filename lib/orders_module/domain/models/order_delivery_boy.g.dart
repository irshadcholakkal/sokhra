// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_delivery_boy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderDeliveryBoy _$$_OrderDeliveryBoyFromJson(Map<String, dynamic> json) =>
    _$_OrderDeliveryBoy(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$$_OrderDeliveryBoyToJson(_$_OrderDeliveryBoy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('phone', instance.phone);
  return val;
}
