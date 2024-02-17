// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SettingsList _$SettingsListFromJson(Map<String, dynamic> json) {
  return _SettingsList.fromJson(json);
}

/// @nodoc
mixin _$SettingsList {
  @JsonKey(name: "Settings")
  List<Settings>? get settings => throw _privateConstructorUsedError;
  int? get totalCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingsListCopyWith<SettingsList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsListCopyWith<$Res> {
  factory $SettingsListCopyWith(
          SettingsList value, $Res Function(SettingsList) then) =
      _$SettingsListCopyWithImpl<$Res, SettingsList>;
  @useResult
  $Res call(
      {@JsonKey(name: "Settings") List<Settings>? settings, int? totalCount});
}

/// @nodoc
class _$SettingsListCopyWithImpl<$Res, $Val extends SettingsList>
    implements $SettingsListCopyWith<$Res> {
  _$SettingsListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settings = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_value.copyWith(
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as List<Settings>?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingsListCopyWith<$Res>
    implements $SettingsListCopyWith<$Res> {
  factory _$$_SettingsListCopyWith(
          _$_SettingsList value, $Res Function(_$_SettingsList) then) =
      __$$_SettingsListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Settings") List<Settings>? settings, int? totalCount});
}

/// @nodoc
class __$$_SettingsListCopyWithImpl<$Res>
    extends _$SettingsListCopyWithImpl<$Res, _$_SettingsList>
    implements _$$_SettingsListCopyWith<$Res> {
  __$$_SettingsListCopyWithImpl(
      _$_SettingsList _value, $Res Function(_$_SettingsList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settings = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_$_SettingsList(
      settings: freezed == settings
          ? _value._settings
          : settings // ignore: cast_nullable_to_non_nullable
              as List<Settings>?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SettingsList implements _SettingsList {
  const _$_SettingsList(
      {@JsonKey(name: "Settings") final List<Settings>? settings,
      this.totalCount})
      : _settings = settings;

  factory _$_SettingsList.fromJson(Map<String, dynamic> json) =>
      _$$_SettingsListFromJson(json);

  final List<Settings>? _settings;
  @override
  @JsonKey(name: "Settings")
  List<Settings>? get settings {
    final value = _settings;
    if (value == null) return null;
    if (_settings is EqualUnmodifiableListView) return _settings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? totalCount;

  @override
  String toString() {
    return 'SettingsList(settings: $settings, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingsList &&
            const DeepCollectionEquality().equals(other._settings, _settings) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_settings), totalCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingsListCopyWith<_$_SettingsList> get copyWith =>
      __$$_SettingsListCopyWithImpl<_$_SettingsList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SettingsListToJson(
      this,
    );
  }
}

abstract class _SettingsList implements SettingsList {
  const factory _SettingsList(
      {@JsonKey(name: "Settings") final List<Settings>? settings,
      final int? totalCount}) = _$_SettingsList;

  factory _SettingsList.fromJson(Map<String, dynamic> json) =
      _$_SettingsList.fromJson;

  @override
  @JsonKey(name: "Settings")
  List<Settings>? get settings;
  @override
  int? get totalCount;
  @override
  @JsonKey(ignore: true)
  _$$_SettingsListCopyWith<_$_SettingsList> get copyWith =>
      throw _privateConstructorUsedError;
}
