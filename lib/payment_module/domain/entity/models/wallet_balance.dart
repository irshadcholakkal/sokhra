import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_balance.freezed.dart';

part 'wallet_balance.g.dart';

@freezed
class WalletBalance with _$WalletBalance {
  @JsonSerializable(
    includeIfNull: false,
  )
  const factory WalletBalance({
    @JsonValue(0.0) final double? balance,
    @JsonValue(0.0) final double? credit,
    @JsonValue(0.0) final double? effBalance,
  }) = _WalletBalance;

  factory WalletBalance.fromJson(Map<String, dynamic> json) =>
      _$WalletBalanceFromJson(json);
}
