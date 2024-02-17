// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zones.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Zones _$ZonesFromJson(Map<String, dynamic> json) {
  return _Zones.fromJson(json);
}

/// @nodoc
mixin _$Zones {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get zoneName => throw _privateConstructorUsedError;
  String? get zoneNameAr => throw _privateConstructorUsedError;
  String? get zoneNameFr => throw _privateConstructorUsedError;
  List<String>? get pincodes => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonValue([])
  List<Days>? get deliveryDays => throw _privateConstructorUsedError;
  double? get deliveryCharge => throw _privateConstructorUsedError;
  double? get minimumPurchaseAmount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ZonesCopyWith<Zones> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZonesCopyWith<$Res> {
  factory $ZonesCopyWith(Zones value, $Res Function(Zones) then) =
      _$ZonesCopyWithImpl<$Res, Zones>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? zoneName,
      String? zoneNameAr,
      String? zoneNameFr,
      List<String>? pincodes,
      bool? isActive,
      @JsonValue([]) List<Days>? deliveryDays,
      double? deliveryCharge,
      double? minimumPurchaseAmount});
}

/// @nodoc
class _$ZonesCopyWithImpl<$Res, $Val extends Zones>
    implements $ZonesCopyWith<$Res> {
  _$ZonesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? zoneName = freezed,
    Object? zoneNameAr = freezed,
    Object? zoneNameFr = freezed,
    Object? pincodes = freezed,
    Object? isActive = freezed,
    Object? deliveryDays = freezed,
    Object? deliveryCharge = freezed,
    Object? minimumPurchaseAmount = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      zoneName: freezed == zoneName
          ? _value.zoneName
          : zoneName // ignore: cast_nullable_to_non_nullable
              as String?,
      zoneNameAr: freezed == zoneNameAr
          ? _value.zoneNameAr
          : zoneNameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      zoneNameFr: freezed == zoneNameFr
          ? _value.zoneNameFr
          : zoneNameFr // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_ZonesCopyWith<$Res> implements $ZonesCopyWith<$Res> {
  factory _$$_ZonesCopyWith(_$_Zones value, $Res Function(_$_Zones) then) =
      __$$_ZonesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? zoneName,
      String? zoneNameAr,
      String? zoneNameFr,
      List<String>? pincodes,
      bool? isActive,
      @JsonValue([]) List<Days>? deliveryDays,
      double? deliveryCharge,
      double? minimumPurchaseAmount});
}

/// @nodoc
class __$$_ZonesCopyWithImpl<$Res> extends _$ZonesCopyWithImpl<$Res, _$_Zones>
    implements _$$_ZonesCopyWith<$Res> {
  __$$_ZonesCopyWithImpl(_$_Zones _value, $Res Function(_$_Zones) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? zoneName = freezed,
    Object? zoneNameAr = freezed,
    Object? zoneNameFr = freezed,
    Object? pincodes = freezed,
    Object? isActive = freezed,
    Object? deliveryDays = freezed,
    Object? deliveryCharge = freezed,
    Object? minimumPurchaseAmount = freezed,
  }) {
    return _then(_$_Zones(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      zoneName: freezed == zoneName
          ? _value.zoneName
          : zoneName // ignore: cast_nullable_to_non_nullable
              as String?,
      zoneNameAr: freezed == zoneNameAr
          ? _value.zoneNameAr
          : zoneNameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      zoneNameFr: freezed == zoneNameFr
          ? _value.zoneNameFr
          : zoneNameFr // ignore: cast_nullable_to_non_nullable
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
class _$_Zones implements _Zones {
  _$_Zones(
      {@JsonKey(name: '_id') this.id,
      this.zoneName,
      this.zoneNameAr,
      this.zoneNameFr,
      final List<String>? pincodes,
      this.isActive,
      @JsonValue([]) final List<Days>? deliveryDays,
      this.deliveryCharge,
      this.minimumPurchaseAmount})
      : _pincodes = pincodes,
        _deliveryDays = deliveryDays;

  factory _$_Zones.fromJson(Map<String, dynamic> json) =>
      _$$_ZonesFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? zoneName;
  @override
  final String? zoneNameAr;
  @override
  final String? zoneNameFr;
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
    return 'Zones(id: $id, zoneName: $zoneName, zoneNameAr: $zoneNameAr, zoneNameFr: $zoneNameFr, pincodes: $pincodes, isActive: $isActive, deliveryDays: $deliveryDays, deliveryCharge: $deliveryCharge, minimumPurchaseAmount: $minimumPurchaseAmount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Zones &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.zoneName, zoneName) ||
                other.zoneName == zoneName) &&
            (identical(other.zoneNameAr, zoneNameAr) ||
                other.zoneNameAr == zoneNameAr) &&
            (identical(other.zoneNameFr, zoneNameFr) ||
                other.zoneNameFr == zoneNameFr) &&
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
      id,
      zoneName,
      zoneNameAr,
      zoneNameFr,
      const DeepCollectionEquality().hash(_pincodes),
      isActive,
      const DeepCollectionEquality().hash(_deliveryDays),
      deliveryCharge,
      minimumPurchaseAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ZonesCopyWith<_$_Zones> get copyWith =>
      __$$_ZonesCopyWithImpl<_$_Zones>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ZonesToJson(
      this,
    );
  }
}

abstract class _Zones implements Zones {
  factory _Zones(
      {@JsonKey(name: '_id') final String? id,
      final String? zoneName,
      final String? zoneNameAr,
      final String? zoneNameFr,
      final List<String>? pincodes,
      final bool? isActive,
      @JsonValue([]) final List<Days>? deliveryDays,
      final double? deliveryCharge,
      final double? minimumPurchaseAmount}) = _$_Zones;

  factory _Zones.fromJson(Map<String, dynamic> json) = _$_Zones.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get zoneName;
  @override
  String? get zoneNameAr;
  @override
  String? get zoneNameFr;
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
  _$$_ZonesCopyWith<_$_Zones> get copyWith =>
      throw _privateConstructorUsedError;
}
