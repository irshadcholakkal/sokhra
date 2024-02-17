// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Categorys _$$_CategorysFromJson(Map<String, dynamic> json) => _$_Categorys(
      id: json['_id'] as String?,
      code: json['code'] as String?,
      nameEn: json['nameEn'] as String?,
      nameAr: json['nameAr'] as String?,
      order: json['order'] as int?,
      avatar: json['avatar'] as String?,
      active: json['active'] as bool?,
      subCategories: (json['subCategories'] as List<dynamic>?)
              ?.map((e) => SubCategory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_CategorysToJson(_$_Categorys instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('code', instance.code);
  writeNotNull('nameEn', instance.nameEn);
  writeNotNull('nameAr', instance.nameAr);
  writeNotNull('order', instance.order);
  writeNotNull('avatar', instance.avatar);
  writeNotNull('active', instance.active);
  writeNotNull(
      'subCategories', instance.subCategories?.map((e) => e.toJson()).toList());
  return val;
}
