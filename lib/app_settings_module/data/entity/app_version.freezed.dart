// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_version.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppVersion _$AppVersionFromJson(Map<String, dynamic> json) {
  return _AppVersion.fromJson(json);
}

/// @nodoc
mixin _$AppVersion {
  String? get version => throw _privateConstructorUsedError;
  bool? get isUpdateRequired => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppVersionCopyWith<AppVersion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppVersionCopyWith<$Res> {
  factory $AppVersionCopyWith(
          AppVersion value, $Res Function(AppVersion) then) =
      _$AppVersionCopyWithImpl<$Res, AppVersion>;
  @useResult
  $Res call({String? version, bool? isUpdateRequired});
}

/// @nodoc
class _$AppVersionCopyWithImpl<$Res, $Val extends AppVersion>
    implements $AppVersionCopyWith<$Res> {
  _$AppVersionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = freezed,
    Object? isUpdateRequired = freezed,
  }) {
    return _then(_value.copyWith(
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      isUpdateRequired: freezed == isUpdateRequired
          ? _value.isUpdateRequired
          : isUpdateRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppVersionCopyWith<$Res>
    implements $AppVersionCopyWith<$Res> {
  factory _$$_AppVersionCopyWith(
          _$_AppVersion value, $Res Function(_$_AppVersion) then) =
      __$$_AppVersionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? version, bool? isUpdateRequired});
}

/// @nodoc
class __$$_AppVersionCopyWithImpl<$Res>
    extends _$AppVersionCopyWithImpl<$Res, _$_AppVersion>
    implements _$$_AppVersionCopyWith<$Res> {
  __$$_AppVersionCopyWithImpl(
      _$_AppVersion _value, $Res Function(_$_AppVersion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = freezed,
    Object? isUpdateRequired = freezed,
  }) {
    return _then(_$_AppVersion(
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      isUpdateRequired: freezed == isUpdateRequired
          ? _value.isUpdateRequired
          : isUpdateRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppVersion implements _AppVersion {
  const _$_AppVersion({this.version, this.isUpdateRequired});

  factory _$_AppVersion.fromJson(Map<String, dynamic> json) =>
      _$$_AppVersionFromJson(json);

  @override
  final String? version;
  @override
  final bool? isUpdateRequired;

  @override
  String toString() {
    return 'AppVersion(version: $version, isUpdateRequired: $isUpdateRequired)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppVersion &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.isUpdateRequired, isUpdateRequired) ||
                other.isUpdateRequired == isUpdateRequired));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, version, isUpdateRequired);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppVersionCopyWith<_$_AppVersion> get copyWith =>
      __$$_AppVersionCopyWithImpl<_$_AppVersion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppVersionToJson(
      this,
    );
  }
}

abstract class _AppVersion implements AppVersion {
  const factory _AppVersion(
      {final String? version, final bool? isUpdateRequired}) = _$_AppVersion;

  factory _AppVersion.fromJson(Map<String, dynamic> json) =
      _$_AppVersion.fromJson;

  @override
  String? get version;
  @override
  bool? get isUpdateRequired;
  @override
  @JsonKey(ignore: true)
  _$$_AppVersionCopyWith<_$_AppVersion> get copyWith =>
      throw _privateConstructorUsedError;
}
