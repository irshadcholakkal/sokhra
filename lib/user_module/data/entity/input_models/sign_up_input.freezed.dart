// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignUpInput _$SignUpInputFromJson(Map<String, dynamic> json) {
  return _SignUpInput.fromJson(json);
}

/// @nodoc
mixin _$SignUpInput {
  String? get name => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get otp => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  XFile? get avatar => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignUpInputCopyWith<SignUpInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpInputCopyWith<$Res> {
  factory $SignUpInputCopyWith(
          SignUpInput value, $Res Function(SignUpInput) then) =
      _$SignUpInputCopyWithImpl<$Res, SignUpInput>;
  @useResult
  $Res call(
      {String? name,
      String? phone,
      String? email,
      String? password,
      String? otp,
      @JsonKey(includeFromJson: false, includeToJson: false) XFile? avatar,
      String? lastName});
}

/// @nodoc
class _$SignUpInputCopyWithImpl<$Res, $Val extends SignUpInput>
    implements $SignUpInputCopyWith<$Res> {
  _$SignUpInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? otp = freezed,
    Object? avatar = freezed,
    Object? lastName = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as XFile?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignUpInputCopyWith<$Res>
    implements $SignUpInputCopyWith<$Res> {
  factory _$$_SignUpInputCopyWith(
          _$_SignUpInput value, $Res Function(_$_SignUpInput) then) =
      __$$_SignUpInputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? phone,
      String? email,
      String? password,
      String? otp,
      @JsonKey(includeFromJson: false, includeToJson: false) XFile? avatar,
      String? lastName});
}

/// @nodoc
class __$$_SignUpInputCopyWithImpl<$Res>
    extends _$SignUpInputCopyWithImpl<$Res, _$_SignUpInput>
    implements _$$_SignUpInputCopyWith<$Res> {
  __$$_SignUpInputCopyWithImpl(
      _$_SignUpInput _value, $Res Function(_$_SignUpInput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? otp = freezed,
    Object? avatar = freezed,
    Object? lastName = freezed,
  }) {
    return _then(_$_SignUpInput(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as XFile?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_SignUpInput implements _SignUpInput {
  const _$_SignUpInput(
      {required this.name,
      required this.phone,
      required this.email,
      required this.password,
      this.otp,
      @JsonKey(includeFromJson: false, includeToJson: false) this.avatar,
      this.lastName});

  factory _$_SignUpInput.fromJson(Map<String, dynamic> json) =>
      _$$_SignUpInputFromJson(json);

  @override
  final String? name;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? password;
  @override
  final String? otp;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final XFile? avatar;
  @override
  final String? lastName;

  @override
  String toString() {
    return 'SignUpInput(name: $name, phone: $phone, email: $email, password: $password, otp: $otp, avatar: $avatar, lastName: $lastName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpInput &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, phone, email, password, otp, avatar, lastName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignUpInputCopyWith<_$_SignUpInput> get copyWith =>
      __$$_SignUpInputCopyWithImpl<_$_SignUpInput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignUpInputToJson(
      this,
    );
  }
}

abstract class _SignUpInput implements SignUpInput {
  const factory _SignUpInput(
      {required final String? name,
      required final String? phone,
      required final String? email,
      required final String? password,
      final String? otp,
      @JsonKey(includeFromJson: false, includeToJson: false)
          final XFile? avatar,
      final String? lastName}) = _$_SignUpInput;

  factory _SignUpInput.fromJson(Map<String, dynamic> json) =
      _$_SignUpInput.fromJson;

  @override
  String? get name;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  String? get password;
  @override
  String? get otp;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  XFile? get avatar;
  @override
  String? get lastName;
  @override
  @JsonKey(ignore: true)
  _$$_SignUpInputCopyWith<_$_SignUpInput> get copyWith =>
      throw _privateConstructorUsedError;
}
