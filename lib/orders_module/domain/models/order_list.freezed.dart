// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderList _$OrderListFromJson(Map<String, dynamic> json) {
  return _OrderList.fromJson(json);
}

/// @nodoc
mixin _$OrderList {
  int? get totalCount => throw _privateConstructorUsedError;
  @JsonValue([])
  List<Order>? get orders => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderListCopyWith<OrderList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderListCopyWith<$Res> {
  factory $OrderListCopyWith(OrderList value, $Res Function(OrderList) then) =
      _$OrderListCopyWithImpl<$Res, OrderList>;
  @useResult
  $Res call({int? totalCount, @JsonValue([]) List<Order>? orders});
}

/// @nodoc
class _$OrderListCopyWithImpl<$Res, $Val extends OrderList>
    implements $OrderListCopyWith<$Res> {
  _$OrderListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = freezed,
    Object? orders = freezed,
  }) {
    return _then(_value.copyWith(
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      orders: freezed == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<Order>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderListCopyWith<$Res> implements $OrderListCopyWith<$Res> {
  factory _$$_OrderListCopyWith(
          _$_OrderList value, $Res Function(_$_OrderList) then) =
      __$$_OrderListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? totalCount, @JsonValue([]) List<Order>? orders});
}

/// @nodoc
class __$$_OrderListCopyWithImpl<$Res>
    extends _$OrderListCopyWithImpl<$Res, _$_OrderList>
    implements _$$_OrderListCopyWith<$Res> {
  __$$_OrderListCopyWithImpl(
      _$_OrderList _value, $Res Function(_$_OrderList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = freezed,
    Object? orders = freezed,
  }) {
    return _then(_$_OrderList(
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      orders: freezed == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<Order>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_OrderList implements _OrderList {
  const _$_OrderList(
      {this.totalCount, @JsonValue([]) final List<Order>? orders})
      : _orders = orders;

  factory _$_OrderList.fromJson(Map<String, dynamic> json) =>
      _$$_OrderListFromJson(json);

  @override
  final int? totalCount;
  final List<Order>? _orders;
  @override
  @JsonValue([])
  List<Order>? get orders {
    final value = _orders;
    if (value == null) return null;
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'OrderList(totalCount: $totalCount, orders: $orders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderList &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            const DeepCollectionEquality().equals(other._orders, _orders));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, totalCount, const DeepCollectionEquality().hash(_orders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderListCopyWith<_$_OrderList> get copyWith =>
      __$$_OrderListCopyWithImpl<_$_OrderList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderListToJson(
      this,
    );
  }
}

abstract class _OrderList implements OrderList {
  const factory _OrderList(
      {final int? totalCount,
      @JsonValue([]) final List<Order>? orders}) = _$_OrderList;

  factory _OrderList.fromJson(Map<String, dynamic> json) =
      _$_OrderList.fromJson;

  @override
  int? get totalCount;
  @override
  @JsonValue([])
  List<Order>? get orders;
  @override
  @JsonKey(ignore: true)
  _$$_OrderListCopyWith<_$_OrderList> get copyWith =>
      throw _privateConstructorUsedError;
}
