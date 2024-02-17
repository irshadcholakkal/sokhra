// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      lastname: json['lastname'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      role: $enumDecodeNullable(_$RoleEnumMap, json['role']),
      seller: json['seller'] == null
          ? null
          : Seller.fromJson(json['seller'] as Map<String, dynamic>),
      emailToken: json['emailToken'] == null
          ? null
          : EmailToken.fromJson(json['emailToken'] as Map<String, dynamic>),
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('lastname', instance.lastname);
  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone);
  writeNotNull('role', _$RoleEnumMap[instance.role]);
  writeNotNull('seller', instance.seller?.toJson());
  writeNotNull('emailToken', instance.emailToken?.toJson());
  writeNotNull('active', instance.active);
  return val;
}

const _$RoleEnumMap = {
  Role.GUEST: 'GUEST',
  Role.DRIVER: 'DRIVER',
  Role.CUSTOMER: 'CUSTOMER',
  Role.VENDOR: 'VENDOR',
};
