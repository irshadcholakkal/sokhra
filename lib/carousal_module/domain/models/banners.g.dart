// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banners.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Banners _$$_BannersFromJson(Map<String, dynamic> json) => _$_Banners(
      banners: (json['banners'] as List<dynamic>?)
              ?.map((e) => Banner.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_BannersToJson(_$_Banners instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('banners', instance.banners?.map((e) => e.toJson()).toList());
  return val;
}
