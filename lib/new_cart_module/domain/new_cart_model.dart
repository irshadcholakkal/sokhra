import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../catalogue_module/domain/models/products_by_subcategory_model.dart';
import '../../user_module/domain/entity/models/user.dart';

part 'new_cart_model.g.dart';

@JsonSerializable()
class Cart extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final Variant? variant;
  final bool? isDeliveryAvailable;
  final double? deliveryCharge;
  final double? minimumPurchaseAmount;
  final Product? product;
  final int? quantity;
  final String? deviceId;
  final String? createdAt;
  final String? variantChoice;
  final String? variantChoiceName;
  final double? tax;
  final double? price;
  final double? reductionPrice;
  final User? user;

  Cart({
    this.deliveryCharge,
    this.deviceId,
    this.id,
    this.isDeliveryAvailable,
    this.minimumPurchaseAmount,
    this.product,
    this.quantity,
    this.variant,
    this.createdAt,
    this.variantChoice,
    this.variantChoiceName,
    this.tax,
    this.price,
    this.reductionPrice,
    this.user,
  });

  @override
  List<Object?> get props => [
        deliveryCharge,
        deviceId,
        id,
        isDeliveryAvailable,
        minimumPurchaseAmount,
        product,
        quantity,
        variant,
        createdAt,
        variantChoice,
        variantChoiceName,
        tax,
        price,
        reductionPrice,
        user
      ];

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}

@JsonSerializable()
class RootCartModel extends Equatable {
  final double? deliveryCharge;
  final double? price;
  final double? discountedPrice;
  final int? discount;
  final String? promoCode;
  final double? tax;
  final double? basePrice;
  final double? netPrice;
  final List<Cart>? cart;

  RootCartModel({
    this.deliveryCharge,
    this.price,
    this.discountedPrice,
    this.discount,
    this.promoCode,
    this.tax,
    this.basePrice,
    this.netPrice,
    this.cart,
  });

  @override
  List<Object?> get props => [
        cart,
        deliveryCharge,
        price,
        discountedPrice,
        discount,
        promoCode,
        tax,
        basePrice,
        netPrice,
      ];

  factory RootCartModel.fromJson(Map<String, dynamic> json) =>
      _$RootCartModelFromJson(json);

  Map<String, dynamic> toJson() => _$RootCartModelToJson(this);
}
