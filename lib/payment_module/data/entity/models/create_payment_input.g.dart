// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_payment_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreatePaymentInput _$$_CreatePaymentInputFromJson(
        Map<String, dynamic> json) =>
    _$_CreatePaymentInput(
      razorpayPaymentId: json['razorpayPaymentId'] as String,
      razorpayOrderId: json['razorpayOrderId'] as String,
      razorpaySignature: json['razorpaySignature'] as String,
      pendingOrderId: json['pendingOrderId'] as String,
      deviceId: json['deviceId'] as String? ?? '',
    );

Map<String, dynamic> _$$_CreatePaymentInputToJson(
    _$_CreatePaymentInput instance) {
  final val = <String, dynamic>{
    'razorpayPaymentId': instance.razorpayPaymentId,
    'razorpayOrderId': instance.razorpayOrderId,
    'razorpaySignature': instance.razorpaySignature,
    'pendingOrderId': instance.pendingOrderId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('deviceId', instance.deviceId);
  return val;
}
