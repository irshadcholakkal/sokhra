// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$$_OrderFromJson(Map<String, dynamic> json) => _$_Order(
      id: json['_id'] as String?,
      orderNumber: json['orderNumber'] as int?,
      status: $enumDecodeNullable(_$OrderStatusEnumMap, json['status']),
      reason: json['reason'] as String?,
      pricing: json['pricing'] == null
          ? null
          : OrderPricing.fromJson(json['pricing'] as Map<String, dynamic>),
      deliveryDate: json['deliveryDate'] as String?,
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => OrderProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      shippingDetails: json['shippingDetails'] == null
          ? null
          : ShippingDetails.fromJson(
              json['shippingDetails'] as Map<String, dynamic>),
      payment: json['payment'] == null
          ? null
          : PaymentDetails.fromJson(json['payment'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$_OrderToJson(_$_Order instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('orderNumber', instance.orderNumber);
  writeNotNull('status', _$OrderStatusEnumMap[instance.status]);
  writeNotNull('reason', instance.reason);
  writeNotNull('pricing', instance.pricing?.toJson());
  writeNotNull('deliveryDate', instance.deliveryDate);
  writeNotNull('orders', instance.orders?.map((e) => e.toJson()).toList());
  writeNotNull('shippingDetails', instance.shippingDetails?.toJson());
  writeNotNull('payment', instance.payment?.toJson());
  writeNotNull('createdAt', instance.createdAt);
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
