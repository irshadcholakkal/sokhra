// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CartList _$CartListFromJson(Map<String, dynamic> json) {
  return _CartList.fromJson(json);
}

/// @nodoc
mixin _$CartList {
  @JsonKey(defaultValue: [], name: "cart")
  List<Cart>? get cartList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartListCopyWith<CartList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartListCopyWith<$Res> {
  factory $CartListCopyWith(CartList value, $Res Function(CartList) then) =
      _$CartListCopyWithImpl<$Res, CartList>;
  @useResult
  $Res call({@JsonKey(defaultValue: [], name: "cart") List<Cart>? cartList});
}

/// @nodoc
class _$CartListCopyWithImpl<$Res, $Val extends CartList>
    implements $CartListCopyWith<$Res> {
  _$CartListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartList = freezed,
  }) {
    return _then(_value.copyWith(
      cartList: freezed == cartList
          ? _value.cartList
          : cartList // ignore: cast_nullable_to_non_nullable
              as List<Cart>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CartListCopyWith<$Res> implements $CartListCopyWith<$Res> {
  factory _$$_CartListCopyWith(
          _$_CartList value, $Res Function(_$_CartList) then) =
      __$$_CartListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(defaultValue: [], name: "cart") List<Cart>? cartList});
}

/// @nodoc
class __$$_CartListCopyWithImpl<$Res>
    extends _$CartListCopyWithImpl<$Res, _$_CartList>
    implements _$$_CartListCopyWith<$Res> {
  __$$_CartListCopyWithImpl(
      _$_CartList _value, $Res Function(_$_CartList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartList = freezed,
  }) {
    return _then(_$_CartList(
      cartList: freezed == cartList
          ? _value._cartList
          : cartList // ignore: cast_nullable_to_non_nullable
              as List<Cart>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_CartList implements _CartList {
  const _$_CartList(
      {@JsonKey(defaultValue: [], name: "cart") final List<Cart>? cartList})
      : _cartList = cartList;

  factory _$_CartList.fromJson(Map<String, dynamic> json) =>
      _$$_CartListFromJson(json);

  final List<Cart>? _cartList;
  @override
  @JsonKey(defaultValue: [], name: "cart")
  List<Cart>? get cartList {
    final value = _cartList;
    if (value == null) return null;
    if (_cartList is EqualUnmodifiableListView) return _cartList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CartList(cartList: $cartList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartList &&
            const DeepCollectionEquality().equals(other._cartList, _cartList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cartList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartListCopyWith<_$_CartList> get copyWith =>
      __$$_CartListCopyWithImpl<_$_CartList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CartListToJson(
      this,
    );
  }
}

abstract class _CartList implements CartList {
  const factory _CartList(
      {@JsonKey(defaultValue: [], name: "cart")
          final List<Cart>? cartList}) = _$_CartList;

  factory _CartList.fromJson(Map<String, dynamic> json) = _$_CartList.fromJson;

  @override
  @JsonKey(defaultValue: [], name: "cart")
  List<Cart>? get cartList;
  @override
  @JsonKey(ignore: true)
  _$$_CartListCopyWith<_$_CartList> get copyWith =>
      throw _privateConstructorUsedError;
}
