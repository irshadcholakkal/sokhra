// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wish_list_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WishListInput _$WishListInputFromJson(Map<String, dynamic> json) {
  return _WishListInput.fromJson(json);
}

/// @nodoc
mixin _$WishListInput {
  String? get product => throw _privateConstructorUsedError;
  String? get variant => throw _privateConstructorUsedError;
  String? get deviceId => throw _privateConstructorUsedError;
  String? get pinCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WishListInputCopyWith<WishListInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WishListInputCopyWith<$Res> {
  factory $WishListInputCopyWith(
          WishListInput value, $Res Function(WishListInput) then) =
      _$WishListInputCopyWithImpl<$Res, WishListInput>;
  @useResult
  $Res call(
      {String? product, String? variant, String? deviceId, String? pinCode});
}

/// @nodoc
class _$WishListInputCopyWithImpl<$Res, $Val extends WishListInput>
    implements $WishListInputCopyWith<$Res> {
  _$WishListInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = freezed,
    Object? variant = freezed,
    Object? deviceId = freezed,
    Object? pinCode = freezed,
  }) {
    return _then(_value.copyWith(
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String?,
      variant: freezed == variant
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      pinCode: freezed == pinCode
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WishListInputCopyWith<$Res>
    implements $WishListInputCopyWith<$Res> {
  factory _$$_WishListInputCopyWith(
          _$_WishListInput value, $Res Function(_$_WishListInput) then) =
      __$$_WishListInputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? product, String? variant, String? deviceId, String? pinCode});
}

/// @nodoc
class __$$_WishListInputCopyWithImpl<$Res>
    extends _$WishListInputCopyWithImpl<$Res, _$_WishListInput>
    implements _$$_WishListInputCopyWith<$Res> {
  __$$_WishListInputCopyWithImpl(
      _$_WishListInput _value, $Res Function(_$_WishListInput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = freezed,
    Object? variant = freezed,
    Object? deviceId = freezed,
    Object? pinCode = freezed,
  }) {
    return _then(_$_WishListInput(
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String?,
      variant: freezed == variant
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      pinCode: freezed == pinCode
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_WishListInput implements _WishListInput {
  const _$_WishListInput(
      {this.product, this.variant, this.deviceId, this.pinCode});

  factory _$_WishListInput.fromJson(Map<String, dynamic> json) =>
      _$$_WishListInputFromJson(json);

  @override
  final String? product;
  @override
  final String? variant;
  @override
  final String? deviceId;
  @override
  final String? pinCode;

  @override
  String toString() {
    return 'WishListInput(product: $product, variant: $variant, deviceId: $deviceId, pinCode: $pinCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WishListInput &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.variant, variant) || other.variant == variant) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.pinCode, pinCode) || other.pinCode == pinCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, product, variant, deviceId, pinCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WishListInputCopyWith<_$_WishListInput> get copyWith =>
      __$$_WishListInputCopyWithImpl<_$_WishListInput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WishListInputToJson(
      this,
    );
  }
}

abstract class _WishListInput implements WishListInput {
  const factory _WishListInput(
      {final String? product,
      final String? variant,
      final String? deviceId,
      final String? pinCode}) = _$_WishListInput;

  factory _WishListInput.fromJson(Map<String, dynamic> json) =
      _$_WishListInput.fromJson;

  @override
  String? get product;
  @override
  String? get variant;
  @override
  String? get deviceId;
  @override
  String? get pinCode;
  @override
  @JsonKey(ignore: true)
  _$$_WishListInputCopyWith<_$_WishListInput> get copyWith =>
      throw _privateConstructorUsedError;
}
