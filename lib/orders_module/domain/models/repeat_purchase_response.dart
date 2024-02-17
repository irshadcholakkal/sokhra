import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../cart_wishlist_module/domain/models/cart.dart';
import '../../../catalogue_module/domain/models/region.dart';
import '../../../catalogue_module/domain/models/zone.dart';

part 'repeat_purchase_response.freezed.dart';
part 'repeat_purchase_response.g.dart';

@freezed
class RepeatPurchaseResponse with _$RepeatPurchaseResponse {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory RepeatPurchaseResponse(
      {final List<Cart>? carts,
      final double? deliveryCharge,
      final double? price,
      final double? discount,
      final double? discountedPrice,
      final String? promoCode,
      final double? tax,
      final double? basePrice,
      final double? netPrice,
      final Region? region,
      final Zone? zone}) = _RepeatPurchaseResponse;

  factory RepeatPurchaseResponse.fromJson(Map<String, dynamic> json) =>
      _$RepeatPurchaseResponseFromJson(json);
}
