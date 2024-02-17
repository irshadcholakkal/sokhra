// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategory _$SubCategoryFromJson(Map<String, dynamic> json) => SubCategory(
      id: json['_id'] as String?,
      nameEn: json['nameEn'] as String?,
      nameAr: json['nameAr'] as String?,
      nameFr: json['nameFr'] as String?,
      avatar: json['avatar'] as String?,
      thumbnail: json['thumbnail'] as String?,
      order: json['order'] as int?,
    );

Map<String, dynamic> _$SubCategoryToJson(SubCategory instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'nameEn': instance.nameEn,
      'nameAr': instance.nameAr,
      'nameFr': instance.nameFr,
      'avatar': instance.avatar,
      'thumbnail': instance.thumbnail,
      'order': instance.order,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      active: json['active'] as bool?,
      avatar: json['avatar'] as String?,
      id: json['_id'] as String?,
      nameEn: json['nameEn'] as String?,
      nameAr: json['nameAr'] as String?,
      nameFr: json['nameFr'] as String?,
      subCategories: (json['subCategories'] as List<dynamic>?)
          ?.map((e) => SubCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      isBigImage: json['isBigImage'] as bool?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      '_id': instance.id,
      'nameEn': instance.nameEn,
      'nameAr': instance.nameAr,
      'nameFr': instance.nameFr,
      'avatar': instance.avatar,
      'active': instance.active,
      'isBigImage': instance.isBigImage,
      'subCategories': instance.subCategories,
    };

CategoryRootModel _$CategoryRootModelFromJson(Map<String, dynamic> json) =>
    CategoryRootModel(
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryRootModelToJson(CategoryRootModel instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };
