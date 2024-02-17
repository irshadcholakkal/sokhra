// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_data_table.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderDataTableModel {
  List<OrderData>? get orderData => throw _privateConstructorUsedError;
  double? get deliveryCharge => throw _privateConstructorUsedError;
  double? get total => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderDataTableModelCopyWith<OrderDataTableModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDataTableModelCopyWith<$Res> {
  factory $OrderDataTableModelCopyWith(
          OrderDataTableModel value, $Res Function(OrderDataTableModel) then) =
      _$OrderDataTableModelCopyWithImpl<$Res, OrderDataTableModel>;
  @useResult
  $Res call(
      {List<OrderData>? orderData, double? deliveryCharge, double? total});
}

/// @nodoc
class _$OrderDataTableModelCopyWithImpl<$Res, $Val extends OrderDataTableModel>
    implements $OrderDataTableModelCopyWith<$Res> {
  _$OrderDataTableModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderData = freezed,
    Object? deliveryCharge = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      orderData: freezed == orderData
          ? _value.orderData
          : orderData // ignore: cast_nullable_to_non_nullable
              as List<OrderData>?,
      deliveryCharge: freezed == deliveryCharge
          ? _value.deliveryCharge
          : deliveryCharge // ignore: cast_nullable_to_non_nullable
              as double?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderDataTableModelCopyWith<$Res>
    implements $OrderDataTableModelCopyWith<$Res> {
  factory _$$_OrderDataTableModelCopyWith(_$_OrderDataTableModel value,
          $Res Function(_$_OrderDataTableModel) then) =
      __$$_OrderDataTableModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<OrderData>? orderData, double? deliveryCharge, double? total});
}

/// @nodoc
class __$$_OrderDataTableModelCopyWithImpl<$Res>
    extends _$OrderDataTableModelCopyWithImpl<$Res, _$_OrderDataTableModel>
    implements _$$_OrderDataTableModelCopyWith<$Res> {
  __$$_OrderDataTableModelCopyWithImpl(_$_OrderDataTableModel _value,
      $Res Function(_$_OrderDataTableModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderData = freezed,
    Object? deliveryCharge = freezed,
    Object? total = freezed,
  }) {
    return _then(_$_OrderDataTableModel(
      orderData: freezed == orderData
          ? _value._orderData
          : orderData // ignore: cast_nullable_to_non_nullable
              as List<OrderData>?,
      deliveryCharge: freezed == deliveryCharge
          ? _value.deliveryCharge
          : deliveryCharge // ignore: cast_nullable_to_non_nullable
              as double?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$_OrderDataTableModel implements _OrderDataTableModel {
  const _$_OrderDataTableModel(
      {final List<OrderData>? orderData = const [],
      this.deliveryCharge,
      this.total})
      : _orderData = orderData;

  final List<OrderData>? _orderData;
  @override
  @JsonKey()
  List<OrderData>? get orderData {
    final value = _orderData;
    if (value == null) return null;
    if (_orderData is EqualUnmodifiableListView) return _orderData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? deliveryCharge;
  @override
  final double? total;

  @override
  String toString() {
    return 'OrderDataTableModel(orderData: $orderData, deliveryCharge: $deliveryCharge, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderDataTableModel &&
            const DeepCollectionEquality()
                .equals(other._orderData, _orderData) &&
            (identical(other.deliveryCharge, deliveryCharge) ||
                other.deliveryCharge == deliveryCharge) &&
            (identical(other.total, total) || other.total == total));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_orderData), deliveryCharge, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderDataTableModelCopyWith<_$_OrderDataTableModel> get copyWith =>
      __$$_OrderDataTableModelCopyWithImpl<_$_OrderDataTableModel>(
          this, _$identity);
}

abstract class _OrderDataTableModel implements OrderDataTableModel {
  const factory _OrderDataTableModel(
      {final List<OrderData>? orderData,
      final double? deliveryCharge,
      final double? total}) = _$_OrderDataTableModel;

  @override
  List<OrderData>? get orderData;
  @override
  double? get deliveryCharge;
  @override
  double? get total;
  @override
  @JsonKey(ignore: true)
  _$$_OrderDataTableModelCopyWith<_$_OrderDataTableModel> get copyWith =>
      throw _privateConstructorUsedError;
}
