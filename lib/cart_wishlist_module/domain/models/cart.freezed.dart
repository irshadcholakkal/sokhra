// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Cart _$CartFromJson(Map<String, dynamic> json) {
  return _Cart.fromJson(json);
}

/// @nodoc
mixin _$Cart {
  @JsonKey(name: '_id')
  String? get cartId => throw _privateConstructorUsedError;
  Product? get product => throw _privateConstructorUsedError;
  Variant? get variant => throw _privateConstructorUsedError;
  double? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'variantChoice')
  String? get variantChoice => throw _privateConstructorUsedError;
  @JsonValue(0.0)
  double? get deliveryCharge => throw _privateConstructorUsedError;
  double? get minimumPurchaseAmount => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  String? get deviceId => throw _privateConstructorUsedError;
  @JsonValue(false)
  bool? get isDeliveryAvailable => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartCopyWith<Cart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartCopyWith<$Res> {
  factory $CartCopyWith(Cart value, $Res Function(Cart) then) =
      _$CartCopyWithImpl<$Res, Cart>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? cartId,
      Product? product,
      Variant? variant,
      double? quantity,
      @JsonKey(name: 'variantChoice') String? variantChoice,
      @JsonValue(0.0) double? deliveryCharge,
      double? minimumPurchaseAmount,
      User? user,
      String? deviceId,
      @JsonValue(false) bool? isDeliveryAvailable});

  $ProductCopyWith<$Res>? get product;
  $VariantCopyWith<$Res>? get variant;
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$CartCopyWithImpl<$Res, $Val extends Cart>
    implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartId = freezed,
    Object? product = freezed,
    Object? variant = freezed,
    Object? quantity = freezed,
    Object? variantChoice = freezed,
    Object? deliveryCharge = freezed,
    Object? minimumPurchaseAmount = freezed,
    Object? user = freezed,
    Object? deviceId = freezed,
    Object? isDeliveryAvailable = freezed,
  }) {
    return _then(_value.copyWith(
      cartId: freezed == cartId
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as String?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      variant: freezed == variant
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as Variant?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
      variantChoice: freezed == variantChoice
          ? _value.variantChoice
          : variantChoice // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryCharge: freezed == deliveryCharge
          ? _value.deliveryCharge
          : deliveryCharge // ignore: cast_nullable_to_non_nullable
              as double?,
      minimumPurchaseAmount: freezed == minimumPurchaseAmount
          ? _value.minimumPurchaseAmount
          : minimumPurchaseAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeliveryAvailable: freezed == isDeliveryAvailable
          ? _value.isDeliveryAvailable
          : isDeliveryAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $VariantCopyWith<$Res>? get variant {
    if (_value.variant == null) {
      return null;
    }

    return $VariantCopyWith<$Res>(_value.variant!, (value) {
      return _then(_value.copyWith(variant: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CartCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$$_CartCopyWith(_$_Cart value, $Res Function(_$_Cart) then) =
      __$$_CartCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? cartId,
      Product? product,
      Variant? variant,
      double? quantity,
      @JsonKey(name: 'variantChoice') String? variantChoice,
      @JsonValue(0.0) double? deliveryCharge,
      double? minimumPurchaseAmount,
      User? user,
      String? deviceId,
      @JsonValue(false) bool? isDeliveryAvailable});

  @override
  $ProductCopyWith<$Res>? get product;
  @override
  $VariantCopyWith<$Res>? get variant;
  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_CartCopyWithImpl<$Res> extends _$CartCopyWithImpl<$Res, _$_Cart>
    implements _$$_CartCopyWith<$Res> {
  __$$_CartCopyWithImpl(_$_Cart _value, $Res Function(_$_Cart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartId = freezed,
    Object? product = freezed,
    Object? variant = freezed,
    Object? quantity = freezed,
    Object? variantChoice = freezed,
    Object? deliveryCharge = freezed,
    Object? minimumPurchaseAmount = freezed,
    Object? user = freezed,
    Object? deviceId = freezed,
    Object? isDeliveryAvailable = freezed,
  }) {
    return _then(_$_Cart(
      cartId: freezed == cartId
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as String?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      variant: freezed == variant
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as Variant?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
      variantChoice: freezed == variantChoice
          ? _value.variantChoice
          : variantChoice // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryCharge: freezed == deliveryCharge
          ? _value.deliveryCharge
          : deliveryCharge // ignore: cast_nullable_to_non_nullable
              as double?,
      minimumPurchaseAmount: freezed == minimumPurchaseAmount
          ? _value.minimumPurchaseAmount
          : minimumPurchaseAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeliveryAvailable: freezed == isDeliveryAvailable
          ? _value.isDeliveryAvailable
          : isDeliveryAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_Cart implements _Cart {
  const _$_Cart(
      {@JsonKey(name: '_id') this.cartId,
      this.product,
      this.variant,
      this.quantity,
      @JsonKey(name: 'variantChoice') this.variantChoice,
      @JsonValue(0.0) this.deliveryCharge,
      this.minimumPurchaseAmount,
      this.user,
      this.deviceId,
      @JsonValue(false) this.isDeliveryAvailable});

  factory _$_Cart.fromJson(Map<String, dynamic> json) => _$$_CartFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? cartId;
  @override
  final Product? product;
  @override
  final Variant? variant;
  @override
  final double? quantity;
  @override
  @JsonKey(name: 'variantChoice')
  final String? variantChoice;
  @override
  @JsonValue(0.0)
  final double? deliveryCharge;
  @override
  final double? minimumPurchaseAmount;
  @override
  final User? user;
  @override
  final String? deviceId;
  @override
  @JsonValue(false)
  final bool? isDeliveryAvailable;

  @override
  String toString() {
    return 'Cart(cartId: $cartId, product: $product, variant: $variant, quantity: $quantity, variantChoice: $variantChoice, deliveryCharge: $deliveryCharge, minimumPurchaseAmount: $minimumPurchaseAmount, user: $user, deviceId: $deviceId, isDeliveryAvailable: $isDeliveryAvailable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Cart &&
            (identical(other.cartId, cartId) || other.cartId == cartId) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.variant, variant) || other.variant == variant) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.variantChoice, variantChoice) ||
                other.variantChoice == variantChoice) &&
            (identical(other.deliveryCharge, deliveryCharge) ||
                other.deliveryCharge == deliveryCharge) &&
            (identical(other.minimumPurchaseAmount, minimumPurchaseAmount) ||
                other.minimumPurchaseAmount == minimumPurchaseAmount) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.isDeliveryAvailable, isDeliveryAvailable) ||
                other.isDeliveryAvailable == isDeliveryAvailable));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      cartId,
      product,
      variant,
      quantity,
      variantChoice,
      deliveryCharge,
      minimumPurchaseAmount,
      user,
      deviceId,
      isDeliveryAvailable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartCopyWith<_$_Cart> get copyWith =>
      __$$_CartCopyWithImpl<_$_Cart>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CartToJson(
      this,
    );
  }
}

abstract class _Cart implements Cart {
  const factory _Cart(
      {@JsonKey(name: '_id') final String? cartId,
      final Product? product,
      final Variant? variant,
      final double? quantity,
      @JsonKey(name: 'variantChoice') final String? variantChoice,
      @JsonValue(0.0) final double? deliveryCharge,
      final double? minimumPurchaseAmount,
      final User? user,
      final String? deviceId,
      @JsonValue(false) final bool? isDeliveryAvailable}) = _$_Cart;

  factory _Cart.fromJson(Map<String, dynamic> json) = _$_Cart.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get cartId;
  @override
  Product? get product;
  @override
  Variant? get variant;
  @override
  double? get quantity;
  @override
  @JsonKey(name: 'variantChoice')
  String? get variantChoice;
  @override
  @JsonValue(0.0)
  double? get deliveryCharge;
  @override
  double? get minimumPurchaseAmount;
  @override
  User? get user;
  @override
  String? get deviceId;
  @override
  @JsonValue(false)
  bool? get isDeliveryAvailable;
  @override
  @JsonKey(ignore: true)
  _$$_CartCopyWith<_$_Cart> get copyWith => throw _privateConstructorUsedError;
}
