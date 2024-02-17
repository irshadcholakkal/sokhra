// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wish_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WishList _$$_WishListFromJson(Map<String, dynamic> json) => _$_WishList(
      id: json['_id'] as String?,
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      variant: json['variant'] == null
          ? null
          : Variant.fromJson(json['variant'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      deviceId: json['deviceId'] as String?,
    );

Map<String, dynamic> _$$_WishListToJson(_$_WishList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('product', instance.product?.toJson());
  writeNotNull('variant', instance.variant?.toJson());
  writeNotNull('user', instance.user?.toJson());
  writeNotNull('deviceId', instance.deviceId);
  return val;
}
