// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Settings _$SettingsFromJson(Map<String, dynamic> json) {
  return _Settings.fromJson(json);
}

/// @nodoc
mixin _$Settings {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  WhatsappConfig? get whatsappSettings => throw _privateConstructorUsedError;
  AppVersion? get appVersion => throw _privateConstructorUsedError;
  String? get defaultPincode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingsCopyWith<Settings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsCopyWith<$Res> {
  factory $SettingsCopyWith(Settings value, $Res Function(Settings) then) =
      _$SettingsCopyWithImpl<$Res, Settings>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      WhatsappConfig? whatsappSettings,
      AppVersion? appVersion,
      String? defaultPincode});

  $WhatsappConfigCopyWith<$Res>? get whatsappSettings;
  $AppVersionCopyWith<$Res>? get appVersion;
}

/// @nodoc
class _$SettingsCopyWithImpl<$Res, $Val extends Settings>
    implements $SettingsCopyWith<$Res> {
  _$SettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? whatsappSettings = freezed,
    Object? appVersion = freezed,
    Object? defaultPincode = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      whatsappSettings: freezed == whatsappSettings
          ? _value.whatsappSettings
          : whatsappSettings // ignore: cast_nullable_to_non_nullable
              as WhatsappConfig?,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as AppVersion?,
      defaultPincode: freezed == defaultPincode
          ? _value.defaultPincode
          : defaultPincode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WhatsappConfigCopyWith<$Res>? get whatsappSettings {
    if (_value.whatsappSettings == null) {
      return null;
    }

    return $WhatsappConfigCopyWith<$Res>(_value.whatsappSettings!, (value) {
      return _then(_value.copyWith(whatsappSettings: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AppVersionCopyWith<$Res>? get appVersion {
    if (_value.appVersion == null) {
      return null;
    }

    return $AppVersionCopyWith<$Res>(_value.appVersion!, (value) {
      return _then(_value.copyWith(appVersion: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SettingsCopyWith<$Res> implements $SettingsCopyWith<$Res> {
  factory _$$_SettingsCopyWith(
          _$_Settings value, $Res Function(_$_Settings) then) =
      __$$_SettingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      WhatsappConfig? whatsappSettings,
      AppVersion? appVersion,
      String? defaultPincode});

  @override
  $WhatsappConfigCopyWith<$Res>? get whatsappSettings;
  @override
  $AppVersionCopyWith<$Res>? get appVersion;
}

/// @nodoc
class __$$_SettingsCopyWithImpl<$Res>
    extends _$SettingsCopyWithImpl<$Res, _$_Settings>
    implements _$$_SettingsCopyWith<$Res> {
  __$$_SettingsCopyWithImpl(
      _$_Settings _value, $Res Function(_$_Settings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? whatsappSettings = freezed,
    Object? appVersion = freezed,
    Object? defaultPincode = freezed,
  }) {
    return _then(_$_Settings(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      whatsappSettings: freezed == whatsappSettings
          ? _value.whatsappSettings
          : whatsappSettings // ignore: cast_nullable_to_non_nullable
              as WhatsappConfig?,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as AppVersion?,
      defaultPincode: freezed == defaultPincode
          ? _value.defaultPincode
          : defaultPincode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Settings implements _Settings {
  const _$_Settings(
      {@JsonKey(name: "_id") this.id,
      this.whatsappSettings,
      this.appVersion,
      this.defaultPincode});

  factory _$_Settings.fromJson(Map<String, dynamic> json) =>
      _$$_SettingsFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  final WhatsappConfig? whatsappSettings;
  @override
  final AppVersion? appVersion;
  @override
  final String? defaultPincode;

  @override
  String toString() {
    return 'Settings(id: $id, whatsappSettings: $whatsappSettings, appVersion: $appVersion, defaultPincode: $defaultPincode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Settings &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.whatsappSettings, whatsappSettings) ||
                other.whatsappSettings == whatsappSettings) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.defaultPincode, defaultPincode) ||
                other.defaultPincode == defaultPincode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, whatsappSettings, appVersion, defaultPincode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingsCopyWith<_$_Settings> get copyWith =>
      __$$_SettingsCopyWithImpl<_$_Settings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SettingsToJson(
      this,
    );
  }
}

abstract class _Settings implements Settings {
  const factory _Settings(
      {@JsonKey(name: "_id") final String? id,
      final WhatsappConfig? whatsappSettings,
      final AppVersion? appVersion,
      final String? defaultPincode}) = _$_Settings;

  factory _Settings.fromJson(Map<String, dynamic> json) = _$_Settings.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  WhatsappConfig? get whatsappSettings;
  @override
  AppVersion? get appVersion;
  @override
  String? get defaultPincode;
  @override
  @JsonKey(ignore: true)
  _$$_SettingsCopyWith<_$_Settings> get copyWith =>
      throw _privateConstructorUsedError;
}
