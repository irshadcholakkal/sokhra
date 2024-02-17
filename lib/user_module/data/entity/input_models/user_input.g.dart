// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserInput _$$_UserInputFromJson(Map<String, dynamic> json) => _$_UserInput(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      otp: json['otp'] as String?,
    );

Map<String, dynamic> _$$_UserInputToJson(_$_UserInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('phone', instance.phone);
  writeNotNull('email', instance.email);
  writeNotNull('otp', instance.otp);
  return val;
}
