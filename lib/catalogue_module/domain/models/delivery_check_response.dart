import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_check_response.freezed.dart';

part 'delivery_check_response.g.dart';

@freezed
class DeliveryCheckResponse with _$DeliveryCheckResponse {
  @JsonSerializable(explicitToJson: true)
  const factory DeliveryCheckResponse({
    final String? zoneName,
    final String? deliveryDate,
    final String? deliveryDay,
    final bool? hasSameDayDelivery,
    final bool? hasSameDayShipping,
    final double? minimumPurchaseAmount,
  }) = _DeliveryCheckResponse;

  factory DeliveryCheckResponse.fromJson(Map<String, dynamic> json) =>
      _$DeliveryCheckResponseFromJson(json);
}
