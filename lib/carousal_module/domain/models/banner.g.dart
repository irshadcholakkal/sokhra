// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Banner _$$_BannerFromJson(Map<String, dynamic> json) => _$_Banner(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      subHeader: json['subHeader'] as String?,
      type: json['type'] as String?,
      avatar: json['avatar'] as String?,
      sortOrder: json['sortOrder'] as int?,
      isActive: json['isActive'] as bool?,
    );

Map<String, dynamic> _$$_BannerToJson(_$_Banner instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('subHeader', instance.subHeader);
  writeNotNull('type', instance.type);
  writeNotNull('avatar', instance.avatar);
  writeNotNull('sortOrder', instance.sortOrder);
  writeNotNull('isActive', instance.isActive);
  return val;
}
