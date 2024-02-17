// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EmailToken _$EmailTokenFromJson(Map<String, dynamic> json) {
  return _EmailToken.fromJson(json);
}

/// @nodoc
mixin _$EmailToken {
  String? get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmailTokenCopyWith<EmailToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailTokenCopyWith<$Res> {
  factory $EmailTokenCopyWith(
          EmailToken value, $Res Function(EmailToken) then) =
      _$EmailTokenCopyWithImpl<$Res, EmailToken>;
  @useResult
  $Res call({String? value});
}

/// @nodoc
class _$EmailTokenCopyWithImpl<$Res, $Val extends EmailToken>
    implements $EmailTokenCopyWith<$Res> {
  _$EmailTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EmailTokenCopyWith<$Res>
    implements $EmailTokenCopyWith<$Res> {
  factory _$$_EmailTokenCopyWith(
          _$_EmailToken value, $Res Function(_$_EmailToken) then) =
      __$$_EmailTokenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? value});
}

/// @nodoc
class __$$_EmailTokenCopyWithImpl<$Res>
    extends _$EmailTokenCopyWithImpl<$Res, _$_EmailToken>
    implements _$$_EmailTokenCopyWith<$Res> {
  __$$_EmailTokenCopyWithImpl(
      _$_EmailToken _value, $Res Function(_$_EmailToken) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$_EmailToken(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_EmailToken implements _EmailToken {
  const _$_EmailToken({this.value});

  factory _$_EmailToken.fromJson(Map<String, dynamic> json) =>
      _$$_EmailTokenFromJson(json);

  @override
  final String? value;

  @override
  String toString() {
    return 'EmailToken(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmailToken &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmailTokenCopyWith<_$_EmailToken> get copyWith =>
      __$$_EmailTokenCopyWithImpl<_$_EmailToken>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmailTokenToJson(
      this,
    );
  }
}

abstract class _EmailToken implements EmailToken {
  const factory _EmailToken({final String? value}) = _$_EmailToken;

  factory _EmailToken.fromJson(Map<String, dynamic> json) =
      _$_EmailToken.fromJson;

  @override
  String? get value;
  @override
  @JsonKey(ignore: true)
  _$$_EmailTokenCopyWith<_$_EmailToken> get copyWith =>
      throw _privateConstructorUsedError;
}
