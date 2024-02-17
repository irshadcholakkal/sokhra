// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tax.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tax _$TaxFromJson(Map<String, dynamic> json) {
  return _Tax.fromJson(json);
}

/// @nodoc
mixin _$Tax {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  String? get hsnCode => throw _privateConstructorUsedError;
  String? get hsnTaxCode => throw _privateConstructorUsedError;
  List<TaxDetails>? get tax => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaxCopyWith<Tax> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaxCopyWith<$Res> {
  factory $TaxCopyWith(Tax value, $Res Function(Tax) then) =
      _$TaxCopyWithImpl<$Res, Tax>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      String? hsnCode,
      String? hsnTaxCode,
      List<TaxDetails>? tax});
}

/// @nodoc
class _$TaxCopyWithImpl<$Res, $Val extends Tax> implements $TaxCopyWith<$Res> {
  _$TaxCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? hsnCode = freezed,
    Object? hsnTaxCode = freezed,
    Object? tax = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      hsnCode: freezed == hsnCode
          ? _value.hsnCode
          : hsnCode // ignore: cast_nullable_to_non_nullable
              as String?,
      hsnTaxCode: freezed == hsnTaxCode
          ? _value.hsnTaxCode
          : hsnTaxCode // ignore: cast_nullable_to_non_nullable
              as String?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as List<TaxDetails>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaxCopyWith<$Res> implements $TaxCopyWith<$Res> {
  factory _$$_TaxCopyWith(_$_Tax value, $Res Function(_$_Tax) then) =
      __$$_TaxCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      String? hsnCode,
      String? hsnTaxCode,
      List<TaxDetails>? tax});
}

/// @nodoc
class __$$_TaxCopyWithImpl<$Res> extends _$TaxCopyWithImpl<$Res, _$_Tax>
    implements _$$_TaxCopyWith<$Res> {
  __$$_TaxCopyWithImpl(_$_Tax _value, $Res Function(_$_Tax) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? hsnCode = freezed,
    Object? hsnTaxCode = freezed,
    Object? tax = freezed,
  }) {
    return _then(_$_Tax(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      hsnCode: freezed == hsnCode
          ? _value.hsnCode
          : hsnCode // ignore: cast_nullable_to_non_nullable
              as String?,
      hsnTaxCode: freezed == hsnTaxCode
          ? _value.hsnTaxCode
          : hsnTaxCode // ignore: cast_nullable_to_non_nullable
              as String?,
      tax: freezed == tax
          ? _value._tax
          : tax // ignore: cast_nullable_to_non_nullable
              as List<TaxDetails>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_Tax implements _Tax {
  const _$_Tax(
      {@JsonKey(name: "_id") this.id,
      this.hsnCode,
      this.hsnTaxCode,
      final List<TaxDetails>? tax})
      : _tax = tax;

  factory _$_Tax.fromJson(Map<String, dynamic> json) => _$$_TaxFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  final String? hsnCode;
  @override
  final String? hsnTaxCode;
  final List<TaxDetails>? _tax;
  @override
  List<TaxDetails>? get tax {
    final value = _tax;
    if (value == null) return null;
    if (_tax is EqualUnmodifiableListView) return _tax;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Tax(id: $id, hsnCode: $hsnCode, hsnTaxCode: $hsnTaxCode, tax: $tax)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Tax &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hsnCode, hsnCode) || other.hsnCode == hsnCode) &&
            (identical(other.hsnTaxCode, hsnTaxCode) ||
                other.hsnTaxCode == hsnTaxCode) &&
            const DeepCollectionEquality().equals(other._tax, _tax));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, hsnCode, hsnTaxCode,
      const DeepCollectionEquality().hash(_tax));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaxCopyWith<_$_Tax> get copyWith =>
      __$$_TaxCopyWithImpl<_$_Tax>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaxToJson(
      this,
    );
  }
}

abstract class _Tax implements Tax {
  const factory _Tax(
      {@JsonKey(name: "_id") final String? id,
      final String? hsnCode,
      final String? hsnTaxCode,
      final List<TaxDetails>? tax}) = _$_Tax;

  factory _Tax.fromJson(Map<String, dynamic> json) = _$_Tax.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  String? get hsnCode;
  @override
  String? get hsnTaxCode;
  @override
  List<TaxDetails>? get tax;
  @override
  @JsonKey(ignore: true)
  _$$_TaxCopyWith<_$_Tax> get copyWith => throw _privateConstructorUsedError;
}
