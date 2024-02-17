// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_balance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WalletBalance _$WalletBalanceFromJson(Map<String, dynamic> json) {
  return _WalletBalance.fromJson(json);
}

/// @nodoc
mixin _$WalletBalance {
  @JsonValue(0.0)
  double? get balance => throw _privateConstructorUsedError;
  @JsonValue(0.0)
  double? get credit => throw _privateConstructorUsedError;
  @JsonValue(0.0)
  double? get effBalance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletBalanceCopyWith<WalletBalance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletBalanceCopyWith<$Res> {
  factory $WalletBalanceCopyWith(
          WalletBalance value, $Res Function(WalletBalance) then) =
      _$WalletBalanceCopyWithImpl<$Res, WalletBalance>;
  @useResult
  $Res call(
      {@JsonValue(0.0) double? balance,
      @JsonValue(0.0) double? credit,
      @JsonValue(0.0) double? effBalance});
}

/// @nodoc
class _$WalletBalanceCopyWithImpl<$Res, $Val extends WalletBalance>
    implements $WalletBalanceCopyWith<$Res> {
  _$WalletBalanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = freezed,
    Object? credit = freezed,
    Object? effBalance = freezed,
  }) {
    return _then(_value.copyWith(
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      credit: freezed == credit
          ? _value.credit
          : credit // ignore: cast_nullable_to_non_nullable
              as double?,
      effBalance: freezed == effBalance
          ? _value.effBalance
          : effBalance // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WalletBalanceCopyWith<$Res>
    implements $WalletBalanceCopyWith<$Res> {
  factory _$$_WalletBalanceCopyWith(
          _$_WalletBalance value, $Res Function(_$_WalletBalance) then) =
      __$$_WalletBalanceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonValue(0.0) double? balance,
      @JsonValue(0.0) double? credit,
      @JsonValue(0.0) double? effBalance});
}

/// @nodoc
class __$$_WalletBalanceCopyWithImpl<$Res>
    extends _$WalletBalanceCopyWithImpl<$Res, _$_WalletBalance>
    implements _$$_WalletBalanceCopyWith<$Res> {
  __$$_WalletBalanceCopyWithImpl(
      _$_WalletBalance _value, $Res Function(_$_WalletBalance) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = freezed,
    Object? credit = freezed,
    Object? effBalance = freezed,
  }) {
    return _then(_$_WalletBalance(
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      credit: freezed == credit
          ? _value.credit
          : credit // ignore: cast_nullable_to_non_nullable
              as double?,
      effBalance: freezed == effBalance
          ? _value.effBalance
          : effBalance // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_WalletBalance implements _WalletBalance {
  const _$_WalletBalance(
      {@JsonValue(0.0) this.balance,
      @JsonValue(0.0) this.credit,
      @JsonValue(0.0) this.effBalance});

  factory _$_WalletBalance.fromJson(Map<String, dynamic> json) =>
      _$$_WalletBalanceFromJson(json);

  @override
  @JsonValue(0.0)
  final double? balance;
  @override
  @JsonValue(0.0)
  final double? credit;
  @override
  @JsonValue(0.0)
  final double? effBalance;

  @override
  String toString() {
    return 'WalletBalance(balance: $balance, credit: $credit, effBalance: $effBalance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WalletBalance &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.credit, credit) || other.credit == credit) &&
            (identical(other.effBalance, effBalance) ||
                other.effBalance == effBalance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, balance, credit, effBalance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WalletBalanceCopyWith<_$_WalletBalance> get copyWith =>
      __$$_WalletBalanceCopyWithImpl<_$_WalletBalance>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WalletBalanceToJson(
      this,
    );
  }
}

abstract class _WalletBalance implements WalletBalance {
  const factory _WalletBalance(
      {@JsonValue(0.0) final double? balance,
      @JsonValue(0.0) final double? credit,
      @JsonValue(0.0) final double? effBalance}) = _$_WalletBalance;

  factory _WalletBalance.fromJson(Map<String, dynamic> json) =
      _$_WalletBalance.fromJson;

  @override
  @JsonValue(0.0)
  double? get balance;
  @override
  @JsonValue(0.0)
  double? get credit;
  @override
  @JsonValue(0.0)
  double? get effBalance;
  @override
  @JsonKey(ignore: true)
  _$$_WalletBalanceCopyWith<_$_WalletBalance> get copyWith =>
      throw _privateConstructorUsedError;
}
