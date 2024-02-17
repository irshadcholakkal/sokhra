// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_wallet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerWallet _$CustomerWalletFromJson(Map<String, dynamic> json) {
  return _CustomerWallet.fromJson(json);
}

/// @nodoc
mixin _$CustomerWallet {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  double? get credit => throw _privateConstructorUsedError;
  double? get debit => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String? get paymentId => throw _privateConstructorUsedError;
  String? get orderId => throw _privateConstructorUsedError;
  String? get referrence => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerWalletCopyWith<CustomerWallet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerWalletCopyWith<$Res> {
  factory $CustomerWalletCopyWith(
          CustomerWallet value, $Res Function(CustomerWallet) then) =
      _$CustomerWalletCopyWithImpl<$Res, CustomerWallet>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      User? user,
      double? credit,
      double? debit,
      String? note,
      String? paymentId,
      String? orderId,
      String? referrence,
      String? type,
      String? status,
      String? createdAt});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$CustomerWalletCopyWithImpl<$Res, $Val extends CustomerWallet>
    implements $CustomerWalletCopyWith<$Res> {
  _$CustomerWalletCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? credit = freezed,
    Object? debit = freezed,
    Object? note = freezed,
    Object? paymentId = freezed,
    Object? orderId = freezed,
    Object? referrence = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
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
      credit: freezed == credit
          ? _value.credit
          : credit // ignore: cast_nullable_to_non_nullable
              as double?,
      debit: freezed == debit
          ? _value.debit
          : debit // ignore: cast_nullable_to_non_nullable
              as double?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      referrence: freezed == referrence
          ? _value.referrence
          : referrence // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$_CustomerWalletCopyWith<$Res>
    implements $CustomerWalletCopyWith<$Res> {
  factory _$$_CustomerWalletCopyWith(
          _$_CustomerWallet value, $Res Function(_$_CustomerWallet) then) =
      __$$_CustomerWalletCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      User? user,
      double? credit,
      double? debit,
      String? note,
      String? paymentId,
      String? orderId,
      String? referrence,
      String? type,
      String? status,
      String? createdAt});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_CustomerWalletCopyWithImpl<$Res>
    extends _$CustomerWalletCopyWithImpl<$Res, _$_CustomerWallet>
    implements _$$_CustomerWalletCopyWith<$Res> {
  __$$_CustomerWalletCopyWithImpl(
      _$_CustomerWallet _value, $Res Function(_$_CustomerWallet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? credit = freezed,
    Object? debit = freezed,
    Object? note = freezed,
    Object? paymentId = freezed,
    Object? orderId = freezed,
    Object? referrence = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_CustomerWallet(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      credit: freezed == credit
          ? _value.credit
          : credit // ignore: cast_nullable_to_non_nullable
              as double?,
      debit: freezed == debit
          ? _value.debit
          : debit // ignore: cast_nullable_to_non_nullable
              as double?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      referrence: freezed == referrence
          ? _value.referrence
          : referrence // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_CustomerWallet implements _CustomerWallet {
  const _$_CustomerWallet(
      {@JsonKey(name: "_id") this.id,
      this.user,
      this.credit,
      this.debit,
      this.note,
      this.paymentId,
      this.orderId,
      this.referrence,
      this.type,
      this.status,
      this.createdAt});

  factory _$_CustomerWallet.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerWalletFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  final User? user;
  @override
  final double? credit;
  @override
  final double? debit;
  @override
  final String? note;
  @override
  final String? paymentId;
  @override
  final String? orderId;
  @override
  final String? referrence;
  @override
  final String? type;
  @override
  final String? status;
  @override
  final String? createdAt;

  @override
  String toString() {
    return 'CustomerWallet(id: $id, user: $user, credit: $credit, debit: $debit, note: $note, paymentId: $paymentId, orderId: $orderId, referrence: $referrence, type: $type, status: $status, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerWallet &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.credit, credit) || other.credit == credit) &&
            (identical(other.debit, debit) || other.debit == debit) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.referrence, referrence) ||
                other.referrence == referrence) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, user, credit, debit, note,
      paymentId, orderId, referrence, type, status, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerWalletCopyWith<_$_CustomerWallet> get copyWith =>
      __$$_CustomerWalletCopyWithImpl<_$_CustomerWallet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerWalletToJson(
      this,
    );
  }
}

abstract class _CustomerWallet implements CustomerWallet {
  const factory _CustomerWallet(
      {@JsonKey(name: "_id") final String? id,
      final User? user,
      final double? credit,
      final double? debit,
      final String? note,
      final String? paymentId,
      final String? orderId,
      final String? referrence,
      final String? type,
      final String? status,
      final String? createdAt}) = _$_CustomerWallet;

  factory _CustomerWallet.fromJson(Map<String, dynamic> json) =
      _$_CustomerWallet.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  User? get user;
  @override
  double? get credit;
  @override
  double? get debit;
  @override
  String? get note;
  @override
  String? get paymentId;
  @override
  String? get orderId;
  @override
  String? get referrence;
  @override
  String? get type;
  @override
  String? get status;
  @override
  String? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerWalletCopyWith<_$_CustomerWallet> get copyWith =>
      throw _privateConstructorUsedError;
}
