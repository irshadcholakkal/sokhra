import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_details_server.freezed.dart';
part 'payment_details_server.g.dart';

@freezed
class PaymentDetailsServer with _$PaymentDetailsServer {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory PaymentDetailsServer({
    final String? chargeId,
  }) = _PaymentDetailsServer;

  factory PaymentDetailsServer.fromJson(Map<String, dynamic> json) =>
      _$PaymentDetailsServerFromJson(json);
}
