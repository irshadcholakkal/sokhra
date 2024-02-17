// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryList _$$_CategoryListFromJson(Map<String, dynamic> json) =>
    _$_CategoryList(
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Categorys.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CategoryListToJson(_$_CategoryList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'categories', instance.categories?.map((e) => e.toJson()).toList());
  return val;
}
