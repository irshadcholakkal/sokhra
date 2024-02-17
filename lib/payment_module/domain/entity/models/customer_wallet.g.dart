// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerWallet _$$_CustomerWalletFromJson(Map<String, dynamic> json) =>
    _$_CustomerWallet(
      id: json['_id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      credit: (json['credit'] as num?)?.toDouble(),
      debit: (json['debit'] as num?)?.toDouble(),
      note: json['note'] as String?,
      paymentId: json['paymentId'] as String?,
      orderId: json['orderId'] as String?,
      referrence: json['referrence'] as String?,
      type: json['type'] as String?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$_CustomerWalletToJson(_$_CustomerWallet instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('user', instance.user?.toJson());
  writeNotNull('credit', instance.credit);
  writeNotNull('debit', instance.debit);
  writeNotNull('note', instance.note);
  writeNotNull('paymentId', instance.paymentId);
  writeNotNull('orderId', instance.orderId);
  writeNotNull('referrence', instance.referrence);
  writeNotNull('type', instance.type);
  writeNotNull('status', instance.status);
  writeNotNull('createdAt', instance.createdAt);
  return val;
}
