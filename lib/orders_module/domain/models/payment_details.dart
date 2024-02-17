import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_details.freezed.dart';

part 'payment_details.g.dart';

@freezed
class PaymentDetails with _$PaymentDetails {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory PaymentDetails({
    final String? status,
    final double? invoiceAmount,
  }) = _PaymentDetails;

  factory PaymentDetails.fromJson(Map<String, dynamic> json) =>
      _$PaymentDetailsFromJson(json);
}
