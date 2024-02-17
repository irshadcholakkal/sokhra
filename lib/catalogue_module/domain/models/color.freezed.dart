// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'color.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Color _$ColorFromJson(Map<String, dynamic> json) {
  return _Color.fromJson(json);
}

/// @nodoc
mixin _$Color {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ColorCopyWith<Color> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorCopyWith<$Res> {
  factory $ColorCopyWith(Color value, $Res Function(Color) then) =
      _$ColorCopyWithImpl<$Res, Color>;
  @useResult
  $Res call({@JsonKey(name: "_id") String? id, String? name, String? code});
}

/// @nodoc
class _$ColorCopyWithImpl<$Res, $Val extends Color>
    implements $ColorCopyWith<$Res> {
  _$ColorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ColorCopyWith<$Res> implements $ColorCopyWith<$Res> {
  factory _$$_ColorCopyWith(_$_Color value, $Res Function(_$_Color) then) =
      __$$_ColorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "_id") String? id, String? name, String? code});
}

/// @nodoc
class __$$_ColorCopyWithImpl<$Res> extends _$ColorCopyWithImpl<$Res, _$_Color>
    implements _$$_ColorCopyWith<$Res> {
  __$$_ColorCopyWithImpl(_$_Color _value, $Res Function(_$_Color) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? code = freezed,
  }) {
    return _then(_$_Color(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_Color implements _Color {
  const _$_Color({@JsonKey(name: "_id") this.id, this.name, this.code});

  factory _$_Color.fromJson(Map<String, dynamic> json) =>
      _$$_ColorFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  final String? name;
  @override
  final String? code;

  @override
  String toString() {
    return 'Color(id: $id, name: $name, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Color &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ColorCopyWith<_$_Color> get copyWith =>
      __$$_ColorCopyWithImpl<_$_Color>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ColorToJson(
      this,
    );
  }
}

abstract class _Color implements Color {
  const factory _Color(
      {@JsonKey(name: "_id") final String? id,
      final String? name,
      final String? code}) = _$_Color;

  factory _Color.fromJson(Map<String, dynamic> json) = _$_Color.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  String? get name;
  @override
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$_ColorCopyWith<_$_Color> get copyWith =>
      throw _privateConstructorUsedError;
}
