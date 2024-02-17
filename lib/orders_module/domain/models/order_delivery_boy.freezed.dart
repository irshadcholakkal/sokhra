// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_delivery_boy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderDeliveryBoy _$OrderDeliveryBoyFromJson(Map<String, dynamic> json) {
  return _OrderDeliveryBoy.fromJson(json);
}

/// @nodoc
mixin _$OrderDeliveryBoy {
  String? get name => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderDeliveryBoyCopyWith<OrderDeliveryBoy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDeliveryBoyCopyWith<$Res> {
  factory $OrderDeliveryBoyCopyWith(
          OrderDeliveryBoy value, $Res Function(OrderDeliveryBoy) then) =
      _$OrderDeliveryBoyCopyWithImpl<$Res, OrderDeliveryBoy>;
  @useResult
  $Res call({String? name, String? phone});
}

/// @nodoc
class _$OrderDeliveryBoyCopyWithImpl<$Res, $Val extends OrderDeliveryBoy>
    implements $OrderDeliveryBoyCopyWith<$Res> {
  _$OrderDeliveryBoyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? phone = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderDeliveryBoyCopyWith<$Res>
    implements $OrderDeliveryBoyCopyWith<$Res> {
  factory _$$_OrderDeliveryBoyCopyWith(
          _$_OrderDeliveryBoy value, $Res Function(_$_OrderDeliveryBoy) then) =
      __$$_OrderDeliveryBoyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? phone});
}

/// @nodoc
class __$$_OrderDeliveryBoyCopyWithImpl<$Res>
    extends _$OrderDeliveryBoyCopyWithImpl<$Res, _$_OrderDeliveryBoy>
    implements _$$_OrderDeliveryBoyCopyWith<$Res> {
  __$$_OrderDeliveryBoyCopyWithImpl(
      _$_OrderDeliveryBoy _value, $Res Function(_$_OrderDeliveryBoy) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? phone = freezed,
  }) {
    return _then(_$_OrderDeliveryBoy(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_OrderDeliveryBoy implements _OrderDeliveryBoy {
  const _$_OrderDeliveryBoy({this.name, this.phone});

  factory _$_OrderDeliveryBoy.fromJson(Map<String, dynamic> json) =>
      _$$_OrderDeliveryBoyFromJson(json);

  @override
  final String? name;
  @override
  final String? phone;

  @override
  String toString() {
    return 'OrderDeliveryBoy(name: $name, phone: $phone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderDeliveryBoy &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderDeliveryBoyCopyWith<_$_OrderDeliveryBoy> get copyWith =>
      __$$_OrderDeliveryBoyCopyWithImpl<_$_OrderDeliveryBoy>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderDeliveryBoyToJson(
      this,
    );
  }
}

abstract class _OrderDeliveryBoy implements OrderDeliveryBoy {
  const factory _OrderDeliveryBoy({final String? name, final String? phone}) =
      _$_OrderDeliveryBoy;

  factory _OrderDeliveryBoy.fromJson(Map<String, dynamic> json) =
      _$_OrderDeliveryBoy.fromJson;

  @override
  String? get name;
  @override
  String? get phone;
  @override
  @JsonKey(ignore: true)
  _$$_OrderDeliveryBoyCopyWith<_$_OrderDeliveryBoy> get copyWith =>
      throw _privateConstructorUsedError;
}
