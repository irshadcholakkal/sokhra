import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_input.freezed.dart';
part 'wallet_input.g.dart';

@Freezed()
class WalletInput with _$WalletInput {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory WalletInput({
    final double? credit,
    final double? debit,
    @Default("") final String? note,
    required final String? paymentId,
    required final String? orderId,
    @Default("") final String? type,
    @Default("") final String? status,
    required final String? referrenceId,
  }) = _WalletInput;

  factory WalletInput.fromJson(Map<String, dynamic> json) =>
      _$WalletInputFromJson(json);
}
