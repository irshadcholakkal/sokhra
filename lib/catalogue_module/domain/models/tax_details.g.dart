// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaxDetails _$$_TaxDetailsFromJson(Map<String, dynamic> json) =>
    _$_TaxDetails(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      percentage: (json['percentage'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_TaxDetailsToJson(_$_TaxDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('percentage', instance.percentage);
  return val;
}
