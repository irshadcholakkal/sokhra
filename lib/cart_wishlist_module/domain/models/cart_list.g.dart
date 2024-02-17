// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartList _$$_CartListFromJson(Map<String, dynamic> json) => _$_CartList(
      cartList: (json['cart'] as List<dynamic>?)
              ?.map((e) => Cart.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_CartListToJson(_$_CartList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cart', instance.cartList?.map((e) => e.toJson()).toList());
  return val;
}
