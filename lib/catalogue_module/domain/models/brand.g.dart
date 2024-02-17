// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Brand _$$_BrandFromJson(Map<String, dynamic> json) => _$_Brand(
      brandId: json['_id'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      isActive: json['isActive'] as bool?,
      isTrending: json['isTrending'] as bool?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Categorys.fromJson(e as Map<String, dynamic>))
          .toList(),
      image: json['image'] as String?,
      logo: json['logo'] as String?,
      order: json['order'] as int?,
    );

Map<String, dynamic> _$$_BrandToJson(_$_Brand instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.brandId);
  writeNotNull('code', instance.code);
  writeNotNull('name', instance.name);
  writeNotNull('isActive', instance.isActive);
  writeNotNull('isTrending', instance.isTrending);
  writeNotNull(
      'categories', instance.categories?.map((e) => e.toJson()).toList());
  writeNotNull('image', instance.image);
  writeNotNull('logo', instance.logo);
  writeNotNull('order', instance.order);
  return val;
}
