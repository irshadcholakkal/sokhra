// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tax _$$_TaxFromJson(Map<String, dynamic> json) => _$_Tax(
      id: json['_id'] as String?,
      hsnCode: json['hsnCode'] as String?,
      hsnTaxCode: json['hsnTaxCode'] as String?,
      tax: (json['tax'] as List<dynamic>?)
          ?.map((e) => TaxDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TaxToJson(_$_Tax instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('hsnCode', instance.hsnCode);
  writeNotNull('hsnTaxCode', instance.hsnTaxCode);
  writeNotNull('tax', instance.tax?.map((e) => e.toJson()).toList());
  return val;
}
