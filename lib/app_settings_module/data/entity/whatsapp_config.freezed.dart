// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'whatsapp_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WhatsappConfig _$WhatsappConfigFromJson(Map<String, dynamic> json) {
  return _WhatsappConfig.fromJson(json);
}

/// @nodoc
mixin _$WhatsappConfig {
  String? get number => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WhatsappConfigCopyWith<WhatsappConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WhatsappConfigCopyWith<$Res> {
  factory $WhatsappConfigCopyWith(
          WhatsappConfig value, $Res Function(WhatsappConfig) then) =
      _$WhatsappConfigCopyWithImpl<$Res, WhatsappConfig>;
  @useResult
  $Res call({String? number, String? message});
}

/// @nodoc
class _$WhatsappConfigCopyWithImpl<$Res, $Val extends WhatsappConfig>
    implements $WhatsappConfigCopyWith<$Res> {
  _$WhatsappConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WhatsappConfigCopyWith<$Res>
    implements $WhatsappConfigCopyWith<$Res> {
  factory _$$_WhatsappConfigCopyWith(
          _$_WhatsappConfig value, $Res Function(_$_WhatsappConfig) then) =
      __$$_WhatsappConfigCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? number, String? message});
}

/// @nodoc
class __$$_WhatsappConfigCopyWithImpl<$Res>
    extends _$WhatsappConfigCopyWithImpl<$Res, _$_WhatsappConfig>
    implements _$$_WhatsappConfigCopyWith<$Res> {
  __$$_WhatsappConfigCopyWithImpl(
      _$_WhatsappConfig _value, $Res Function(_$_WhatsappConfig) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_WhatsappConfig(
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WhatsappConfig implements _WhatsappConfig {
  const _$_WhatsappConfig({this.number, this.message});

  factory _$_WhatsappConfig.fromJson(Map<String, dynamic> json) =>
      _$$_WhatsappConfigFromJson(json);

  @override
  final String? number;
  @override
  final String? message;

  @override
  String toString() {
    return 'WhatsappConfig(number: $number, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WhatsappConfig &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, number, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WhatsappConfigCopyWith<_$_WhatsappConfig> get copyWith =>
      __$$_WhatsappConfigCopyWithImpl<_$_WhatsappConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WhatsappConfigToJson(
      this,
    );
  }
}

abstract class _WhatsappConfig implements WhatsappConfig {
  const factory _WhatsappConfig({final String? number, final String? message}) =
      _$_WhatsappConfig;

  factory _WhatsappConfig.fromJson(Map<String, dynamic> json) =
      _$_WhatsappConfig.fromJson;

  @override
  String? get number;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_WhatsappConfigCopyWith<_$_WhatsappConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
