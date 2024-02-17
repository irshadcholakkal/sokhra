// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'area_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AreaInfo _$AreaInfoFromJson(Map<String, dynamic> json) {
  return _AreaInfo.fromJson(json);
}

/// @nodoc
mixin _$AreaInfo {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get nameEn => throw _privateConstructorUsedError;
  String? get nameAr => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [])
  List<ZoneInfo>? get zones => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AreaInfoCopyWith<AreaInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AreaInfoCopyWith<$Res> {
  factory $AreaInfoCopyWith(AreaInfo value, $Res Function(AreaInfo) then) =
      _$AreaInfoCopyWithImpl<$Res, AreaInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? nameEn,
      String? nameAr,
      @JsonKey(defaultValue: []) List<ZoneInfo>? zones});
}

/// @nodoc
class _$AreaInfoCopyWithImpl<$Res, $Val extends AreaInfo>
    implements $AreaInfoCopyWith<$Res> {
  _$AreaInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nameEn = freezed,
    Object? nameAr = freezed,
    Object? zones = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEn: freezed == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      nameAr: freezed == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      zones: freezed == zones
          ? _value.zones
          : zones // ignore: cast_nullable_to_non_nullable
              as List<ZoneInfo>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AreaInfoCopyWith<$Res> implements $AreaInfoCopyWith<$Res> {
  factory _$$_AreaInfoCopyWith(
          _$_AreaInfo value, $Res Function(_$_AreaInfo) then) =
      __$$_AreaInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? nameEn,
      String? nameAr,
      @JsonKey(defaultValue: []) List<ZoneInfo>? zones});
}

/// @nodoc
class __$$_AreaInfoCopyWithImpl<$Res>
    extends _$AreaInfoCopyWithImpl<$Res, _$_AreaInfo>
    implements _$$_AreaInfoCopyWith<$Res> {
  __$$_AreaInfoCopyWithImpl(
      _$_AreaInfo _value, $Res Function(_$_AreaInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nameEn = freezed,
    Object? nameAr = freezed,
    Object? zones = freezed,
  }) {
    return _then(_$_AreaInfo(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEn: freezed == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      nameAr: freezed == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      zones: freezed == zones
          ? _value._zones
          : zones // ignore: cast_nullable_to_non_nullable
              as List<ZoneInfo>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_AreaInfo implements _AreaInfo {
  const _$_AreaInfo(
      {@JsonKey(name: '_id') this.id,
      this.nameEn,
      this.nameAr,
      @JsonKey(defaultValue: []) final List<ZoneInfo>? zones})
      : _zones = zones;

  factory _$_AreaInfo.fromJson(Map<String, dynamic> json) =>
      _$$_AreaInfoFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? nameEn;
  @override
  final String? nameAr;
  final List<ZoneInfo>? _zones;
  @override
  @JsonKey(defaultValue: [])
  List<ZoneInfo>? get zones {
    final value = _zones;
    if (value == null) return null;
    if (_zones is EqualUnmodifiableListView) return _zones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AreaInfo(id: $id, nameEn: $nameEn, nameAr: $nameAr, zones: $zones)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AreaInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.nameAr, nameAr) || other.nameAr == nameAr) &&
            const DeepCollectionEquality().equals(other._zones, _zones));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, nameEn, nameAr,
      const DeepCollectionEquality().hash(_zones));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AreaInfoCopyWith<_$_AreaInfo> get copyWith =>
      __$$_AreaInfoCopyWithImpl<_$_AreaInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AreaInfoToJson(
      this,
    );
  }
}

abstract class _AreaInfo implements AreaInfo {
  const factory _AreaInfo(
      {@JsonKey(name: '_id') final String? id,
      final String? nameEn,
      final String? nameAr,
      @JsonKey(defaultValue: []) final List<ZoneInfo>? zones}) = _$_AreaInfo;

  factory _AreaInfo.fromJson(Map<String, dynamic> json) = _$_AreaInfo.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get nameEn;
  @override
  String? get nameAr;
  @override
  @JsonKey(defaultValue: [])
  List<ZoneInfo>? get zones;
  @override
  @JsonKey(ignore: true)
  _$$_AreaInfoCopyWith<_$_AreaInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
