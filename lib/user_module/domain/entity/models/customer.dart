import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app_settings_module/domain/entity/models/shipping_address.dart';
import 'user.dart';

part 'customer.freezed.dart';
part 'customer.g.dart';

@freezed
class Customer with _$Customer {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory Customer({
    @JsonKey(name: "_id") final String? id,
    final User? user,
    final String? customerId,
    final String? discountCode,
    final bool? creditEnabled,
    final double? creditLimit,
    final List<ShippingAddress>? addressDetails,
  }) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
}
