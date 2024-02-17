import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'payment_type.dart';

part 'initiate_payment_input.freezed.dart';

part 'initiate_payment_input.g.dart';

@freezed
class InitiatePaymentInput with _$InitiatePaymentInput {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory InitiatePaymentInput({
    required final String? addressId,
    final String? deviceId,
    final String? note,
    required final PaymentType paymentType,
    required final double invoiceAmount,
    required final double promoDiscount,
    required final double subTotal,
    final String? deliveryDate,
    final String? deliveryShift,
    @JsonKey(ignore: true) final File? customerAudio,
    // final String? customerAudio,
    @Default(false) final bool applyWallet,
    final String? promoCode,
  }) = _InitiatePaymentInput;

  factory InitiatePaymentInput.fromJson(Map<String, dynamic> json) =>
      _$InitiatePaymentInputFromJson(json);
}
