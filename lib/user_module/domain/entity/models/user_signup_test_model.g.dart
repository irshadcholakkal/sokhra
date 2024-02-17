// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_signup_test_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['_id'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
    };

SignUp _$SignUpFromJson(Map<String, dynamic> json) => SignUp(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String,
    );

Map<String, dynamic> _$SignUpToJson(SignUp instance) => <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
    };

SignUpTestModel _$SignUpTestModelFromJson(Map<String, dynamic> json) =>
    SignUpTestModel(
      signUp: SignUp.fromJson(json['signUp'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignUpTestModelToJson(SignUpTestModel instance) =>
    <String, dynamic>{
      'signUp': instance.signUp,
    };
