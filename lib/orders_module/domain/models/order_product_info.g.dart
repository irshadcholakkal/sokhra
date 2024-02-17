// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_product_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderProductInfo _$$_OrderProductInfoFromJson(Map<String, dynamic> json) =>
    _$_OrderProductInfo(
      thumbnailImage: json['thumbnailImage'] as String?,
      name: json['name'] as String?,
      variant: json['variant'] as String?,
    );

Map<String, dynamic> _$$_OrderProductInfoToJson(_$_OrderProductInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('thumbnailImage', instance.thumbnailImage);
  writeNotNull('name', instance.name);
  writeNotNull('variant', instance.variant);
  return val;
}
