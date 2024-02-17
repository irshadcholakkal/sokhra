// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_details_server.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentDetailsServer _$$_PaymentDetailsServerFromJson(
        Map<String, dynamic> json) =>
    _$_PaymentDetailsServer(
      chargeId: json['chargeId'] as String?,
    );

Map<String, dynamic> _$$_PaymentDetailsServerToJson(
    _$_PaymentDetailsServer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('chargeId', instance.chargeId);
  return val;
}
