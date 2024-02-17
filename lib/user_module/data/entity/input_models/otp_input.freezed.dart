// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OtpInput _$OtpInputFromJson(Map<String, dynamic> json) {
  return _OtpInput.fromJson(json);
}

/// @nodoc
mixin _$OtpInput {
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  OtpType get otpType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OtpInputCopyWith<OtpInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpInputCopyWith<$Res> {
  factory $OtpInputCopyWith(OtpInput value, $Res Function(OtpInput) then) =
      _$OtpInputCopyWithImpl<$Res, OtpInput>;
  @useResult
  $Res call({String? email, String? phone, OtpType otpType});
}

/// @nodoc
class _$OtpInputCopyWithImpl<$Res, $Val extends OtpInput>
    implements $OtpInputCopyWith<$Res> {
  _$OtpInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? phone = freezed,
    Object? otpType = null,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      otpType: null == otpType
          ? _value.otpType
          : otpType // ignore: cast_nullable_to_non_nullable
              as OtpType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OtpInputCopyWith<$Res> implements $OtpInputCopyWith<$Res> {
  factory _$$_OtpInputCopyWith(
          _$_OtpInput value, $Res Function(_$_OtpInput) then) =
      __$$_OtpInputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? email, String? phone, OtpType otpType});
}

/// @nodoc
class __$$_OtpInputCopyWithImpl<$Res>
    extends _$OtpInputCopyWithImpl<$Res, _$_OtpInput>
    implements _$$_OtpInputCopyWith<$Res> {
  __$$_OtpInputCopyWithImpl(
      _$_OtpInput _value, $Res Function(_$_OtpInput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? phone = freezed,
    Object? otpType = null,
  }) {
    return _then(_$_OtpInput(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      otpType: null == otpType
          ? _value.otpType
          : otpType // ignore: cast_nullable_to_non_nullable
              as OtpType,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_OtpInput implements _OtpInput {
  const _$_OtpInput({this.email, this.phone, required this.otpType});

  factory _$_OtpInput.fromJson(Map<String, dynamic> json) =>
      _$$_OtpInputFromJson(json);

  @override
  final String? email;
  @override
  final String? phone;
  @override
  final OtpType otpType;

  @override
  String toString() {
    return 'OtpInput(email: $email, phone: $phone, otpType: $otpType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OtpInput &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.otpType, otpType) || other.otpType == otpType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, phone, otpType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OtpInputCopyWith<_$_OtpInput> get copyWith =>
      __$$_OtpInputCopyWithImpl<_$_OtpInput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OtpInputToJson(
      this,
    );
  }
}

abstract class _OtpInput implements OtpInput {
  const factory _OtpInput(
      {final String? email,
      final String? phone,
      required final OtpType otpType}) = _$_OtpInput;

  factory _OtpInput.fromJson(Map<String, dynamic> json) = _$_OtpInput.fromJson;

  @override
  String? get email;
  @override
  String? get phone;
  @override
  OtpType get otpType;
  @override
  @JsonKey(ignore: true)
  _$$_OtpInputCopyWith<_$_OtpInput> get copyWith =>
      throw _privateConstructorUsedError;
}
