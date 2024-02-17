import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../catalogue_module/domain/models/seller.dart';
import '../../../../user_module/domain/entity/models/user.dart';
import 'payment_details_server.dart';

part 'payment.freezed.dart';
part 'payment.g.dart';

@freezed
class Payment with _$Payment {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory Payment(
      {final User? user,
      final Seller? seller,
      final double? amount,
      final String? status,
      final PaymentDetailsServer? paymentDetails}) = _Payment;

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
}
