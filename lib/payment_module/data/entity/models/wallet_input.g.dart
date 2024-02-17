// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WalletInput _$$_WalletInputFromJson(Map<String, dynamic> json) =>
    _$_WalletInput(
      credit: (json['credit'] as num?)?.toDouble(),
      debit: (json['debit'] as num?)?.toDouble(),
      note: json['note'] as String? ?? "",
      paymentId: json['paymentId'] as String?,
      orderId: json['orderId'] as String?,
      type: json['type'] as String? ?? "",
      status: json['status'] as String? ?? "",
      referrenceId: json['referrenceId'] as String?,
    );

Map<String, dynamic> _$$_WalletInputToJson(_$_WalletInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('credit', instance.credit);
  writeNotNull('debit', instance.debit);
  writeNotNull('note', instance.note);
  writeNotNull('paymentId', instance.paymentId);
  writeNotNull('orderId', instance.orderId);
  writeNotNull('type', instance.type);
  writeNotNull('status', instance.status);
  writeNotNull('referrenceId', instance.referrenceId);
  return val;
}
