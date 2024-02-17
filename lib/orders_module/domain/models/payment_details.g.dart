// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentDetails _$$_PaymentDetailsFromJson(Map<String, dynamic> json) =>
    _$_PaymentDetails(
      status: json['status'] as String?,
      invoiceAmount: (json['invoiceAmount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_PaymentDetailsToJson(_$_PaymentDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
  writeNotNull('invoiceAmount', instance.invoiceAmount);
  return val;
}
