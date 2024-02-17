// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  int? get orderNumber => throw _privateConstructorUsedError;
  OrderStatus? get status => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  OrderPricing? get pricing => throw _privateConstructorUsedError;
  String? get deliveryDate => throw _privateConstructorUsedError;
  @JsonValue([])
  List<OrderProduct>? get orders => throw _privateConstructorUsedError;
  ShippingDetails? get shippingDetails => throw _privateConstructorUsedError;
  PaymentDetails? get payment => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      int? orderNumber,
      OrderStatus? status,
      String? reason,
      OrderPricing? pricing,
      String? deliveryDate,
      @JsonValue([]) List<OrderProduct>? orders,
      ShippingDetails? shippingDetails,
      PaymentDetails? payment,
      String? createdAt});

  $OrderPricingCopyWith<$Res>? get pricing;
  $ShippingDetailsCopyWith<$Res>? get shippingDetails;
  $PaymentDetailsCopyWith<$Res>? get payment;
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? orderNumber = freezed,
    Object? status = freezed,
    Object? reason = freezed,
    Object? pricing = freezed,
    Object? deliveryDate = freezed,
    Object? orders = freezed,
    Object? shippingDetails = freezed,
    Object? payment = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      orderNumber: freezed == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      pricing: freezed == pricing
          ? _value.pricing
          : pricing // ignore: cast_nullable_to_non_nullable
              as OrderPricing?,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      orders: freezed == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderProduct>?,
      shippingDetails: freezed == shippingDetails
          ? _value.shippingDetails
          : shippingDetails // ignore: cast_nullable_to_non_nullable
              as ShippingDetails?,
      payment: freezed == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as PaymentDetails?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderPricingCopyWith<$Res>? get pricing {
    if (_value.pricing == null) {
      return null;
    }

    return $OrderPricingCopyWith<$Res>(_value.pricing!, (value) {
      return _then(_value.copyWith(pricing: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShippingDetailsCopyWith<$Res>? get shippingDetails {
    if (_value.shippingDetails == null) {
      return null;
    }

    return $ShippingDetailsCopyWith<$Res>(_value.shippingDetails!, (value) {
      return _then(_value.copyWith(shippingDetails: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentDetailsCopyWith<$Res>? get payment {
    if (_value.payment == null) {
      return null;
    }

    return $PaymentDetailsCopyWith<$Res>(_value.payment!, (value) {
      return _then(_value.copyWith(payment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$_OrderCopyWith(_$_Order value, $Res Function(_$_Order) then) =
      __$$_OrderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      int? orderNumber,
      OrderStatus? status,
      String? reason,
      OrderPricing? pricing,
      String? deliveryDate,
      @JsonValue([]) List<OrderProduct>? orders,
      ShippingDetails? shippingDetails,
      PaymentDetails? payment,
      String? createdAt});

  @override
  $OrderPricingCopyWith<$Res>? get pricing;
  @override
  $ShippingDetailsCopyWith<$Res>? get shippingDetails;
  @override
  $PaymentDetailsCopyWith<$Res>? get payment;
}

/// @nodoc
class __$$_OrderCopyWithImpl<$Res> extends _$OrderCopyWithImpl<$Res, _$_Order>
    implements _$$_OrderCopyWith<$Res> {
  __$$_OrderCopyWithImpl(_$_Order _value, $Res Function(_$_Order) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? orderNumber = freezed,
    Object? status = freezed,
    Object? reason = freezed,
    Object? pricing = freezed,
    Object? deliveryDate = freezed,
    Object? orders = freezed,
    Object? shippingDetails = freezed,
    Object? payment = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_Order(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      orderNumber: freezed == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      pricing: freezed == pricing
          ? _value.pricing
          : pricing // ignore: cast_nullable_to_non_nullable
              as OrderPricing?,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      orders: freezed == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderProduct>?,
      shippingDetails: freezed == shippingDetails
          ? _value.shippingDetails
          : shippingDetails // ignore: cast_nullable_to_non_nullable
              as ShippingDetails?,
      payment: freezed == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as PaymentDetails?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_Order implements _Order {
  const _$_Order(
      {@JsonKey(name: "_id") this.id,
      this.orderNumber,
      this.status,
      this.reason,
      this.pricing,
      this.deliveryDate,
      @JsonValue([]) final List<OrderProduct>? orders,
      this.shippingDetails,
      this.payment,
      this.createdAt})
      : _orders = orders;

  factory _$_Order.fromJson(Map<String, dynamic> json) =>
      _$$_OrderFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  final int? orderNumber;
  @override
  final OrderStatus? status;
  @override
  final String? reason;
  @override
  final OrderPricing? pricing;
  @override
  final String? deliveryDate;
  final List<OrderProduct>? _orders;
  @override
  @JsonValue([])
  List<OrderProduct>? get orders {
    final value = _orders;
    if (value == null) return null;
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ShippingDetails? shippingDetails;
  @override
  final PaymentDetails? payment;
  @override
  final String? createdAt;

  @override
  String toString() {
    return 'Order(id: $id, orderNumber: $orderNumber, status: $status, reason: $reason, pricing: $pricing, deliveryDate: $deliveryDate, orders: $orders, shippingDetails: $shippingDetails, payment: $payment, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Order &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.pricing, pricing) || other.pricing == pricing) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate) &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            (identical(other.shippingDetails, shippingDetails) ||
                other.shippingDetails == shippingDetails) &&
            (identical(other.payment, payment) || other.payment == payment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      orderNumber,
      status,
      reason,
      pricing,
      deliveryDate,
      const DeepCollectionEquality().hash(_orders),
      shippingDetails,
      payment,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      __$$_OrderCopyWithImpl<_$_Order>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderToJson(
      this,
    );
  }
}

abstract class _Order implements Order {
  const factory _Order(
      {@JsonKey(name: "_id") final String? id,
      final int? orderNumber,
      final OrderStatus? status,
      final String? reason,
      final OrderPricing? pricing,
      final String? deliveryDate,
      @JsonValue([]) final List<OrderProduct>? orders,
      final ShippingDetails? shippingDetails,
      final PaymentDetails? payment,
      final String? createdAt}) = _$_Order;

  factory _Order.fromJson(Map<String, dynamic> json) = _$_Order.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  int? get orderNumber;
  @override
  OrderStatus? get status;
  @override
  String? get reason;
  @override
  OrderPricing? get pricing;
  @override
  String? get deliveryDate;
  @override
  @JsonValue([])
  List<OrderProduct>? get orders;
  @override
  ShippingDetails? get shippingDetails;
  @override
  PaymentDetails? get payment;
  @override
  String? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      throw _privateConstructorUsedError;
}
