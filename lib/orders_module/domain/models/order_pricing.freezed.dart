// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_pricing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderPricing _$OrderPricingFromJson(Map<String, dynamic> json) {
  return _OrderPricing.fromJson(json);
}

/// @nodoc
mixin _$OrderPricing {
  double? get tax => throw _privateConstructorUsedError;
  double? get deliveryCharge => throw _privateConstructorUsedError;
  double? get billedValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderPricingCopyWith<OrderPricing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderPricingCopyWith<$Res> {
  factory $OrderPricingCopyWith(
          OrderPricing value, $Res Function(OrderPricing) then) =
      _$OrderPricingCopyWithImpl<$Res, OrderPricing>;
  @useResult
  $Res call({double? tax, double? deliveryCharge, double? billedValue});
}

/// @nodoc
class _$OrderPricingCopyWithImpl<$Res, $Val extends OrderPricing>
    implements $OrderPricingCopyWith<$Res> {
  _$OrderPricingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tax = freezed,
    Object? deliveryCharge = freezed,
    Object? billedValue = freezed,
  }) {
    return _then(_value.copyWith(
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryCharge: freezed == deliveryCharge
          ? _value.deliveryCharge
          : deliveryCharge // ignore: cast_nullable_to_non_nullable
              as double?,
      billedValue: freezed == billedValue
          ? _value.billedValue
          : billedValue // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderPricingCopyWith<$Res>
    implements $OrderPricingCopyWith<$Res> {
  factory _$$_OrderPricingCopyWith(
          _$_OrderPricing value, $Res Function(_$_OrderPricing) then) =
      __$$_OrderPricingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? tax, double? deliveryCharge, double? billedValue});
}

/// @nodoc
class __$$_OrderPricingCopyWithImpl<$Res>
    extends _$OrderPricingCopyWithImpl<$Res, _$_OrderPricing>
    implements _$$_OrderPricingCopyWith<$Res> {
  __$$_OrderPricingCopyWithImpl(
      _$_OrderPricing _value, $Res Function(_$_OrderPricing) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tax = freezed,
    Object? deliveryCharge = freezed,
    Object? billedValue = freezed,
  }) {
    return _then(_$_OrderPricing(
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryCharge: freezed == deliveryCharge
          ? _value.deliveryCharge
          : deliveryCharge // ignore: cast_nullable_to_non_nullable
              as double?,
      billedValue: freezed == billedValue
          ? _value.billedValue
          : billedValue // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_OrderPricing with DiagnosticableTreeMixin implements _OrderPricing {
  const _$_OrderPricing({this.tax, this.deliveryCharge, this.billedValue});

  factory _$_OrderPricing.fromJson(Map<String, dynamic> json) =>
      _$$_OrderPricingFromJson(json);

  @override
  final double? tax;
  @override
  final double? deliveryCharge;
  @override
  final double? billedValue;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OrderPricing(tax: $tax, deliveryCharge: $deliveryCharge, billedValue: $billedValue)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OrderPricing'))
      ..add(DiagnosticsProperty('tax', tax))
      ..add(DiagnosticsProperty('deliveryCharge', deliveryCharge))
      ..add(DiagnosticsProperty('billedValue', billedValue));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderPricing &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.deliveryCharge, deliveryCharge) ||
                other.deliveryCharge == deliveryCharge) &&
            (identical(other.billedValue, billedValue) ||
                other.billedValue == billedValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, tax, deliveryCharge, billedValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderPricingCopyWith<_$_OrderPricing> get copyWith =>
      __$$_OrderPricingCopyWithImpl<_$_OrderPricing>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderPricingToJson(
      this,
    );
  }
}

abstract class _OrderPricing implements OrderPricing {
  const factory _OrderPricing(
      {final double? tax,
      final double? deliveryCharge,
      final double? billedValue}) = _$_OrderPricing;

  factory _OrderPricing.fromJson(Map<String, dynamic> json) =
      _$_OrderPricing.fromJson;

  @override
  double? get tax;
  @override
  double? get deliveryCharge;
  @override
  double? get billedValue;
  @override
  @JsonKey(ignore: true)
  _$$_OrderPricingCopyWith<_$_OrderPricing> get copyWith =>
      throw _privateConstructorUsedError;
}
