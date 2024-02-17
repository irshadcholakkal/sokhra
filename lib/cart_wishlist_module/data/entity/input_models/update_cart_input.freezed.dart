// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_cart_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateCartInput _$UpdateCartInputFromJson(Map<String, dynamic> json) {
  return _UpdateCartInput.fromJson(json);
}

/// @nodoc
mixin _$UpdateCartInput {
  @JsonKey(name: "_id")
  String get cartId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateCartInputCopyWith<UpdateCartInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateCartInputCopyWith<$Res> {
  factory $UpdateCartInputCopyWith(
          UpdateCartInput value, $Res Function(UpdateCartInput) then) =
      _$UpdateCartInputCopyWithImpl<$Res, UpdateCartInput>;
  @useResult
  $Res call({@JsonKey(name: "_id") String cartId, int quantity});
}

/// @nodoc
class _$UpdateCartInputCopyWithImpl<$Res, $Val extends UpdateCartInput>
    implements $UpdateCartInputCopyWith<$Res> {
  _$UpdateCartInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartId = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      cartId: null == cartId
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateCartInputCopyWith<$Res>
    implements $UpdateCartInputCopyWith<$Res> {
  factory _$$_UpdateCartInputCopyWith(
          _$_UpdateCartInput value, $Res Function(_$_UpdateCartInput) then) =
      __$$_UpdateCartInputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "_id") String cartId, int quantity});
}

/// @nodoc
class __$$_UpdateCartInputCopyWithImpl<$Res>
    extends _$UpdateCartInputCopyWithImpl<$Res, _$_UpdateCartInput>
    implements _$$_UpdateCartInputCopyWith<$Res> {
  __$$_UpdateCartInputCopyWithImpl(
      _$_UpdateCartInput _value, $Res Function(_$_UpdateCartInput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartId = null,
    Object? quantity = null,
  }) {
    return _then(_$_UpdateCartInput(
      cartId: null == cartId
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_UpdateCartInput implements _UpdateCartInput {
  const _$_UpdateCartInput(
      {@JsonKey(name: "_id") required this.cartId, required this.quantity});

  factory _$_UpdateCartInput.fromJson(Map<String, dynamic> json) =>
      _$$_UpdateCartInputFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String cartId;
  @override
  final int quantity;

  @override
  String toString() {
    return 'UpdateCartInput(cartId: $cartId, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateCartInput &&
            (identical(other.cartId, cartId) || other.cartId == cartId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cartId, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateCartInputCopyWith<_$_UpdateCartInput> get copyWith =>
      __$$_UpdateCartInputCopyWithImpl<_$_UpdateCartInput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateCartInputToJson(
      this,
    );
  }
}

abstract class _UpdateCartInput implements UpdateCartInput {
  const factory _UpdateCartInput(
      {@JsonKey(name: "_id") required final String cartId,
      required final int quantity}) = _$_UpdateCartInput;

  factory _UpdateCartInput.fromJson(Map<String, dynamic> json) =
      _$_UpdateCartInput.fromJson;

  @override
  @JsonKey(name: "_id")
  String get cartId;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateCartInputCopyWith<_$_UpdateCartInput> get copyWith =>
      throw _privateConstructorUsedError;
}
