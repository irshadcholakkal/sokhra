// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscribed_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubscribedUser _$SubscribedUserFromJson(Map<String, dynamic> json) {
  return _SubscribedUser.fromJson(json);
}

/// @nodoc
mixin _$SubscribedUser {
  User? get user => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubscribedUserCopyWith<SubscribedUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscribedUserCopyWith<$Res> {
  factory $SubscribedUserCopyWith(
          SubscribedUser value, $Res Function(SubscribedUser) then) =
      _$SubscribedUserCopyWithImpl<$Res, SubscribedUser>;
  @useResult
  $Res call({User? user, String? token});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$SubscribedUserCopyWithImpl<$Res, $Val extends SubscribedUser>
    implements $SubscribedUserCopyWith<$Res> {
  _$SubscribedUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SubscribedUserCopyWith<$Res>
    implements $SubscribedUserCopyWith<$Res> {
  factory _$$_SubscribedUserCopyWith(
          _$_SubscribedUser value, $Res Function(_$_SubscribedUser) then) =
      __$$_SubscribedUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User? user, String? token});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_SubscribedUserCopyWithImpl<$Res>
    extends _$SubscribedUserCopyWithImpl<$Res, _$_SubscribedUser>
    implements _$$_SubscribedUserCopyWith<$Res> {
  __$$_SubscribedUserCopyWithImpl(
      _$_SubscribedUser _value, $Res Function(_$_SubscribedUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? token = freezed,
  }) {
    return _then(_$_SubscribedUser(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_SubscribedUser implements _SubscribedUser {
  const _$_SubscribedUser({this.user, this.token});

  factory _$_SubscribedUser.fromJson(Map<String, dynamic> json) =>
      _$$_SubscribedUserFromJson(json);

  @override
  final User? user;
  @override
  final String? token;

  @override
  String toString() {
    return 'SubscribedUser(user: $user, token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubscribedUser &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubscribedUserCopyWith<_$_SubscribedUser> get copyWith =>
      __$$_SubscribedUserCopyWithImpl<_$_SubscribedUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubscribedUserToJson(
      this,
    );
  }
}

abstract class _SubscribedUser implements SubscribedUser {
  const factory _SubscribedUser({final User? user, final String? token}) =
      _$_SubscribedUser;

  factory _SubscribedUser.fromJson(Map<String, dynamic> json) =
      _$_SubscribedUser.fromJson;

  @override
  User? get user;
  @override
  String? get token;
  @override
  @JsonKey(ignore: true)
  _$$_SubscribedUserCopyWith<_$_SubscribedUser> get copyWith =>
      throw _privateConstructorUsedError;
}
