// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      deliveryCharge: (json['deliveryCharge'] as num?)?.toDouble(),
      deviceId: json['deviceId'] as String?,
      id: json['_id'] as String?,
      isDeliveryAvailable: json['isDeliveryAvailable'] as bool?,
      minimumPurchaseAmount:
          (json['minimumPurchaseAmount'] as num?)?.toDouble(),
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      quantity: json['quantity'] as int?,
      variant: json['variant'] == null
          ? null
          : Variant.fromJson(json['variant'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String?,
      variantChoice: json['variantChoice'] as String?,
      variantChoiceName: json['variantChoiceName'] as String?,
      tax: (json['tax'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toDouble(),
      reductionPrice: (json['reductionPrice'] as num?)?.toDouble(),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      '_id': instance.id,
      'variant': instance.variant,
      'isDeliveryAvailable': instance.isDeliveryAvailable,
      'deliveryCharge': instance.deliveryCharge,
      'minimumPurchaseAmount': instance.minimumPurchaseAmount,
      'product': instance.product,
      'quantity': instance.quantity,
      'deviceId': instance.deviceId,
      'createdAt': instance.createdAt,
      'variantChoice': instance.variantChoice,
      'variantChoiceName': instance.variantChoiceName,
      'tax': instance.tax,
      'price': instance.price,
      'reductionPrice': instance.reductionPrice,
      'user': instance.user,
    };

RootCartModel _$RootCartModelFromJson(Map<String, dynamic> json) =>
    RootCartModel(
      deliveryCharge: (json['deliveryCharge'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toDouble(),
      discountedPrice: (json['discountedPrice'] as num?)?.toDouble(),
      discount: json['discount'] as int?,
      promoCode: json['promoCode'] as String?,
      tax: (json['tax'] as num?)?.toDouble(),
      basePrice: (json['basePrice'] as num?)?.toDouble(),
      netPrice: (json['netPrice'] as num?)?.toDouble(),
      cart: (json['cart'] as List<dynamic>?)
          ?.map((e) => Cart.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RootCartModelToJson(RootCartModel instance) =>
    <String, dynamic>{
      'deliveryCharge': instance.deliveryCharge,
      'price': instance.price,
      'discountedPrice': instance.discountedPrice,
      'discount': instance.discount,
      'promoCode': instance.promoCode,
      'tax': instance.tax,
      'basePrice': instance.basePrice,
      'netPrice': instance.netPrice,
      'cart': instance.cart,
    };
