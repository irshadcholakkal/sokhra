// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderList _$$_OrderListFromJson(Map<String, dynamic> json) => _$_OrderList(
      totalCount: json['totalCount'] as int?,
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_OrderListToJson(_$_OrderList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('totalCount', instance.totalCount);
  writeNotNull('orders', instance.orders?.map((e) => e.toJson()).toList());
  return val;
}
