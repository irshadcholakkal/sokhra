// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderProduct _$OrderProductFromJson(Map<String, dynamic> json) {
  return _OrderProduct.fromJson(json);
}

/// @nodoc
mixin _$OrderProduct {
  OrderProductPricing? get pricing => throw _privateConstructorUsedError;
  OrderProductInfo? get productInfo => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderProductCopyWith<OrderProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderProductCopyWith<$Res> {
  factory $OrderProductCopyWith(
          OrderProduct value, $Res Function(OrderProduct) then) =
      _$OrderProductCopyWithImpl<$Res, OrderProduct>;
  @useResult
  $Res call(
      {OrderProductPricing? pricing,
      OrderProductInfo? productInfo,
      int? quantity});

  $OrderProductPricingCopyWith<$Res>? get pricing;
  $OrderProductInfoCopyWith<$Res>? get productInfo;
}

/// @nodoc
class _$OrderProductCopyWithImpl<$Res, $Val extends OrderProduct>
    implements $OrderProductCopyWith<$Res> {
  _$OrderProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pricing = freezed,
    Object? productInfo = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_value.copyWith(
      pricing: freezed == pricing
          ? _value.pricing
          : pricing // ignore: cast_nullable_to_non_nullable
              as OrderProductPricing?,
      productInfo: freezed == productInfo
          ? _value.productInfo
          : productInfo // ignore: cast_nullable_to_non_nullable
              as OrderProductInfo?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderProductPricingCopyWith<$Res>? get pricing {
    if (_value.pricing == null) {
      return null;
    }

    return $OrderProductPricingCopyWith<$Res>(_value.pricing!, (value) {
      return _then(_value.copyWith(pricing: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderProductInfoCopyWith<$Res>? get productInfo {
    if (_value.productInfo == null) {
      return null;
    }

    return $OrderProductInfoCopyWith<$Res>(_value.productInfo!, (value) {
      return _then(_value.copyWith(productInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderProductCopyWith<$Res>
    implements $OrderProductCopyWith<$Res> {
  factory _$$_OrderProductCopyWith(
          _$_OrderProduct value, $Res Function(_$_OrderProduct) then) =
      __$$_OrderProductCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OrderProductPricing? pricing,
      OrderProductInfo? productInfo,
      int? quantity});

  @override
  $OrderProductPricingCopyWith<$Res>? get pricing;
  @override
  $OrderProductInfoCopyWith<$Res>? get productInfo;
}

/// @nodoc
class __$$_OrderProductCopyWithImpl<$Res>
    extends _$OrderProductCopyWithImpl<$Res, _$_OrderProduct>
    implements _$$_OrderProductCopyWith<$Res> {
  __$$_OrderProductCopyWithImpl(
      _$_OrderProduct _value, $Res Function(_$_OrderProduct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pricing = freezed,
    Object? productInfo = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_$_OrderProduct(
      pricing: freezed == pricing
          ? _value.pricing
          : pricing // ignore: cast_nullable_to_non_nullable
              as OrderProductPricing?,
      productInfo: freezed == productInfo
          ? _value.productInfo
          : productInfo // ignore: cast_nullable_to_non_nullable
              as OrderProductInfo?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_OrderProduct with DiagnosticableTreeMixin implements _OrderProduct {
  const _$_OrderProduct({this.pricing, this.productInfo, this.quantity});

  factory _$_OrderProduct.fromJson(Map<String, dynamic> json) =>
      _$$_OrderProductFromJson(json);

  @override
  final OrderProductPricing? pricing;
  @override
  final OrderProductInfo? productInfo;
  @override
  final int? quantity;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OrderProduct(pricing: $pricing, productInfo: $productInfo, quantity: $quantity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OrderProduct'))
      ..add(DiagnosticsProperty('pricing', pricing))
      ..add(DiagnosticsProperty('productInfo', productInfo))
      ..add(DiagnosticsProperty('quantity', quantity));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderProduct &&
            (identical(other.pricing, pricing) || other.pricing == pricing) &&
            (identical(other.productInfo, productInfo) ||
                other.productInfo == productInfo) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pricing, productInfo, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderProductCopyWith<_$_OrderProduct> get copyWith =>
      __$$_OrderProductCopyWithImpl<_$_OrderProduct>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderProductToJson(
      this,
    );
  }
}

abstract class _OrderProduct implements OrderProduct {
  const factory _OrderProduct(
      {final OrderProductPricing? pricing,
      final OrderProductInfo? productInfo,
      final int? quantity}) = _$_OrderProduct;

  factory _OrderProduct.fromJson(Map<String, dynamic> json) =
      _$_OrderProduct.fromJson;

  @override
  OrderProductPricing? get pricing;
  @override
  OrderProductInfo? get productInfo;
  @override
  int? get quantity;
  @override
  @JsonKey(ignore: true)
  _$$_OrderProductCopyWith<_$_OrderProduct> get copyWith =>
      throw _privateConstructorUsedError;
}
