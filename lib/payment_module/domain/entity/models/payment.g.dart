// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Payment _$$_PaymentFromJson(Map<String, dynamic> json) => _$_Payment(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      seller: json['seller'] == null
          ? null
          : Seller.fromJson(json['seller'] as Map<String, dynamic>),
      amount: (json['amount'] as num?)?.toDouble(),
      status: json['status'] as String?,
      paymentDetails: json['paymentDetails'] == null
          ? null
          : PaymentDetailsServer.fromJson(
              json['paymentDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PaymentToJson(_$_Payment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user', instance.user?.toJson());
  writeNotNull('seller', instance.seller?.toJson());
  writeNotNull('amount', instance.amount);
  writeNotNull('status', instance.status);
  writeNotNull('paymentDetails', instance.paymentDetails?.toJson());
  return val;
}
