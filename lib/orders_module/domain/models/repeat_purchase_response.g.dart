// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repeat_purchase_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RepeatPurchaseResponse _$$_RepeatPurchaseResponseFromJson(
        Map<String, dynamic> json) =>
    _$_RepeatPurchaseResponse(
      carts: (json['carts'] as List<dynamic>?)
          ?.map((e) => Cart.fromJson(e as Map<String, dynamic>))
          .toList(),
      deliveryCharge: (json['deliveryCharge'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      discountedPrice: (json['discountedPrice'] as num?)?.toDouble(),
      promoCode: json['promoCode'] as String?,
      tax: (json['tax'] as num?)?.toDouble(),
      basePrice: (json['basePrice'] as num?)?.toDouble(),
      netPrice: (json['netPrice'] as num?)?.toDouble(),
      region: json['region'] == null
          ? null
          : Region.fromJson(json['region'] as Map<String, dynamic>),
      zone: json['zone'] == null
          ? null
          : Zone.fromJson(json['zone'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RepeatPurchaseResponseToJson(
    _$_RepeatPurchaseResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('carts', instance.carts?.map((e) => e.toJson()).toList());
  writeNotNull('deliveryCharge', instance.deliveryCharge);
  writeNotNull('price', instance.price);
  writeNotNull('discount', instance.discount);
  writeNotNull('discountedPrice', instance.discountedPrice);
  writeNotNull('promoCode', instance.promoCode);
  writeNotNull('tax', instance.tax);
  writeNotNull('basePrice', instance.basePrice);
  writeNotNull('netPrice', instance.netPrice);
  writeNotNull('region', instance.region?.toJson());
  writeNotNull('zone', instance.zone?.toJson());
  return val;
}
