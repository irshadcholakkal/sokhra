// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppData _$$_AppDataFromJson(Map<String, dynamic> json) => _$_AppData(
      id: json['_id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      addressDetails: (json['addressDetails'] as List<dynamic>?)
              ?.map((e) => ShippingAddress.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      discountCode: json['discountCode'] as String?,
    );

Map<String, dynamic> _$$_AppDataToJson(_$_AppData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('user', instance.user?.toJson());
  writeNotNull('addressDetails',
      instance.addressDetails?.map((e) => e.toJson()).toList());
  writeNotNull('discountCode', instance.discountCode);
  return val;
}
