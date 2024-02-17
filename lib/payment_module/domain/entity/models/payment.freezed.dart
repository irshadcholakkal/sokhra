// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Payment _$PaymentFromJson(Map<String, dynamic> json) {
  return _Payment.fromJson(json);
}

/// @nodoc
mixin _$Payment {
  User? get user => throw _privateConstructorUsedError;
  Seller? get seller => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  PaymentDetailsServer? get paymentDetails =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentCopyWith<Payment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCopyWith<$Res> {
  factory $PaymentCopyWith(Payment value, $Res Function(Payment) then) =
      _$PaymentCopyWithImpl<$Res, Payment>;
  @useResult
  $Res call(
      {User? user,
      Seller? seller,
      double? amount,
      String? status,
      PaymentDetailsServer? paymentDetails});

  $UserCopyWith<$Res>? get user;
  $SellerCopyWith<$Res>? get seller;
  $PaymentDetailsServerCopyWith<$Res>? get paymentDetails;
}

/// @nodoc
class _$PaymentCopyWithImpl<$Res, $Val extends Payment>
    implements $PaymentCopyWith<$Res> {
  _$PaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? seller = freezed,
    Object? amount = freezed,
    Object? status = freezed,
    Object? paymentDetails = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      seller: freezed == seller
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as Seller?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentDetails: freezed == paymentDetails
          ? _value.paymentDetails
          : paymentDetails // ignore: cast_nullable_to_non_nullable
              as PaymentDetailsServer?,
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

  @override
  @pragma('vm:prefer-inline')
  $SellerCopyWith<$Res>? get seller {
    if (_value.seller == null) {
      return null;
    }

    return $SellerCopyWith<$Res>(_value.seller!, (value) {
      return _then(_value.copyWith(seller: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentDetailsServerCopyWith<$Res>? get paymentDetails {
    if (_value.paymentDetails == null) {
      return null;
    }

    return $PaymentDetailsServerCopyWith<$Res>(_value.paymentDetails!, (value) {
      return _then(_value.copyWith(paymentDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PaymentCopyWith<$Res> implements $PaymentCopyWith<$Res> {
  factory _$$_PaymentCopyWith(
          _$_Payment value, $Res Function(_$_Payment) then) =
      __$$_PaymentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {User? user,
      Seller? seller,
      double? amount,
      String? status,
      PaymentDetailsServer? paymentDetails});

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $SellerCopyWith<$Res>? get seller;
  @override
  $PaymentDetailsServerCopyWith<$Res>? get paymentDetails;
}

/// @nodoc
class __$$_PaymentCopyWithImpl<$Res>
    extends _$PaymentCopyWithImpl<$Res, _$_Payment>
    implements _$$_PaymentCopyWith<$Res> {
  __$$_PaymentCopyWithImpl(_$_Payment _value, $Res Function(_$_Payment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? seller = freezed,
    Object? amount = freezed,
    Object? status = freezed,
    Object? paymentDetails = freezed,
  }) {
    return _then(_$_Payment(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      seller: freezed == seller
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as Seller?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentDetails: freezed == paymentDetails
          ? _value.paymentDetails
          : paymentDetails // ignore: cast_nullable_to_non_nullable
              as PaymentDetailsServer?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_Payment implements _Payment {
  const _$_Payment(
      {this.user, this.seller, this.amount, this.status, this.paymentDetails});

  factory _$_Payment.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentFromJson(json);

  @override
  final User? user;
  @override
  final Seller? seller;
  @override
  final double? amount;
  @override
  final String? status;
  @override
  final PaymentDetailsServer? paymentDetails;

  @override
  String toString() {
    return 'Payment(user: $user, seller: $seller, amount: $amount, status: $status, paymentDetails: $paymentDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Payment &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.seller, seller) || other.seller == seller) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentDetails, paymentDetails) ||
                other.paymentDetails == paymentDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, user, seller, amount, status, paymentDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentCopyWith<_$_Payment> get copyWith =>
      __$$_PaymentCopyWithImpl<_$_Payment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentToJson(
      this,
    );
  }
}

abstract class _Payment implements Payment {
  const factory _Payment(
      {final User? user,
      final Seller? seller,
      final double? amount,
      final String? status,
      final PaymentDetailsServer? paymentDetails}) = _$_Payment;

  factory _Payment.fromJson(Map<String, dynamic> json) = _$_Payment.fromJson;

  @override
  User? get user;
  @override
  Seller? get seller;
  @override
  double? get amount;
  @override
  String? get status;
  @override
  PaymentDetailsServer? get paymentDetails;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentCopyWith<_$_Payment> get copyWith =>
      throw _privateConstructorUsedError;
}
