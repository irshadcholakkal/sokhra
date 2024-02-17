// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cart _$$_CartFromJson(Map<String, dynamic> json) => _$_Cart(
      cartId: json['_id'] as String?,
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      variant: json['variant'] == null
          ? null
          : Variant.fromJson(json['variant'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num?)?.toDouble(),
      variantChoice: json['variantChoice'] as String?,
      deliveryCharge: (json['deliveryCharge'] as num?)?.toDouble(),
      minimumPurchaseAmount:
          (json['minimumPurchaseAmount'] as num?)?.toDouble(),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      deviceId: json['deviceId'] as String?,
      isDeliveryAvailable: json['isDeliveryAvailable'] as bool?,
    );

Map<String, dynamic> _$$_CartToJson(_$_Cart instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.cartId);
  writeNotNull('product', instance.product?.toJson());
  writeNotNull('variant', instance.variant?.toJson());
  writeNotNull('quantity', instance.quantity);
  writeNotNull('variantChoice', instance.variantChoice);
  writeNotNull('deliveryCharge', instance.deliveryCharge);
  writeNotNull('minimumPurchaseAmount', instance.minimumPurchaseAmount);
  writeNotNull('user', instance.user?.toJson());
  writeNotNull('deviceId', instance.deviceId);
  writeNotNull('isDeliveryAvailable', instance.isDeliveryAvailable);
  return val;
}
