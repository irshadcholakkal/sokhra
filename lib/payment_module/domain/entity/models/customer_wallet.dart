import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../user_module/domain/entity/models/user.dart';

part 'customer_wallet.freezed.dart';
part 'customer_wallet.g.dart';

@freezed
class CustomerWallet with _$CustomerWallet {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory CustomerWallet({
    @JsonKey(name: "_id") final String? id,
    final User? user,
    final double? credit,
    final double? debit,
    final String? note,
    final String? paymentId,
    final String? orderId,
    final String? referrence,
    final String? type,
    final String? status,
    final String? createdAt,
  }) = _CustomerWallet;

  factory CustomerWallet.fromJson(Map<String, dynamic> json) =>
      _$CustomerWalletFromJson(json);
}
