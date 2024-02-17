// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MapLocation _$MapLocationFromJson(Map<String, dynamic> json) {
  return _MapLocation.fromJson(json);
}

/// @nodoc
mixin _$MapLocation {
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MapLocationCopyWith<MapLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapLocationCopyWith<$Res> {
  factory $MapLocationCopyWith(
          MapLocation value, $Res Function(MapLocation) then) =
      _$MapLocationCopyWithImpl<$Res, MapLocation>;
  @useResult
  $Res call({double? latitude, double? longitude});
}

/// @nodoc
class _$MapLocationCopyWithImpl<$Res, $Val extends MapLocation>
    implements $MapLocationCopyWith<$Res> {
  _$MapLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MapLocationCopyWith<$Res>
    implements $MapLocationCopyWith<$Res> {
  factory _$$_MapLocationCopyWith(
          _$_MapLocation value, $Res Function(_$_MapLocation) then) =
      __$$_MapLocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? latitude, double? longitude});
}

/// @nodoc
class __$$_MapLocationCopyWithImpl<$Res>
    extends _$MapLocationCopyWithImpl<$Res, _$_MapLocation>
    implements _$$_MapLocationCopyWith<$Res> {
  __$$_MapLocationCopyWithImpl(
      _$_MapLocation _value, $Res Function(_$_MapLocation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_$_MapLocation(
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_MapLocation implements _MapLocation {
  const _$_MapLocation({this.latitude, this.longitude});

  factory _$_MapLocation.fromJson(Map<String, dynamic> json) =>
      _$$_MapLocationFromJson(json);

  @override
  final double? latitude;
  @override
  final double? longitude;

  @override
  String toString() {
    return 'MapLocation(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MapLocation &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MapLocationCopyWith<_$_MapLocation> get copyWith =>
      __$$_MapLocationCopyWithImpl<_$_MapLocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MapLocationToJson(
      this,
    );
  }
}

abstract class _MapLocation implements MapLocation {
  const factory _MapLocation(
      {final double? latitude, final double? longitude}) = _$_MapLocation;

  factory _MapLocation.fromJson(Map<String, dynamic> json) =
      _$_MapLocation.fromJson;

  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  @JsonKey(ignore: true)
  _$$_MapLocationCopyWith<_$_MapLocation> get copyWith =>
      throw _privateConstructorUsedError;
}
