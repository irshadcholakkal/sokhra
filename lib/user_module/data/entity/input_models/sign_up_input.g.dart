// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignUpInput _$$_SignUpInputFromJson(Map<String, dynamic> json) =>
    _$_SignUpInput(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      otp: json['otp'] as String?,
      lastName: json['lastName'] as String?,
    );

Map<String, dynamic> _$$_SignUpInputToJson(_$_SignUpInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('phone', instance.phone);
  writeNotNull('email', instance.email);
  writeNotNull('password', instance.password);
  writeNotNull('otp', instance.otp);
  writeNotNull('lastName', instance.lastName);
  return val;
}
