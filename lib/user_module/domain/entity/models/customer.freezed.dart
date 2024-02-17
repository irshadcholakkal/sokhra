// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return _Customer.fromJson(json);
}

/// @nodoc
mixin _$Customer {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  String? get customerId => throw _privateConstructorUsedError;
  String? get discountCode => throw _privateConstructorUsedError;
  bool? get creditEnabled => throw _privateConstructorUsedError;
  double? get creditLimit => throw _privateConstructorUsedError;
  List<ShippingAddress>? get addressDetails =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerCopyWith<Customer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCopyWith<$Res> {
  factory $CustomerCopyWith(Customer value, $Res Function(Customer) then) =
      _$CustomerCopyWithImpl<$Res, Customer>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      User? user,
      String? customerId,
      String? discountCode,
      bool? creditEnabled,
      double? creditLimit,
      List<ShippingAddress>? addressDetails});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$CustomerCopyWithImpl<$Res, $Val extends Customer>
    implements $CustomerCopyWith<$Res> {
  _$CustomerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? customerId = freezed,
    Object? discountCode = freezed,
    Object? creditEnabled = freezed,
    Object? creditLimit = freezed,
    Object? addressDetails = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      discountCode: freezed == discountCode
          ? _value.discountCode
          : discountCode // ignore: cast_nullable_to_non_nullable
              as String?,
      creditEnabled: freezed == creditEnabled
          ? _value.creditEnabled
          : creditEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      creditLimit: freezed == creditLimit
          ? _value.creditLimit
          : creditLimit // ignore: cast_nullable_to_non_nullable
              as double?,
      addressDetails: freezed == addressDetails
          ? _value.addressDetails
          : addressDetails // ignore: cast_nullable_to_non_nullable
              as List<ShippingAddress>?,
    ) as $Val);
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
abstract class _$$_CustomerCopyWith<$Res> implements $CustomerCopyWith<$Res> {
  factory _$$_CustomerCopyWith(
          _$_Customer value, $Res Function(_$_Customer) then) =
      __$$_CustomerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      User? user,
      String? customerId,
      String? discountCode,
      bool? creditEnabled,
      double? creditLimit,
      List<ShippingAddress>? addressDetails});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_CustomerCopyWithImpl<$Res>
    extends _$CustomerCopyWithImpl<$Res, _$_Customer>
    implements _$$_CustomerCopyWith<$Res> {
  __$$_CustomerCopyWithImpl(
      _$_Customer _value, $Res Function(_$_Customer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? customerId = freezed,
    Object? discountCode = freezed,
    Object? creditEnabled = freezed,
    Object? creditLimit = freezed,
    Object? addressDetails = freezed,
  }) {
    return _then(_$_Customer(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      discountCode: freezed == discountCode
          ? _value.discountCode
          : discountCode // ignore: cast_nullable_to_non_nullable
              as String?,
      creditEnabled: freezed == creditEnabled
          ? _value.creditEnabled
          : creditEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      creditLimit: freezed == creditLimit
          ? _value.creditLimit
          : creditLimit // ignore: cast_nullable_to_non_nullable
              as double?,
      addressDetails: freezed == addressDetails
          ? _value._addressDetails
          : addressDetails // ignore: cast_nullable_to_non_nullable
              as List<ShippingAddress>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_Customer implements _Customer {
  const _$_Customer(
      {@JsonKey(name: "_id") this.id,
      this.user,
      this.customerId,
      this.discountCode,
      this.creditEnabled,
      this.creditLimit,
      final List<ShippingAddress>? addressDetails})
      : _addressDetails = addressDetails;

  factory _$_Customer.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  final User? user;
  @override
  final String? customerId;
  @override
  final String? discountCode;
  @override
  final bool? creditEnabled;
  @override
  final double? creditLimit;
  final List<ShippingAddress>? _addressDetails;
  @override
  List<ShippingAddress>? get addressDetails {
    final value = _addressDetails;
    if (value == null) return null;
    if (_addressDetails is EqualUnmodifiableListView) return _addressDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Customer(id: $id, user: $user, customerId: $customerId, discountCode: $discountCode, creditEnabled: $creditEnabled, creditLimit: $creditLimit, addressDetails: $addressDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Customer &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.discountCode, discountCode) ||
                other.discountCode == discountCode) &&
            (identical(other.creditEnabled, creditEnabled) ||
                other.creditEnabled == creditEnabled) &&
            (identical(other.creditLimit, creditLimit) ||
                other.creditLimit == creditLimit) &&
            const DeepCollectionEquality()
                .equals(other._addressDetails, _addressDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      user,
      customerId,
      discountCode,
      creditEnabled,
      creditLimit,
      const DeepCollectionEquality().hash(_addressDetails));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerCopyWith<_$_Customer> get copyWith =>
      __$$_CustomerCopyWithImpl<_$_Customer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerToJson(
      this,
    );
  }
}

abstract class _Customer implements Customer {
  const factory _Customer(
      {@JsonKey(name: "_id") final String? id,
      final User? user,
      final String? customerId,
      final String? discountCode,
      final bool? creditEnabled,
      final double? creditLimit,
      final List<ShippingAddress>? addressDetails}) = _$_Customer;

  factory _Customer.fromJson(Map<String, dynamic> json) = _$_Customer.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  User? get user;
  @override
  String? get customerId;
  @override
  String? get discountCode;
  @override
  bool? get creditEnabled;
  @override
  double? get creditLimit;
  @override
  List<ShippingAddress>? get addressDetails;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerCopyWith<_$_Customer> get copyWith =>
      throw _privateConstructorUsedError;
}
