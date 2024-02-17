// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'date_time_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DateTimeInfo _$DateTimeInfoFromJson(Map<String, dynamic> json) {
  return _DateTimeInfo.fromJson(json);
}

/// @nodoc
mixin _$DateTimeInfo {
  String? get utcDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DateTimeInfoCopyWith<DateTimeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateTimeInfoCopyWith<$Res> {
  factory $DateTimeInfoCopyWith(
          DateTimeInfo value, $Res Function(DateTimeInfo) then) =
      _$DateTimeInfoCopyWithImpl<$Res, DateTimeInfo>;
  @useResult
  $Res call({String? utcDateTime});
}

/// @nodoc
class _$DateTimeInfoCopyWithImpl<$Res, $Val extends DateTimeInfo>
    implements $DateTimeInfoCopyWith<$Res> {
  _$DateTimeInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? utcDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      utcDateTime: freezed == utcDateTime
          ? _value.utcDateTime
          : utcDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DateTimeInfoCopyWith<$Res>
    implements $DateTimeInfoCopyWith<$Res> {
  factory _$$_DateTimeInfoCopyWith(
          _$_DateTimeInfo value, $Res Function(_$_DateTimeInfo) then) =
      __$$_DateTimeInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? utcDateTime});
}

/// @nodoc
class __$$_DateTimeInfoCopyWithImpl<$Res>
    extends _$DateTimeInfoCopyWithImpl<$Res, _$_DateTimeInfo>
    implements _$$_DateTimeInfoCopyWith<$Res> {
  __$$_DateTimeInfoCopyWithImpl(
      _$_DateTimeInfo _value, $Res Function(_$_DateTimeInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? utcDateTime = freezed,
  }) {
    return _then(_$_DateTimeInfo(
      utcDateTime: freezed == utcDateTime
          ? _value.utcDateTime
          : utcDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_DateTimeInfo implements _DateTimeInfo {
  const _$_DateTimeInfo({this.utcDateTime});

  factory _$_DateTimeInfo.fromJson(Map<String, dynamic> json) =>
      _$$_DateTimeInfoFromJson(json);

  @override
  final String? utcDateTime;

  @override
  String toString() {
    return 'DateTimeInfo(utcDateTime: $utcDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DateTimeInfo &&
            (identical(other.utcDateTime, utcDateTime) ||
                other.utcDateTime == utcDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, utcDateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DateTimeInfoCopyWith<_$_DateTimeInfo> get copyWith =>
      __$$_DateTimeInfoCopyWithImpl<_$_DateTimeInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DateTimeInfoToJson(
      this,
    );
  }
}

abstract class _DateTimeInfo implements DateTimeInfo {
  const factory _DateTimeInfo({final String? utcDateTime}) = _$_DateTimeInfo;

  factory _DateTimeInfo.fromJson(Map<String, dynamic> json) =
      _$_DateTimeInfo.fromJson;

  @override
  String? get utcDateTime;
  @override
  @JsonKey(ignore: true)
  _$$_DateTimeInfoCopyWith<_$_DateTimeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
