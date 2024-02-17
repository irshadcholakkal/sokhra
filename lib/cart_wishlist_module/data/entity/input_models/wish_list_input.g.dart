// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wish_list_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WishListInput _$$_WishListInputFromJson(Map<String, dynamic> json) =>
    _$_WishListInput(
      product: json['product'] as String?,
      variant: json['variant'] as String?,
      deviceId: json['deviceId'] as String?,
      pinCode: json['pinCode'] as String?,
    );

Map<String, dynamic> _$$_WishListInputToJson(_$_WishListInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('product', instance.product);
  writeNotNull('variant', instance.variant);
  writeNotNull('deviceId', instance.deviceId);
  writeNotNull('pinCode', instance.pinCode);
  return val;
}
