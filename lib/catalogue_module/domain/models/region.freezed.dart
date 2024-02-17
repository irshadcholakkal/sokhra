// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'region.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Region _$RegionFromJson(Map<String, dynamic> json) {
  return _Region.fromJson(json);
}

/// @nodoc
mixin _$Region {
  @JsonKey(name: "_id")
  String? get regionId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  bool? get hasSameDayDelivery => throw _privateConstructorUsedError;
  bool? get hasSameDayShipping => throw _privateConstructorUsedError;
  String? get cutOfTime => throw _privateConstructorUsedError;
  List<Zone>? get zones => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegionCopyWith<Region> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegionCopyWith<$Res> {
  factory $RegionCopyWith(Region value, $Res Function(Region) then) =
      _$RegionCopyWithImpl<$Res, Region>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? regionId,
      String? name,
      bool? isActive,
      bool? hasSameDayDelivery,
      bool? hasSameDayShipping,
      String? cutOfTime,
      List<Zone>? zones});
}

/// @nodoc
class _$RegionCopyWithImpl<$Res, $Val extends Region>
    implements $RegionCopyWith<$Res> {
  _$RegionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regionId = freezed,
    Object? name = freezed,
    Object? isActive = freezed,
    Object? hasSameDayDelivery = freezed,
    Object? hasSameDayShipping = freezed,
    Object? cutOfTime = freezed,
    Object? zones = freezed,
  }) {
    return _then(_value.copyWith(
      regionId: freezed == regionId
          ? _value.regionId
          : regionId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSameDayDelivery: freezed == hasSameDayDelivery
          ? _value.hasSameDayDelivery
          : hasSameDayDelivery // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSameDayShipping: freezed == hasSameDayShipping
          ? _value.hasSameDayShipping
          : hasSameDayShipping // ignore: cast_nullable_to_non_nullable
              as bool?,
      cutOfTime: freezed == cutOfTime
          ? _value.cutOfTime
          : cutOfTime // ignore: cast_nullable_to_non_nullable
              as String?,
      zones: freezed == zones
          ? _value.zones
          : zones // ignore: cast_nullable_to_non_nullable
              as List<Zone>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegionCopyWith<$Res> implements $RegionCopyWith<$Res> {
  factory _$$_RegionCopyWith(_$_Region value, $Res Function(_$_Region) then) =
      __$$_RegionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? regionId,
      String? name,
      bool? isActive,
      bool? hasSameDayDelivery,
      bool? hasSameDayShipping,
      String? cutOfTime,
      List<Zone>? zones});
}

/// @nodoc
class __$$_RegionCopyWithImpl<$Res>
    extends _$RegionCopyWithImpl<$Res, _$_Region>
    implements _$$_RegionCopyWith<$Res> {
  __$$_RegionCopyWithImpl(_$_Region _value, $Res Function(_$_Region) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regionId = freezed,
    Object? name = freezed,
    Object? isActive = freezed,
    Object? hasSameDayDelivery = freezed,
    Object? hasSameDayShipping = freezed,
    Object? cutOfTime = freezed,
    Object? zones = freezed,
  }) {
    return _then(_$_Region(
      regionId: freezed == regionId
          ? _value.regionId
          : regionId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSameDayDelivery: freezed == hasSameDayDelivery
          ? _value.hasSameDayDelivery
          : hasSameDayDelivery // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSameDayShipping: freezed == hasSameDayShipping
          ? _value.hasSameDayShipping
          : hasSameDayShipping // ignore: cast_nullable_to_non_nullable
              as bool?,
      cutOfTime: freezed == cutOfTime
          ? _value.cutOfTime
          : cutOfTime // ignore: cast_nullable_to_non_nullable
              as String?,
      zones: freezed == zones
          ? _value._zones
          : zones // ignore: cast_nullable_to_non_nullable
              as List<Zone>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_Region implements _Region {
  const _$_Region(
      {@JsonKey(name: "_id") this.regionId,
      this.name,
      this.isActive,
      this.hasSameDayDelivery,
      this.hasSameDayShipping,
      this.cutOfTime,
      final List<Zone>? zones})
      : _zones = zones;

  factory _$_Region.fromJson(Map<String, dynamic> json) =>
      _$$_RegionFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? regionId;
  @override
  final String? name;
  @override
  final bool? isActive;
  @override
  final bool? hasSameDayDelivery;
  @override
  final bool? hasSameDayShipping;
  @override
  final String? cutOfTime;
  final List<Zone>? _zones;
  @override
  List<Zone>? get zones {
    final value = _zones;
    if (value == null) return null;
    if (_zones is EqualUnmodifiableListView) return _zones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Region(regionId: $regionId, name: $name, isActive: $isActive, hasSameDayDelivery: $hasSameDayDelivery, hasSameDayShipping: $hasSameDayShipping, cutOfTime: $cutOfTime, zones: $zones)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Region &&
            (identical(other.regionId, regionId) ||
                other.regionId == regionId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.hasSameDayDelivery, hasSameDayDelivery) ||
                other.hasSameDayDelivery == hasSameDayDelivery) &&
            (identical(other.hasSameDayShipping, hasSameDayShipping) ||
                other.hasSameDayShipping == hasSameDayShipping) &&
            (identical(other.cutOfTime, cutOfTime) ||
                other.cutOfTime == cutOfTime) &&
            const DeepCollectionEquality().equals(other._zones, _zones));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      regionId,
      name,
      isActive,
      hasSameDayDelivery,
      hasSameDayShipping,
      cutOfTime,
      const DeepCollectionEquality().hash(_zones));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegionCopyWith<_$_Region> get copyWith =>
      __$$_RegionCopyWithImpl<_$_Region>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegionToJson(
      this,
    );
  }
}

abstract class _Region implements Region {
  const factory _Region(
      {@JsonKey(name: "_id") final String? regionId,
      final String? name,
      final bool? isActive,
      final bool? hasSameDayDelivery,
      final bool? hasSameDayShipping,
      final String? cutOfTime,
      final List<Zone>? zones}) = _$_Region;

  factory _Region.fromJson(Map<String, dynamic> json) = _$_Region.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get regionId;
  @override
  String? get name;
  @override
  bool? get isActive;
  @override
  bool? get hasSameDayDelivery;
  @override
  bool? get hasSameDayShipping;
  @override
  String? get cutOfTime;
  @override
  List<Zone>? get zones;
  @override
  @JsonKey(ignore: true)
  _$$_RegionCopyWith<_$_Region> get copyWith =>
      throw _privateConstructorUsedError;
}
