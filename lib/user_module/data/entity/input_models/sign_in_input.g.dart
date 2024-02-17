// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignInInput _$$_SignInInputFromJson(Map<String, dynamic> json) =>
    _$_SignInInput(
      username: json['username'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$$_SignInInputToJson(_$_SignInInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('username', instance.username);
  writeNotNull('password', instance.password);
  return val;
}
