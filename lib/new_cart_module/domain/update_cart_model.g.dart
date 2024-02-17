// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCart _$UpdateCartFromJson(Map<String, dynamic> json) => UpdateCart(
      id: json['_id'] as String?,
      deviceId: json['deviceId'] as String?,
      quantity: json['quantity'] as int?,
    );

Map<String, dynamic> _$UpdateCartToJson(UpdateCart instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'quantity': instance.quantity,
      'deviceId': instance.deviceId,
    };
