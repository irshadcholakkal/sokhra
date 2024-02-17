import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shipping_details.freezed.dart';

part 'shipping_details.g.dart';

@freezed
class ShippingDetails with _$ShippingDetails {
  @JsonSerializable(includeIfNull: false)
  const factory ShippingDetails({
    final String? firstname,
    final String? lastname,
    final String? phone,
    final String? house,
    final String? type,
    final String? district,
    final String? state,
    final String? email,
    final String? pincode,
    final String? street,
    final String? landmark,
    final String? note,
    final String? lat,
    final String? lon,
  }) = _ShippingDetails;

  factory ShippingDetails.fromJson(Map<String, dynamic> json) =>
      _$ShippingDetailsFromJson(json);
}
