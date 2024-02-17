// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_pick.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PickedLocation _$PickedLocationFromJson(Map<String, dynamic> json) {
  return _PickedLocation.fromJson(json);
}

/// @nodoc
mixin _$PickedLocation {
  double? get lat => throw _privateConstructorUsedError;
  double? get lng => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PickedLocationCopyWith<PickedLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PickedLocationCopyWith<$Res> {
  factory $PickedLocationCopyWith(
          PickedLocation value, $Res Function(PickedLocation) then) =
      _$PickedLocationCopyWithImpl<$Res, PickedLocation>;
  @useResult
  $Res call({double? lat, double? lng});
}

/// @nodoc
class _$PickedLocationCopyWithImpl<$Res, $Val extends PickedLocation>
    implements $PickedLocationCopyWith<$Res> {
  _$PickedLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_value.copyWith(
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lng: freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PickedLocationCopyWith<$Res>
    implements $PickedLocationCopyWith<$Res> {
  factory _$$_PickedLocationCopyWith(
          _$_PickedLocation value, $Res Function(_$_PickedLocation) then) =
      __$$_PickedLocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? lat, double? lng});
}

/// @nodoc
class __$$_PickedLocationCopyWithImpl<$Res>
    extends _$PickedLocationCopyWithImpl<$Res, _$_PickedLocation>
    implements _$$_PickedLocationCopyWith<$Res> {
  __$$_PickedLocationCopyWithImpl(
      _$_PickedLocation _value, $Res Function(_$_PickedLocation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_$_PickedLocation(
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lng: freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_PickedLocation
    with DiagnosticableTreeMixin
    implements _PickedLocation {
  const _$_PickedLocation({this.lat, this.lng});

  factory _$_PickedLocation.fromJson(Map<String, dynamic> json) =>
      _$$_PickedLocationFromJson(json);

  @override
  final double? lat;
  @override
  final double? lng;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PickedLocation(lat: $lat, lng: $lng)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PickedLocation'))
      ..add(DiagnosticsProperty('lat', lat))
      ..add(DiagnosticsProperty('lng', lng));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PickedLocation &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PickedLocationCopyWith<_$_PickedLocation> get copyWith =>
      __$$_PickedLocationCopyWithImpl<_$_PickedLocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PickedLocationToJson(
      this,
    );
  }
}

abstract class _PickedLocation implements PickedLocation {
  const factory _PickedLocation({final double? lat, final double? lng}) =
      _$_PickedLocation;

  factory _PickedLocation.fromJson(Map<String, dynamic> json) =
      _$_PickedLocation.fromJson;

  @override
  double? get lat;
  @override
  double? get lng;
  @override
  @JsonKey(ignore: true)
  _$$_PickedLocationCopyWith<_$_PickedLocation> get copyWith =>
      throw _privateConstructorUsedError;
}
