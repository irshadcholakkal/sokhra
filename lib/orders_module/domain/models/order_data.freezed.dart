// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderData {
  String? get productName => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  double? get quantity => throw _privateConstructorUsedError;
  double? get total => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderDataCopyWith<OrderData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDataCopyWith<$Res> {
  factory $OrderDataCopyWith(OrderData value, $Res Function(OrderData) then) =
      _$OrderDataCopyWithImpl<$Res, OrderData>;
  @useResult
  $Res call(
      {String? productName, double? price, double? quantity, double? total});
}

/// @nodoc
class _$OrderDataCopyWithImpl<$Res, $Val extends OrderData>
    implements $OrderDataCopyWith<$Res> {
  _$OrderDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderDataCopyWith<$Res> implements $OrderDataCopyWith<$Res> {
  factory _$$_OrderDataCopyWith(
          _$_OrderData value, $Res Function(_$_OrderData) then) =
      __$$_OrderDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? productName, double? price, double? quantity, double? total});
}

/// @nodoc
class __$$_OrderDataCopyWithImpl<$Res>
    extends _$OrderDataCopyWithImpl<$Res, _$_OrderData>
    implements _$$_OrderDataCopyWith<$Res> {
  __$$_OrderDataCopyWithImpl(
      _$_OrderData _value, $Res Function(_$_OrderData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
    Object? total = freezed,
  }) {
    return _then(_$_OrderData(
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$_OrderData implements _OrderData {
  const _$_OrderData({this.productName, this.price, this.quantity, this.total});

  @override
  final String? productName;
  @override
  final double? price;
  @override
  final double? quantity;
  @override
  final double? total;

  @override
  String toString() {
    return 'OrderData(productName: $productName, price: $price, quantity: $quantity, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderData &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.total, total) || other.total == total));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, productName, price, quantity, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderDataCopyWith<_$_OrderData> get copyWith =>
      __$$_OrderDataCopyWithImpl<_$_OrderData>(this, _$identity);
}

abstract class _OrderData implements OrderData {
  const factory _OrderData(
      {final String? productName,
      final double? price,
      final double? quantity,
      final double? total}) = _$_OrderData;

  @override
  String? get productName;
  @override
  double? get price;
  @override
  double? get quantity;
  @override
  double? get total;
  @override
  @JsonKey(ignore: true)
  _$$_OrderDataCopyWith<_$_OrderData> get copyWith =>
      throw _privateConstructorUsedError;
}
