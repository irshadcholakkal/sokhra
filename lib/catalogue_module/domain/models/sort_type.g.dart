// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SortType _$$_SortTypeFromJson(Map<String, dynamic> json) => _$_SortType(
      price: json['price'] == null
          ? null
          : SortType.fromJson(json['price'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : SortType.fromJson(json['createdAt'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SortTypeToJson(_$_SortType instance) =>
    <String, dynamic>{
      'price': instance.price,
      'createdAt': instance.createdAt,
    };
