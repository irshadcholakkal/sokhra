// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddressInput _$AddressInputFromJson(Map<String, dynamic> json) {
  return _AddressInput.fromJson(json);
}

/// @nodoc
mixin _$AddressInput {
  String? get building => throw _privateConstructorUsedError;
  String? get street => throw _privateConstructorUsedError;
  String? get landMark => throw _privateConstructorUsedError;
  MapLocation? get mapLocation => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressInputCopyWith<AddressInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressInputCopyWith<$Res> {
  factory $AddressInputCopyWith(
          AddressInput value, $Res Function(AddressInput) then) =
      _$AddressInputCopyWithImpl<$Res, AddressInput>;
  @useResult
  $Res call(
      {String? building,
      String? street,
      String? landMark,
      MapLocation? mapLocation,
      String? type});

  $MapLocationCopyWith<$Res>? get mapLocation;
}

/// @nodoc
class _$AddressInputCopyWithImpl<$Res, $Val extends AddressInput>
    implements $AddressInputCopyWith<$Res> {
  _$AddressInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? building = freezed,
    Object? street = freezed,
    Object? landMark = freezed,
    Object? mapLocation = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      building: freezed == building
          ? _value.building
          : building // ignore: cast_nullable_to_non_nullable
              as String?,
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      landMark: freezed == landMark
          ? _value.landMark
          : landMark // ignore: cast_nullable_to_non_nullable
              as String?,
      mapLocation: freezed == mapLocation
          ? _value.mapLocation
          : mapLocation // ignore: cast_nullable_to_non_nullable
              as MapLocation?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MapLocationCopyWith<$Res>? get mapLocation {
    if (_value.mapLocation == null) {
      return null;
    }

    return $MapLocationCopyWith<$Res>(_value.mapLocation!, (value) {
      return _then(_value.copyWith(mapLocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AddressInputCopyWith<$Res>
    implements $AddressInputCopyWith<$Res> {
  factory _$$_AddressInputCopyWith(
          _$_AddressInput value, $Res Function(_$_AddressInput) then) =
      __$$_AddressInputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? building,
      String? street,
      String? landMark,
      MapLocation? mapLocation,
      String? type});

  @override
  $MapLocationCopyWith<$Res>? get mapLocation;
}

/// @nodoc
class __$$_AddressInputCopyWithImpl<$Res>
    extends _$AddressInputCopyWithImpl<$Res, _$_AddressInput>
    implements _$$_AddressInputCopyWith<$Res> {
  __$$_AddressInputCopyWithImpl(
      _$_AddressInput _value, $Res Function(_$_AddressInput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? building = freezed,
    Object? street = freezed,
    Object? landMark = freezed,
    Object? mapLocation = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_AddressInput(
      building: freezed == building
          ? _value.building
          : building // ignore: cast_nullable_to_non_nullable
              as String?,
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      landMark: freezed == landMark
          ? _value.landMark
          : landMark // ignore: cast_nullable_to_non_nullable
              as String?,
      mapLocation: freezed == mapLocation
          ? _value.mapLocation
          : mapLocation // ignore: cast_nullable_to_non_nullable
              as MapLocation?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_AddressInput implements _AddressInput {
  const _$_AddressInput(
      {this.building, this.street, this.landMark, this.mapLocation, this.type});

  factory _$_AddressInput.fromJson(Map<String, dynamic> json) =>
      _$$_AddressInputFromJson(json);

  @override
  final String? building;
  @override
  final String? street;
  @override
  final String? landMark;
  @override
  final MapLocation? mapLocation;
  @override
  final String? type;

  @override
  String toString() {
    return 'AddressInput(building: $building, street: $street, landMark: $landMark, mapLocation: $mapLocation, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddressInput &&
            (identical(other.building, building) ||
                other.building == building) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.landMark, landMark) ||
                other.landMark == landMark) &&
            (identical(other.mapLocation, mapLocation) ||
                other.mapLocation == mapLocation) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, building, street, landMark, mapLocation, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddressInputCopyWith<_$_AddressInput> get copyWith =>
      __$$_AddressInputCopyWithImpl<_$_AddressInput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressInputToJson(
      this,
    );
  }
}

abstract class _AddressInput implements AddressInput {
  const factory _AddressInput(
      {final String? building,
      final String? street,
      final String? landMark,
      final MapLocation? mapLocation,
      final String? type}) = _$_AddressInput;

  factory _AddressInput.fromJson(Map<String, dynamic> json) =
      _$_AddressInput.fromJson;

  @override
  String? get building;
  @override
  String? get street;
  @override
  String? get landMark;
  @override
  MapLocation? get mapLocation;
  @override
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$_AddressInputCopyWith<_$_AddressInput> get copyWith =>
      throw _privateConstructorUsedError;
}
