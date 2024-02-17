import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'customer_wallet.dart';

part 'customer_wallet_list.freezed.dart';
part 'customer_wallet_list.g.dart';

@freezed
class CustomerWalletList with _$CustomerWalletList {
  @JsonSerializable(explicitToJson: true,includeIfNull: false)
  const factory CustomerWalletList({
  required final List<CustomerWallet>? getCustomerWallet,
  }) = _CustomerWalletList;



  factory CustomerWalletList.fromJson(Map<String, dynamic> json) =>
      _$CustomerWalletListFromJson(json);
}














// import 'package:freezed_annotation/freezed_annotation.dart';
//
// import 'customer_wallet.dart';
//
// part 'customer_wallet_list.freezed.dart';
// part 'customer_wallet_list.g.dart';
//
// @freezed
// class CustomerWalletList with _$CustomerWalletList {
//   @JsonSerializable(explicitToJson: true, includeIfNull: false)
//   const factory CustomerWalletList({
//     required final List<CustomerWallet>? getCustomerWallet,
//   }) = _CustomerWalletList;
//
//   factory CustomerWalletList.fromJson(Map<String, dynamic> json) =>
//       _$CustomerWalletListFromJson(json);
// }
