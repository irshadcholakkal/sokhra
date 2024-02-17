// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_zones.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetAllZones _$GetAllZonesFromJson(Map<String, dynamic> json) {
  return _GetAllZones.fromJson(json);
}

/// @nodoc
mixin _$GetAllZones {
  @JsonValue([])
  List<Zones>? get zones => throw _privateConstructorUsedError;
  int? get totalCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetAllZonesCopyWith<GetAllZones> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllZonesCopyWith<$Res> {
  factory $GetAllZonesCopyWith(
          GetAllZones value, $Res Function(GetAllZones) then) =
      _$GetAllZonesCopyWithImpl<$Res, GetAllZones>;
  @useResult
  $Res call({@JsonValue([]) List<Zones>? zones, int? totalCount});
}

/// @nodoc
class _$GetAllZonesCopyWithImpl<$Res, $Val extends GetAllZones>
    implements $GetAllZonesCopyWith<$Res> {
  _$GetAllZonesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zones = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_value.copyWith(
      zones: freezed == zones
          ? _value.zones
          : zones // ignore: cast_nullable_to_non_nullable
              as List<Zones>?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetAllZonesCopyWith<$Res>
    implements $GetAllZonesCopyWith<$Res> {
  factory _$$_GetAllZonesCopyWith(
          _$_GetAllZones value, $Res Function(_$_GetAllZones) then) =
      __$$_GetAllZonesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonValue([]) List<Zones>? zones, int? totalCount});
}

/// @nodoc
class __$$_GetAllZonesCopyWithImpl<$Res>
    extends _$GetAllZonesCopyWithImpl<$Res, _$_GetAllZones>
    implements _$$_GetAllZonesCopyWith<$Res> {
  __$$_GetAllZonesCopyWithImpl(
      _$_GetAllZones _value, $Res Function(_$_GetAllZones) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zones = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_$_GetAllZones(
      zones: freezed == zones
          ? _value._zones
          : zones // ignore: cast_nullable_to_non_nullable
              as List<Zones>?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetAllZones implements _GetAllZones {
  _$_GetAllZones({@JsonValue([]) final List<Zones>? zones, this.totalCount})
      : _zones = zones;

  factory _$_GetAllZones.fromJson(Map<String, dynamic> json) =>
      _$$_GetAllZonesFromJson(json);

  final List<Zones>? _zones;
  @override
  @JsonValue([])
  List<Zones>? get zones {
    final value = _zones;
    if (value == null) return null;
    if (_zones is EqualUnmodifiableListView) return _zones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? totalCount;

  @override
  String toString() {
    return 'GetAllZones(zones: $zones, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetAllZones &&
            const DeepCollectionEquality().equals(other._zones, _zones) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_zones), totalCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetAllZonesCopyWith<_$_GetAllZones> get copyWith =>
      __$$_GetAllZonesCopyWithImpl<_$_GetAllZones>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetAllZonesToJson(
      this,
    );
  }
}

abstract class _GetAllZones implements GetAllZones {
  factory _GetAllZones(
      {@JsonValue([]) final List<Zones>? zones,
      final int? totalCount}) = _$_GetAllZones;

  factory _GetAllZones.fromJson(Map<String, dynamic> json) =
      _$_GetAllZones.fromJson;

  @override
  @JsonValue([])
  List<Zones>? get zones;
  @override
  int? get totalCount;
  @override
  @JsonKey(ignore: true)
  _$$_GetAllZonesCopyWith<_$_GetAllZones> get copyWith =>
      throw _privateConstructorUsedError;
}
