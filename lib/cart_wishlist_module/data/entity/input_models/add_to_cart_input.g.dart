// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_cart_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddToCartInput _$$_AddToCartInputFromJson(Map<String, dynamic> json) =>
    _$_AddToCartInput(
      productId: json['_id'] as String?,
      quantity: json['quantity'] as int,
      choiceId: json['choiceId'] as String?,
      deviceId: json['deviceId'] as String?,
      variantChoice: json['variantChoice'] as String?,
    );

Map<String, dynamic> _$$_AddToCartInputToJson(_$_AddToCartInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.productId);
  val['quantity'] = instance.quantity;
  writeNotNull('choiceId', instance.choiceId);
  writeNotNull('deviceId', instance.deviceId);
  writeNotNull('variantChoice', instance.variantChoice);
  return val;
}
