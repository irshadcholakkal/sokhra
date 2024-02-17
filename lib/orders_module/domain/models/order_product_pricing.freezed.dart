// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_product_pricing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderProductPricing _$OrderProductPricingFromJson(Map<String, dynamic> json) {
  return _OrderProductPricing.fromJson(json);
}

/// @nodoc
mixin _$OrderProductPricing {
  double? get netAmount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderProductPricingCopyWith<OrderProductPricing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderProductPricingCopyWith<$Res> {
  factory $OrderProductPricingCopyWith(
          OrderProductPricing value, $Res Function(OrderProductPricing) then) =
      _$OrderProductPricingCopyWithImpl<$Res, OrderProductPricing>;
  @useResult
  $Res call({double? netAmount});
}

/// @nodoc
class _$OrderProductPricingCopyWithImpl<$Res, $Val extends OrderProductPricing>
    implements $OrderProductPricingCopyWith<$Res> {
  _$OrderProductPricingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? netAmount = freezed,
  }) {
    return _then(_value.copyWith(
      netAmount: freezed == netAmount
          ? _value.netAmount
          : netAmount // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderProductPricingCopyWith<$Res>
    implements $OrderProductPricingCopyWith<$Res> {
  factory _$$_OrderProductPricingCopyWith(_$_OrderProductPricing value,
          $Res Function(_$_OrderProductPricing) then) =
      __$$_OrderProductPricingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? netAmount});
}

/// @nodoc
class __$$_OrderProductPricingCopyWithImpl<$Res>
    extends _$OrderProductPricingCopyWithImpl<$Res, _$_OrderProductPricing>
    implements _$$_OrderProductPricingCopyWith<$Res> {
  __$$_OrderProductPricingCopyWithImpl(_$_OrderProductPricing _value,
      $Res Function(_$_OrderProductPricing) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? netAmount = freezed,
  }) {
    return _then(_$_OrderProductPricing(
      netAmount: freezed == netAmount
          ? _value.netAmount
          : netAmount // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_OrderProductPricing implements _OrderProductPricing {
  const _$_OrderProductPricing({this.netAmount});

  factory _$_OrderProductPricing.fromJson(Map<String, dynamic> json) =>
      _$$_OrderProductPricingFromJson(json);

  @override
  final double? netAmount;

  @override
  String toString() {
    return 'OrderProductPricing(netAmount: $netAmount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderProductPricing &&
            (identical(other.netAmount, netAmount) ||
                other.netAmount == netAmount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, netAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderProductPricingCopyWith<_$_OrderProductPricing> get copyWith =>
      __$$_OrderProductPricingCopyWithImpl<_$_OrderProductPricing>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderProductPricingToJson(
      this,
    );
  }
}

abstract class _OrderProductPricing implements OrderProductPricing {
  const factory _OrderProductPricing({final double? netAmount}) =
      _$_OrderProductPricing;

  factory _OrderProductPricing.fromJson(Map<String, dynamic> json) =
      _$_OrderProductPricing.fromJson;

  @override
  double? get netAmount;
  @override
  @JsonKey(ignore: true)
  _$$_OrderProductPricingCopyWith<_$_OrderProductPricing> get copyWith =>
      throw _privateConstructorUsedError;
}
