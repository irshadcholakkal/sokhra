// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PersonalDetails _$$_PersonalDetailsFromJson(Map<String, dynamic> json) =>
    _$_PersonalDetails(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$_PersonalDetailsToJson(_$_PersonalDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone);
  writeNotNull('address', instance.address);
  return val;
}
