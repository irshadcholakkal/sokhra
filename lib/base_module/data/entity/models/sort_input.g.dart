// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SortInput _$$_SortInputFromJson(Map<String, dynamic> json) => _$_SortInput(
      price: $enumDecodeNullable(_$SortTypeEnumMap, json['price']),
      createdAt: $enumDecodeNullable(_$SortTypeEnumMap, json['createdAt']),
    );

Map<String, dynamic> _$$_SortInputToJson(_$_SortInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('price', _$SortTypeEnumMap[instance.price]);
  writeNotNull('createdAt', _$SortTypeEnumMap[instance.createdAt]);
  return val;
}

const _$SortTypeEnumMap = {
  SortType.Desc: 'Desc',
  SortType.Asc: 'Asc',
};
