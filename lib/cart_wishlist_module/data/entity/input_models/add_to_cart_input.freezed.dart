// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_to_cart_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddToCartInput _$AddToCartInputFromJson(Map<String, dynamic> json) {
  return _AddToCartInput.fromJson(json);
}

/// @nodoc
mixin _$AddToCartInput {
  @JsonKey(name: "_id")
  String? get productId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String? get choiceId => throw _privateConstructorUsedError;
  String? get deviceId => throw _privateConstructorUsedError;
  String? get variantChoice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddToCartInputCopyWith<AddToCartInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddToCartInputCopyWith<$Res> {
  factory $AddToCartInputCopyWith(
          AddToCartInput value, $Res Function(AddToCartInput) then) =
      _$AddToCartInputCopyWithImpl<$Res, AddToCartInput>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? productId,
      int quantity,
      String? choiceId,
      String? deviceId,
      String? variantChoice});
}

/// @nodoc
class _$AddToCartInputCopyWithImpl<$Res, $Val extends AddToCartInput>
    implements $AddToCartInputCopyWith<$Res> {
  _$AddToCartInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? quantity = null,
    Object? choiceId = freezed,
    Object? deviceId = freezed,
    Object? variantChoice = freezed,
  }) {
    return _then(_value.copyWith(
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      choiceId: freezed == choiceId
          ? _value.choiceId
          : choiceId // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      variantChoice: freezed == variantChoice
          ? _value.variantChoice
          : variantChoice // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddToCartInputCopyWith<$Res>
    implements $AddToCartInputCopyWith<$Res> {
  factory _$$_AddToCartInputCopyWith(
          _$_AddToCartInput value, $Res Function(_$_AddToCartInput) then) =
      __$$_AddToCartInputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? productId,
      int quantity,
      String? choiceId,
      String? deviceId,
      String? variantChoice});
}

/// @nodoc
class __$$_AddToCartInputCopyWithImpl<$Res>
    extends _$AddToCartInputCopyWithImpl<$Res, _$_AddToCartInput>
    implements _$$_AddToCartInputCopyWith<$Res> {
  __$$_AddToCartInputCopyWithImpl(
      _$_AddToCartInput _value, $Res Function(_$_AddToCartInput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? quantity = null,
    Object? choiceId = freezed,
    Object? deviceId = freezed,
    Object? variantChoice = freezed,
  }) {
    return _then(_$_AddToCartInput(
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      choiceId: freezed == choiceId
          ? _value.choiceId
          : choiceId // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      variantChoice: freezed == variantChoice
          ? _value.variantChoice
          : variantChoice // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_AddToCartInput implements _AddToCartInput {
  const _$_AddToCartInput(
      {@JsonKey(name: "_id") required this.productId,
      required this.quantity,
      required this.choiceId,
      required this.deviceId,
      this.variantChoice});

  factory _$_AddToCartInput.fromJson(Map<String, dynamic> json) =>
      _$$_AddToCartInputFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? productId;
  @override
  final int quantity;
  @override
  final String? choiceId;
  @override
  final String? deviceId;
  @override
  final String? variantChoice;

  @override
  String toString() {
    return 'AddToCartInput(productId: $productId, quantity: $quantity, choiceId: $choiceId, deviceId: $deviceId, variantChoice: $variantChoice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddToCartInput &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.choiceId, choiceId) ||
                other.choiceId == choiceId) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.variantChoice, variantChoice) ||
                other.variantChoice == variantChoice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, productId, quantity, choiceId, deviceId, variantChoice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddToCartInputCopyWith<_$_AddToCartInput> get copyWith =>
      __$$_AddToCartInputCopyWithImpl<_$_AddToCartInput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddToCartInputToJson(
      this,
    );
  }
}

abstract class _AddToCartInput implements AddToCartInput {
  const factory _AddToCartInput(
      {@JsonKey(name: "_id") required final String? productId,
      required final int quantity,
      required final String? choiceId,
      required final String? deviceId,
      final String? variantChoice}) = _$_AddToCartInput;

  factory _AddToCartInput.fromJson(Map<String, dynamic> json) =
      _$_AddToCartInput.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get productId;
  @override
  int get quantity;
  @override
  String? get choiceId;
  @override
  String? get deviceId;
  @override
  String? get variantChoice;
  @override
  @JsonKey(ignore: true)
  _$$_AddToCartInputCopyWith<_$_AddToCartInput> get copyWith =>
      throw _privateConstructorUsedError;
}
