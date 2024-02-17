// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubCategory _$$_SubCategoryFromJson(Map<String, dynamic> json) =>
    _$_SubCategory(
      id: json['_id'] as String?,
      code: json['code'] as String?,
      nameEn: json['nameEn'] as String?,
      nameAr: json['nameAr'] as String?,
      avatar: json['avatar'] as String?,
      order: json['order'] as int?,
      category: json['category'] == null
          ? null
          : Categorys.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SubCategoryToJson(_$_SubCategory instance) {
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
  writeNotNull('avatar', instance.avatar);
  writeNotNull('order', instance.order);
  writeNotNull('category', instance.category?.toJson());
  return val;
}
