// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_update_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserUpdateInput _$$_UserUpdateInputFromJson(Map<String, dynamic> json) =>
    _$_UserUpdateInput(
      name: json['name'] as String?,
      lastname: json['lastname'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$$_UserUpdateInputToJson(_$_UserUpdateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('lastname', instance.lastname);
  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone);
  writeNotNull('active', instance.active);
  return val;
}
