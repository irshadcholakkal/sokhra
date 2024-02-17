// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_wallet_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerWalletList _$$_CustomerWalletListFromJson(
        Map<String, dynamic> json) =>
    _$_CustomerWalletList(
      getCustomerWallet: (json['getCustomerWallet'] as List<dynamic>?)
          ?.map((e) => CustomerWallet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CustomerWalletListToJson(
    _$_CustomerWalletList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('getCustomerWallet',
      instance.getCustomerWallet?.map((e) => e.toJson()).toList());
  return val;
}
