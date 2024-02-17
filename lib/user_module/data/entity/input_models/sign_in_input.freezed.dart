// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignInInput _$SignInInputFromJson(Map<String, dynamic> json) {
  return _SignInInput.fromJson(json);
}

/// @nodoc
mixin _$SignInInput {
  String? get username => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInInputCopyWith<SignInInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInInputCopyWith<$Res> {
  factory $SignInInputCopyWith(
          SignInInput value, $Res Function(SignInInput) then) =
      _$SignInInputCopyWithImpl<$Res, SignInInput>;
  @useResult
  $Res call({String? username, String? password});
}

/// @nodoc
class _$SignInInputCopyWithImpl<$Res, $Val extends SignInInput>
    implements $SignInInputCopyWith<$Res> {
  _$SignInInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignInInputCopyWith<$Res>
    implements $SignInInputCopyWith<$Res> {
  factory _$$_SignInInputCopyWith(
          _$_SignInInput value, $Res Function(_$_SignInInput) then) =
      __$$_SignInInputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? username, String? password});
}

/// @nodoc
class __$$_SignInInputCopyWithImpl<$Res>
    extends _$SignInInputCopyWithImpl<$Res, _$_SignInInput>
    implements _$$_SignInInputCopyWith<$Res> {
  __$$_SignInInputCopyWithImpl(
      _$_SignInInput _value, $Res Function(_$_SignInInput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_SignInInput(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_SignInInput implements _SignInInput {
  const _$_SignInInput({required this.username, required this.password});

  factory _$_SignInInput.fromJson(Map<String, dynamic> json) =>
      _$$_SignInInputFromJson(json);

  @override
  final String? username;
  @override
  final String? password;

  @override
  String toString() {
    return 'SignInInput(username: $username, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInInput &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, username, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignInInputCopyWith<_$_SignInInput> get copyWith =>
      __$$_SignInInputCopyWithImpl<_$_SignInInput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignInInputToJson(
      this,
    );
  }
}

abstract class _SignInInput implements SignInInput {
  const factory _SignInInput(
      {required final String? username,
      required final String? password}) = _$_SignInInput;

  factory _SignInInput.fromJson(Map<String, dynamic> json) =
      _$_SignInInput.fromJson;

  @override
  String? get username;
  @override
  String? get password;
  @override
  @JsonKey(ignore: true)
  _$$_SignInInputCopyWith<_$_SignInInput> get copyWith =>
      throw _privateConstructorUsedError;
}
