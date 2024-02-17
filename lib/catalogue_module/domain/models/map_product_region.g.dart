// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_product_region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MapProductRegion _$$_MapProductRegionFromJson(Map<String, dynamic> json) =>
    _$_MapProductRegion(
      id: json['_id'] as String?,
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      status: json['status'] as String?,
      region: json['region'] == null
          ? null
          : Region.fromJson(json['region'] as Map<String, dynamic>),
      featured: json['featured'] as bool?,
      hasOffer: json['hasOffer'] as bool?,
      variants: (json['variants'] as List<dynamic>?)
          ?.map((e) => MapProductVariant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MapProductRegionToJson(_$_MapProductRegion instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('product', instance.product?.toJson());
  writeNotNull('status', instance.status);
  writeNotNull('region', instance.region?.toJson());
  writeNotNull('featured', instance.featured);
  writeNotNull('hasOffer', instance.hasOffer);
  writeNotNull('variants', instance.variants?.map((e) => e.toJson()).toList());
  return val;
}
