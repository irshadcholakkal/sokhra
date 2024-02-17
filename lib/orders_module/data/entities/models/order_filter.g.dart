// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderFilter _$$_OrderFilterFromJson(Map<String, dynamic> json) =>
    _$_OrderFilter(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      paymentId: json['paymentId'] as String?,
      status: $enumDecodeNullable(_$OrderStatusEnumMap, json['status']),
      deviceId: json['deviceId'] as String?,
      regionFilter: json['regionFilter'] as String?,
      zoneFilter: json['zoneFilter'] as String?,
      searchKey: json['searchKey'] as String?,
      deliveryDate: json['deliveryDate'] as String?,
      orderDate: json['orderDate'] as String?,
      fromDate: json['fromDate'] as String?,
      toDate: json['toDate'] as String?,
    );

Map<String, dynamic> _$$_OrderFilterToJson(_$_OrderFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('phone', instance.phone);
  writeNotNull('paymentId', instance.paymentId);
  writeNotNull('status', _$OrderStatusEnumMap[instance.status]);
  writeNotNull('deviceId', instance.deviceId);
  writeNotNull('regionFilter', instance.regionFilter);
  writeNotNull('zoneFilter', instance.zoneFilter);
  writeNotNull('searchKey', instance.searchKey);
  writeNotNull('deliveryDate', instance.deliveryDate);
  writeNotNull('orderDate', instance.orderDate);
  writeNotNull('fromDate', instance.fromDate);
  writeNotNull('toDate', instance.toDate);
  return val;
}

const _$OrderStatusEnumMap = {
  OrderStatus.PENDING: 'PENDING',
  OrderStatus.DISPATCHED: 'DISPATCHED',
  OrderStatus.DELIVERED: 'DELIVERED',
  OrderStatus.DECLINED: 'DECLINED',
  OrderStatus.CANCELLED: 'CANCELLED',
  OrderStatus.DISPATCH_HELD: 'DISPATCH_HELD',
};
