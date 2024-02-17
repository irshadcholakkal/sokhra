// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tax_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaxDetails _$TaxDetailsFromJson(Map<String, dynamic> json) {
  return _TaxDetails.fromJson(json);
}

/// @nodoc
mixin _$TaxDetails {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  double? get percentage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaxDetailsCopyWith<TaxDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaxDetailsCopyWith<$Res> {
  factory $TaxDetailsCopyWith(
          TaxDetails value, $Res Function(TaxDetails) then) =
      _$TaxDetailsCopyWithImpl<$Res, TaxDetails>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id, String? name, double? percentage});
}

/// @nodoc
class _$TaxDetailsCopyWithImpl<$Res, $Val extends TaxDetails>
    implements $TaxDetailsCopyWith<$Res> {
  _$TaxDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? percentage = freezed,
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
      percentage: freezed == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaxDetailsCopyWith<$Res>
    implements $TaxDetailsCopyWith<$Res> {
  factory _$$_TaxDetailsCopyWith(
          _$_TaxDetails value, $Res Function(_$_TaxDetails) then) =
      __$$_TaxDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id, String? name, double? percentage});
}

/// @nodoc
class __$$_TaxDetailsCopyWithImpl<$Res>
    extends _$TaxDetailsCopyWithImpl<$Res, _$_TaxDetails>
    implements _$$_TaxDetailsCopyWith<$Res> {
  __$$_TaxDetailsCopyWithImpl(
      _$_TaxDetails _value, $Res Function(_$_TaxDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? percentage = freezed,
  }) {
    return _then(_$_TaxDetails(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      percentage: freezed == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_TaxDetails implements _TaxDetails {
  const _$_TaxDetails(
      {@JsonKey(name: "_id") this.id, this.name, this.percentage});

  factory _$_TaxDetails.fromJson(Map<String, dynamic> json) =>
      _$$_TaxDetailsFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  final String? name;
  @override
  final double? percentage;

  @override
  String toString() {
    return 'TaxDetails(id: $id, name: $name, percentage: $percentage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaxDetails &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, percentage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaxDetailsCopyWith<_$_TaxDetails> get copyWith =>
      __$$_TaxDetailsCopyWithImpl<_$_TaxDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaxDetailsToJson(
      this,
    );
  }
}

abstract class _TaxDetails implements TaxDetails {
  const factory _TaxDetails(
      {@JsonKey(name: "_id") final String? id,
      final String? name,
      final double? percentage}) = _$_TaxDetails;

  factory _TaxDetails.fromJson(Map<String, dynamic> json) =
      _$_TaxDetails.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  String? get name;
  @override
  double? get percentage;
  @override
  @JsonKey(ignore: true)
  _$$_TaxDetailsCopyWith<_$_TaxDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
