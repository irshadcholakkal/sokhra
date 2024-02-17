import 'package:freezed_annotation/freezed_annotation.dart';

part 'initiate_payment_response.freezed.dart';

part 'initiate_payment_response.g.dart';

@freezed
class InitiatePaymentResponse with _$InitiatePaymentResponse {
  @JsonSerializable(includeIfNull: false)
  const factory InitiatePaymentResponse({
    final String? pendingOrderId,
    final String? referrenceId,
    final String? gatewayId,
    final String? gatewayReceipt,
    final double? amount,
    final String? status,
  }) = _InitiatePaymentResponse;

  factory InitiatePaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$InitiatePaymentResponseFromJson(json);
}
