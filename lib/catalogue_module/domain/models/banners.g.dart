// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banners.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banner _$BannerFromJson(Map<String, dynamic> json) => Banner(
      id: json['_id'] as String?,
      avatar: json['avatar'] as String?,
      isActive: json['isActive'] as bool?,
      name: json['name'] as String?,
      sortOrder: json['sortOrder'] as int?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$BannerToJson(Banner instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'sortOrder': instance.sortOrder,
      'type': instance.type,
      'isActive': instance.isActive,
    };

BannersRootModel _$BannersRootModelFromJson(Map<String, dynamic> json) =>
    BannersRootModel(
      customerGetAllBanners: (json['customerGetAllBanners'] as List<dynamic>?)
          ?.map((e) => Banner.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BannersRootModelToJson(BannersRootModel instance) =>
    <String, dynamic>{
      'customerGetAllBanners': instance.customerGetAllBanners,
    };
