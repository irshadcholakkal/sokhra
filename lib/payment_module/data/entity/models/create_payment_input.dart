import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_payment_input.freezed.dart';
part 'create_payment_input.g.dart';

@freezed
class CreatePaymentInput with _$CreatePaymentInput {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory CreatePaymentInput({
    required final String razorpayPaymentId,
    required final String razorpayOrderId,
    required final String razorpaySignature,
    required final String pendingOrderId,
    @Default('') final String? deviceId,
  }) = _CreatePaymentInput;

  factory CreatePaymentInput.fromJson(Map<String, dynamic> json) =>
      _$CreatePaymentInputFromJson(json);
}
