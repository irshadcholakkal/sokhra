// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initiate_payment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InitiatePaymentResponse _$$_InitiatePaymentResponseFromJson(
        Map<String, dynamic> json) =>
    _$_InitiatePaymentResponse(
      pendingOrderId: json['pendingOrderId'] as String?,
      referrenceId: json['referrenceId'] as String?,
      gatewayId: json['gatewayId'] as String?,
      gatewayReceipt: json['gatewayReceipt'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_InitiatePaymentResponseToJson(
    _$_InitiatePaymentResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pendingOrderId', instance.pendingOrderId);
  writeNotNull('referrenceId', instance.referrenceId);
  writeNotNull('gatewayId', instance.gatewayId);
  writeNotNull('gatewayReceipt', instance.gatewayReceipt);
  writeNotNull('amount', instance.amount);
  writeNotNull('status', instance.status);
  return val;
}
