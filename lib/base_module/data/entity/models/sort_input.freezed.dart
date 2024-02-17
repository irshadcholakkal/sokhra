// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sort_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SortInput _$SortInputFromJson(Map<String, dynamic> json) {
  return _SortInput.fromJson(json);
}

/// @nodoc
mixin _$SortInput {
  SortType? get price => throw _privateConstructorUsedError;
  SortType? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SortInputCopyWith<SortInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SortInputCopyWith<$Res> {
  factory $SortInputCopyWith(SortInput value, $Res Function(SortInput) then) =
      _$SortInputCopyWithImpl<$Res, SortInput>;
  @useResult
  $Res call({SortType? price, SortType? createdAt});
}

/// @nodoc
class _$SortInputCopyWithImpl<$Res, $Val extends SortInput>
    implements $SortInputCopyWith<$Res> {
  _$SortInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as SortType?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as SortType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SortInputCopyWith<$Res> implements $SortInputCopyWith<$Res> {
  factory _$$_SortInputCopyWith(
          _$_SortInput value, $Res Function(_$_SortInput) then) =
      __$$_SortInputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SortType? price, SortType? createdAt});
}

/// @nodoc
class __$$_SortInputCopyWithImpl<$Res>
    extends _$SortInputCopyWithImpl<$Res, _$_SortInput>
    implements _$$_SortInputCopyWith<$Res> {
  __$$_SortInputCopyWithImpl(
      _$_SortInput _value, $Res Function(_$_SortInput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_SortInput(
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as SortType?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as SortType?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_SortInput implements _SortInput {
  const _$_SortInput({this.price, this.createdAt});

  factory _$_SortInput.fromJson(Map<String, dynamic> json) =>
      _$$_SortInputFromJson(json);

  @override
  final SortType? price;
  @override
  final SortType? createdAt;

  @override
  String toString() {
    return 'SortInput(price: $price, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SortInput &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, price, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SortInputCopyWith<_$_SortInput> get copyWith =>
      __$$_SortInputCopyWithImpl<_$_SortInput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SortInputToJson(
      this,
    );
  }
}

abstract class _SortInput implements SortInput {
  const factory _SortInput({final SortType? price, final SortType? createdAt}) =
      _$_SortInput;

  factory _SortInput.fromJson(Map<String, dynamic> json) =
      _$_SortInput.fromJson;

  @override
  SortType? get price;
  @override
  SortType? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_SortInputCopyWith<_$_SortInput> get copyWith =>
      throw _privateConstructorUsedError;
}
