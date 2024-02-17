// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WalletBalance _$$_WalletBalanceFromJson(Map<String, dynamic> json) =>
    _$_WalletBalance(
      balance: (json['balance'] as num?)?.toDouble(),
      credit: (json['credit'] as num?)?.toDouble(),
      effBalance: (json['effBalance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_WalletBalanceToJson(_$_WalletBalance instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('balance', instance.balance);
  writeNotNull('credit', instance.credit);
  writeNotNull('effBalance', instance.effBalance);
  return val;
}
