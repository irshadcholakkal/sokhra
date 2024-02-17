// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_update_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserUpdateInput _$UserUpdateInputFromJson(Map<String, dynamic> json) {
  return _UserUpdateInput.fromJson(json);
}

/// @nodoc
mixin _$UserUpdateInput {
  String? get name => throw _privateConstructorUsedError;
  String? get lastname => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserUpdateInputCopyWith<UserUpdateInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserUpdateInputCopyWith<$Res> {
  factory $UserUpdateInputCopyWith(
          UserUpdateInput value, $Res Function(UserUpdateInput) then) =
      _$UserUpdateInputCopyWithImpl<$Res, UserUpdateInput>;
  @useResult
  $Res call(
      {String? name,
      String? lastname,
      String? email,
      String? phone,
      bool? active});
}

/// @nodoc
class _$UserUpdateInputCopyWithImpl<$Res, $Val extends UserUpdateInput>
    implements $UserUpdateInputCopyWith<$Res> {
  _$UserUpdateInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? lastname = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? active = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: freezed == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserUpdateInputCopyWith<$Res>
    implements $UserUpdateInputCopyWith<$Res> {
  factory _$$_UserUpdateInputCopyWith(
          _$_UserUpdateInput value, $Res Function(_$_UserUpdateInput) then) =
      __$$_UserUpdateInputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? lastname,
      String? email,
      String? phone,
      bool? active});
}

/// @nodoc
class __$$_UserUpdateInputCopyWithImpl<$Res>
    extends _$UserUpdateInputCopyWithImpl<$Res, _$_UserUpdateInput>
    implements _$$_UserUpdateInputCopyWith<$Res> {
  __$$_UserUpdateInputCopyWithImpl(
      _$_UserUpdateInput _value, $Res Function(_$_UserUpdateInput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? lastname = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? active = freezed,
  }) {
    return _then(_$_UserUpdateInput(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: freezed == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_UserUpdateInput implements _UserUpdateInput {
  const _$_UserUpdateInput(
      {this.name, this.lastname, this.email, this.phone, this.active});

  factory _$_UserUpdateInput.fromJson(Map<String, dynamic> json) =>
      _$$_UserUpdateInputFromJson(json);

  @override
  final String? name;
  @override
  final String? lastname;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final bool? active;

  @override
  String toString() {
    return 'UserUpdateInput(name: $name, lastname: $lastname, email: $email, phone: $phone, active: $active)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserUpdateInput &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, lastname, email, phone, active);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserUpdateInputCopyWith<_$_UserUpdateInput> get copyWith =>
      __$$_UserUpdateInputCopyWithImpl<_$_UserUpdateInput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserUpdateInputToJson(
      this,
    );
  }
}

abstract class _UserUpdateInput implements UserUpdateInput {
  const factory _UserUpdateInput(
      {final String? name,
      final String? lastname,
      final String? email,
      final String? phone,
      final bool? active}) = _$_UserUpdateInput;

  factory _UserUpdateInput.fromJson(Map<String, dynamic> json) =
      _$_UserUpdateInput.fromJson;

  @override
  String? get name;
  @override
  String? get lastname;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  bool? get active;
  @override
  @JsonKey(ignore: true)
  _$$_UserUpdateInputCopyWith<_$_UserUpdateInput> get copyWith =>
      throw _privateConstructorUsedError;
}
