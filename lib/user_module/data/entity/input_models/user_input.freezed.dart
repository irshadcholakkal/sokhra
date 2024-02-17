// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserInput _$UserInputFromJson(Map<String, dynamic> json) {
  return _UserInput.fromJson(json);
}

/// @nodoc
mixin _$UserInput {
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get otp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInputCopyWith<UserInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInputCopyWith<$Res> {
  factory $UserInputCopyWith(UserInput value, $Res Function(UserInput) then) =
      _$UserInputCopyWithImpl<$Res, UserInput>;
  @useResult
  $Res call(
      {String? firstName,
      String? lastName,
      String? phone,
      String? email,
      String? otp});
}

/// @nodoc
class _$UserInputCopyWithImpl<$Res, $Val extends UserInput>
    implements $UserInputCopyWith<$Res> {
  _$UserInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? otp = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserInputCopyWith<$Res> implements $UserInputCopyWith<$Res> {
  factory _$$_UserInputCopyWith(
          _$_UserInput value, $Res Function(_$_UserInput) then) =
      __$$_UserInputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? firstName,
      String? lastName,
      String? phone,
      String? email,
      String? otp});
}

/// @nodoc
class __$$_UserInputCopyWithImpl<$Res>
    extends _$UserInputCopyWithImpl<$Res, _$_UserInput>
    implements _$$_UserInputCopyWith<$Res> {
  __$$_UserInputCopyWithImpl(
      _$_UserInput _value, $Res Function(_$_UserInput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? otp = freezed,
  }) {
    return _then(_$_UserInput(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_UserInput implements _UserInput {
  const _$_UserInput(
      {this.firstName, this.lastName, this.phone, this.email, this.otp});

  factory _$_UserInput.fromJson(Map<String, dynamic> json) =>
      _$$_UserInputFromJson(json);

  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? otp;

  @override
  String toString() {
    return 'UserInput(firstName: $firstName, lastName: $lastName, phone: $phone, email: $email, otp: $otp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserInput &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, firstName, lastName, phone, email, otp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserInputCopyWith<_$_UserInput> get copyWith =>
      __$$_UserInputCopyWithImpl<_$_UserInput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserInputToJson(
      this,
    );
  }
}

abstract class _UserInput implements UserInput {
  const factory _UserInput(
      {final String? firstName,
      final String? lastName,
      final String? phone,
      final String? email,
      final String? otp}) = _$_UserInput;

  factory _UserInput.fromJson(Map<String, dynamic> json) =
      _$_UserInput.fromJson;

  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  String? get otp;
  @override
  @JsonKey(ignore: true)
  _$$_UserInputCopyWith<_$_UserInput> get copyWith =>
      throw _privateConstructorUsedError;
}
