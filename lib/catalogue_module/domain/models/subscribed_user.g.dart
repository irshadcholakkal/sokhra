// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscribed_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubscribedUser _$$_SubscribedUserFromJson(Map<String, dynamic> json) =>
    _$_SubscribedUser(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$_SubscribedUserToJson(_$_SubscribedUser instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user', instance.user?.toJson());
  writeNotNull('token', instance.token);
  return val;
}
