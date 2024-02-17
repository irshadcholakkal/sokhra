// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Variant _$$_VariantFromJson(Map<String, dynamic> json) => _$_Variant(
      variantId: json['_id'] as String?,
      name: json['name'] as String?,
      minimumQuantity: json['minimumQuantity'] as int?,
      maximumQuantity: json['maximumQuantity'] as int?,
      isDefault: json['isDefault'] as bool?,
      price: (json['price'] as num?)?.toDouble(),
      quantity: json['quantity'] as int?,
      reductionPrice: (json['reductionPrice'] as num?)?.toDouble(),
      choiceType: json['choiceType'] as String?,
      subChoices: (json['subChoices'] as List<dynamic>?)
          ?.map((e) => SubChoice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_VariantToJson(_$_Variant instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.variantId);
  writeNotNull('name', instance.name);
  writeNotNull('minimumQuantity', instance.minimumQuantity);
  writeNotNull('maximumQuantity', instance.maximumQuantity);
  writeNotNull('isDefault', instance.isDefault);
  writeNotNull('price', instance.price);
  writeNotNull('quantity', instance.quantity);
  writeNotNull('reductionPrice', instance.reductionPrice);
  writeNotNull('choiceType', instance.choiceType);
  writeNotNull(
      'subChoices', instance.subChoices?.map((e) => e.toJson()).toList());
  return val;
}
