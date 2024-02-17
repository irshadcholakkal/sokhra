import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../catalogue_module/domain/models/product.dart';
import '../../../catalogue_module/domain/models/variant.dart';
import '../../../user_module/domain/entity/models/user.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class Cart with _$Cart {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory Cart({
    @JsonKey(name: '_id') final String? cartId,
    final Product? product,
    final Variant? variant,
    final double? quantity,
  @JsonKey(name: 'variantChoice') final String? variantChoice,

    @JsonValue(0.0) final double? deliveryCharge,
    final double? minimumPurchaseAmount,
    final User? user,
    final String? deviceId,
    @JsonValue(false) final bool? isDeliveryAvailable,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}
