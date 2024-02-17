// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promocode_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PromoCodeInfo _$$_PromoCodeInfoFromJson(Map<String, dynamic> json) =>
    _$_PromoCodeInfo(
      discountedPrice: (json['discountedPrice'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      deliveryCharge: (json['deliveryCharge'] as num?)?.toDouble(),
      netPrice: (json['netPrice'] as num?)?.toDouble(),
      promoCode: json['promoCode'] as String?,
    );

Map<String, dynamic> _$$_PromoCodeInfoToJson(_$_PromoCodeInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('discountedPrice', instance.discountedPrice);
  writeNotNull('price', instance.price);
  writeNotNull('discount', instance.discount);
  writeNotNull('deliveryCharge', instance.deliveryCharge);
  writeNotNull('netPrice', instance.netPrice);
  writeNotNull('promoCode', instance.promoCode);
  return val;
}
