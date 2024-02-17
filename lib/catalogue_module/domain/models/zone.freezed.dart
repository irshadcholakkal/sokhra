// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zone.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Zone _$ZoneFromJson(Map<String, dynamic> json) {
  return _Zone.fromJson(json);
}

/// @nodoc
mixin _$Zone {
  @JsonKey(name: "_id")
  String? get zoneId => throw _privateConstructorUsedError;
  String? get zoneName => throw _privateConstructorUsedError;
  List<String>? get pincodes => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonValue([])
  List<Days>? get deliveryDays => throw _privateConstructorUsedError;
  double? get deliveryCharge => throw _privateConstructorUsedError;
  double? get minimumPurchaseAmount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ZoneCopyWith<Zone> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZoneCopyWith<$Res> {
  factory $ZoneCopyWith(Zone value, $Res Function(Zone) then) =
      _$ZoneCopyWithImpl<$Res, Zone>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? zoneId,
      String? zoneName,
      List<String>? pincodes,
      bool? isActive,
      @JsonValue([]) List<Days>? deliveryDays,
      double? deliveryCharge,
      double? minimumPurchaseAmount});
}

/// @nodoc
class _$ZoneCopyWithImpl<$Res, $Val extends Zone>
    implements $ZoneCopyWith<$Res> {
  _$ZoneCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zoneId = freezed,
    Object? zoneName = freezed,
    Object? pincodes = freezed,
    Object? isActive = freezed,
    Object? deliveryDays = freezed,
    Object? deliveryCharge = freezed,
    Object? minimumPurchaseAmount = freezed,
  }) {
    return _then(_value.copyWith(
      zoneId: freezed == zoneId
          ? _value.zoneId
          : zoneId // ignore: cast_nullable_to_non_nullable
              as String?,
      zoneName: freezed == zoneName
          ? _value.zoneName
          : zoneName // ignore: cast_nullable_to_non_nullable
              as String?,
      pincodes: freezed == pincodes
          ? _value.pincodes
          : pincodes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      deliveryDays: freezed == deliveryDays
          ? _value.deliveryDays
          : deliveryDays // ignore: cast_nullable_to_non_nullable
              as List<Days>?,
      deliveryCharge: freezed == deliveryCharge
          ? _value.deliveryCharge
          : deliveryCharge // ignore: cast_nullable_to_non_nullable
              as double?,
      minimumPurchaseAmount: freezed == minimumPurchaseAmount
          ? _value.minimumPurchaseAmount
          : minimumPurchaseAmount // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ZoneCopyWith<$Res> implements $ZoneCopyWith<$Res> {
  factory _$$_ZoneCopyWith(_$_Zone value, $Res Function(_$_Zone) then) =
      __$$_ZoneCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? zoneId,
      String? zoneName,
      List<String>? pincodes,
      bool? isActive,
      @JsonValue([]) List<Days>? deliveryDays,
      double? deliveryCharge,
      double? minimumPurchaseAmount});
}

/// @nodoc
class __$$_ZoneCopyWithImpl<$Res> extends _$ZoneCopyWithImpl<$Res, _$_Zone>
    implements _$$_ZoneCopyWith<$Res> {
  __$$_ZoneCopyWithImpl(_$_Zone _value, $Res Function(_$_Zone) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zoneId = freezed,
    Object? zoneName = freezed,
    Object? pincodes = freezed,
    Object? isActive = freezed,
    Object? deliveryDays = freezed,
    Object? deliveryCharge = freezed,
    Object? minimumPurchaseAmount = freezed,
  }) {
    return _then(_$_Zone(
      zoneId: freezed == zoneId
          ? _value.zoneId
          : zoneId // ignore: cast_nullable_to_non_nullable
              as String?,
      zoneName: freezed == zoneName
          ? _value.zoneName
          : zoneName // ignore: cast_nullable_to_non_nullable
              as String?,
      pincodes: freezed == pincodes
          ? _value._pincodes
          : pincodes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      deliveryDays: freezed == deliveryDays
          ? _value._deliveryDays
          : deliveryDays // ignore: cast_nullable_to_non_nullable
              as List<Days>?,
      deliveryCharge: freezed == deliveryCharge
          ? _value.deliveryCharge
          : deliveryCharge // ignore: cast_nullable_to_non_nullable
              as double?,
      minimumPurchaseAmount: freezed == minimumPurchaseAmount
          ? _value.minimumPurchaseAmount
          : minimumPurchaseAmount // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_Zone implements _Zone {
  const _$_Zone(
      {@JsonKey(name: "_id") this.zoneId,
      this.zoneName,
      final List<String>? pincodes,
      this.isActive,
      @JsonValue([]) final List<Days>? deliveryDays,
      this.deliveryCharge,
      this.minimumPurchaseAmount})
      : _pincodes = pincodes,
        _deliveryDays = deliveryDays;

  factory _$_Zone.fromJson(Map<String, dynamic> json) => _$$_ZoneFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? zoneId;
  @override
  final String? zoneName;
  final List<String>? _pincodes;
  @override
  List<String>? get pincodes {
    final value = _pincodes;
    if (value == null) return null;
    if (_pincodes is EqualUnmodifiableListView) return _pincodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isActive;
  final List<Days>? _deliveryDays;
  @override
  @JsonValue([])
  List<Days>? get deliveryDays {
    final value = _deliveryDays;
    if (value == null) return null;
    if (_deliveryDays is EqualUnmodifiableListView) return _deliveryDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? deliveryCharge;
  @override
  final double? minimumPurchaseAmount;

  @override
  String toString() {
    return 'Zone(zoneId: $zoneId, zoneName: $zoneName, pincodes: $pincodes, isActive: $isActive, deliveryDays: $deliveryDays, deliveryCharge: $deliveryCharge, minimumPurchaseAmount: $minimumPurchaseAmount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Zone &&
            (identical(other.zoneId, zoneId) || other.zoneId == zoneId) &&
            (identical(other.zoneName, zoneName) ||
                other.zoneName == zoneName) &&
            const DeepCollectionEquality().equals(other._pincodes, _pincodes) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality()
                .equals(other._deliveryDays, _deliveryDays) &&
            (identical(other.deliveryCharge, deliveryCharge) ||
                other.deliveryCharge == deliveryCharge) &&
            (identical(other.minimumPurchaseAmount, minimumPurchaseAmount) ||
                other.minimumPurchaseAmount == minimumPurchaseAmount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      zoneId,
      zoneName,
      const DeepCollectionEquality().hash(_pincodes),
      isActive,
      const DeepCollectionEquality().hash(_deliveryDays),
      deliveryCharge,
      minimumPurchaseAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ZoneCopyWith<_$_Zone> get copyWith =>
      __$$_ZoneCopyWithImpl<_$_Zone>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ZoneToJson(
      this,
    );
  }
}

abstract class _Zone implements Zone {
  const factory _Zone(
      {@JsonKey(name: "_id") final String? zoneId,
      final String? zoneName,
      final List<String>? pincodes,
      final bool? isActive,
      @JsonValue([]) final List<Days>? deliveryDays,
      final double? deliveryCharge,
      final double? minimumPurchaseAmount}) = _$_Zone;

  factory _Zone.fromJson(Map<String, dynamic> json) = _$_Zone.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get zoneId;
  @override
  String? get zoneName;
  @override
  List<String>? get pincodes;
  @override
  bool? get isActive;
  @override
  @JsonValue([])
  List<Days>? get deliveryDays;
  @override
  double? get deliveryCharge;
  @override
  double? get minimumPurchaseAmount;
  @override
  @JsonKey(ignore: true)
  _$$_ZoneCopyWith<_$_Zone> get copyWith => throw _privateConstructorUsedError;
}
