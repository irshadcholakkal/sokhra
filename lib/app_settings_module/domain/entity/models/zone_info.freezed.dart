// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zone_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ZoneInfo _$ZoneInfoFromJson(Map<String, dynamic> json) {
  return _ZoneInfo.fromJson(json);
}

/// @nodoc
mixin _$ZoneInfo {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get nameEn => throw _privateConstructorUsedError;
  String? get nameAr => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ZoneInfoCopyWith<ZoneInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZoneInfoCopyWith<$Res> {
  factory $ZoneInfoCopyWith(ZoneInfo value, $Res Function(ZoneInfo) then) =
      _$ZoneInfoCopyWithImpl<$Res, ZoneInfo>;
  @useResult
  $Res call({@JsonKey(name: '_id') String? id, String? nameEn, String? nameAr});
}

/// @nodoc
class _$ZoneInfoCopyWithImpl<$Res, $Val extends ZoneInfo>
    implements $ZoneInfoCopyWith<$Res> {
  _$ZoneInfoCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ZoneInfoCopyWith<$Res> implements $ZoneInfoCopyWith<$Res> {
  factory _$$_ZoneInfoCopyWith(
          _$_ZoneInfo value, $Res Function(_$_ZoneInfo) then) =
      __$$_ZoneInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: '_id') String? id, String? nameEn, String? nameAr});
}

/// @nodoc
class __$$_ZoneInfoCopyWithImpl<$Res>
    extends _$ZoneInfoCopyWithImpl<$Res, _$_ZoneInfo>
    implements _$$_ZoneInfoCopyWith<$Res> {
  __$$_ZoneInfoCopyWithImpl(
      _$_ZoneInfo _value, $Res Function(_$_ZoneInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nameEn = freezed,
    Object? nameAr = freezed,
  }) {
    return _then(_$_ZoneInfo(
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
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_ZoneInfo implements _ZoneInfo {
  const _$_ZoneInfo({@JsonKey(name: '_id') this.id, this.nameEn, this.nameAr});

  factory _$_ZoneInfo.fromJson(Map<String, dynamic> json) =>
      _$$_ZoneInfoFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? nameEn;
  @override
  final String? nameAr;

  @override
  String toString() {
    return 'ZoneInfo(id: $id, nameEn: $nameEn, nameAr: $nameAr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ZoneInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.nameAr, nameAr) || other.nameAr == nameAr));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, nameEn, nameAr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ZoneInfoCopyWith<_$_ZoneInfo> get copyWith =>
      __$$_ZoneInfoCopyWithImpl<_$_ZoneInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ZoneInfoToJson(
      this,
    );
  }
}

abstract class _ZoneInfo implements ZoneInfo {
  const factory _ZoneInfo(
      {@JsonKey(name: '_id') final String? id,
      final String? nameEn,
      final String? nameAr}) = _$_ZoneInfo;

  factory _ZoneInfo.fromJson(Map<String, dynamic> json) = _$_ZoneInfo.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get nameEn;
  @override
  String? get nameAr;
  @override
  @JsonKey(ignore: true)
  _$$_ZoneInfoCopyWith<_$_ZoneInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
