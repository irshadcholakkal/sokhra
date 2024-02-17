// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personal_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PersonalDetails _$PersonalDetailsFromJson(Map<String, dynamic> json) {
  return _PersonalDetails.fromJson(json);
}

/// @nodoc
mixin _$PersonalDetails {
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonalDetailsCopyWith<PersonalDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalDetailsCopyWith<$Res> {
  factory $PersonalDetailsCopyWith(
          PersonalDetails value, $Res Function(PersonalDetails) then) =
      _$PersonalDetailsCopyWithImpl<$Res, PersonalDetails>;
  @useResult
  $Res call({String? name, String? email, String? phone, String? address});
}

/// @nodoc
class _$PersonalDetailsCopyWithImpl<$Res, $Val extends PersonalDetails>
    implements $PersonalDetailsCopyWith<$Res> {
  _$PersonalDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PersonalDetailsCopyWith<$Res>
    implements $PersonalDetailsCopyWith<$Res> {
  factory _$$_PersonalDetailsCopyWith(
          _$_PersonalDetails value, $Res Function(_$_PersonalDetails) then) =
      __$$_PersonalDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? email, String? phone, String? address});
}

/// @nodoc
class __$$_PersonalDetailsCopyWithImpl<$Res>
    extends _$PersonalDetailsCopyWithImpl<$Res, _$_PersonalDetails>
    implements _$$_PersonalDetailsCopyWith<$Res> {
  __$$_PersonalDetailsCopyWithImpl(
      _$_PersonalDetails _value, $Res Function(_$_PersonalDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? address = freezed,
  }) {
    return _then(_$_PersonalDetails(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_PersonalDetails
    with DiagnosticableTreeMixin
    implements _PersonalDetails {
  const _$_PersonalDetails({this.name, this.email, this.phone, this.address});

  factory _$_PersonalDetails.fromJson(Map<String, dynamic> json) =>
      _$$_PersonalDetailsFromJson(json);

  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final String? address;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PersonalDetails(name: $name, email: $email, phone: $phone, address: $address)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PersonalDetails'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('address', address));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PersonalDetails &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, phone, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PersonalDetailsCopyWith<_$_PersonalDetails> get copyWith =>
      __$$_PersonalDetailsCopyWithImpl<_$_PersonalDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PersonalDetailsToJson(
      this,
    );
  }
}

abstract class _PersonalDetails implements PersonalDetails {
  const factory _PersonalDetails(
      {final String? name,
      final String? email,
      final String? phone,
      final String? address}) = _$_PersonalDetails;

  factory _PersonalDetails.fromJson(Map<String, dynamic> json) =
      _$_PersonalDetails.fromJson;

  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  String? get address;
  @override
  @JsonKey(ignore: true)
  _$$_PersonalDetailsCopyWith<_$_PersonalDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
