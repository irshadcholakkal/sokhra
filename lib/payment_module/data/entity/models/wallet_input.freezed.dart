// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WalletInput _$WalletInputFromJson(Map<String, dynamic> json) {
  return _WalletInput.fromJson(json);
}

/// @nodoc
mixin _$WalletInput {
  double? get credit => throw _privateConstructorUsedError;
  double? get debit => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String? get paymentId => throw _privateConstructorUsedError;
  String? get orderId => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get referrenceId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletInputCopyWith<WalletInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletInputCopyWith<$Res> {
  factory $WalletInputCopyWith(
          WalletInput value, $Res Function(WalletInput) then) =
      _$WalletInputCopyWithImpl<$Res, WalletInput>;
  @useResult
  $Res call(
      {double? credit,
      double? debit,
      String? note,
      String? paymentId,
      String? orderId,
      String? type,
      String? status,
      String? referrenceId});
}

/// @nodoc
class _$WalletInputCopyWithImpl<$Res, $Val extends WalletInput>
    implements $WalletInputCopyWith<$Res> {
  _$WalletInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? credit = freezed,
    Object? debit = freezed,
    Object? note = freezed,
    Object? paymentId = freezed,
    Object? orderId = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? referrenceId = freezed,
  }) {
    return _then(_value.copyWith(
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
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      referrenceId: freezed == referrenceId
          ? _value.referrenceId
          : referrenceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WalletInputCopyWith<$Res>
    implements $WalletInputCopyWith<$Res> {
  factory _$$_WalletInputCopyWith(
          _$_WalletInput value, $Res Function(_$_WalletInput) then) =
      __$$_WalletInputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? credit,
      double? debit,
      String? note,
      String? paymentId,
      String? orderId,
      String? type,
      String? status,
      String? referrenceId});
}

/// @nodoc
class __$$_WalletInputCopyWithImpl<$Res>
    extends _$WalletInputCopyWithImpl<$Res, _$_WalletInput>
    implements _$$_WalletInputCopyWith<$Res> {
  __$$_WalletInputCopyWithImpl(
      _$_WalletInput _value, $Res Function(_$_WalletInput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? credit = freezed,
    Object? debit = freezed,
    Object? note = freezed,
    Object? paymentId = freezed,
    Object? orderId = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? referrenceId = freezed,
  }) {
    return _then(_$_WalletInput(
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
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      referrenceId: freezed == referrenceId
          ? _value.referrenceId
          : referrenceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_WalletInput implements _WalletInput {
  const _$_WalletInput(
      {this.credit,
      this.debit,
      this.note = "",
      required this.paymentId,
      required this.orderId,
      this.type = "",
      this.status = "",
      required this.referrenceId});

  factory _$_WalletInput.fromJson(Map<String, dynamic> json) =>
      _$$_WalletInputFromJson(json);

  @override
  final double? credit;
  @override
  final double? debit;
  @override
  @JsonKey()
  final String? note;
  @override
  final String? paymentId;
  @override
  final String? orderId;
  @override
  @JsonKey()
  final String? type;
  @override
  @JsonKey()
  final String? status;
  @override
  final String? referrenceId;

  @override
  String toString() {
    return 'WalletInput(credit: $credit, debit: $debit, note: $note, paymentId: $paymentId, orderId: $orderId, type: $type, status: $status, referrenceId: $referrenceId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WalletInput &&
            (identical(other.credit, credit) || other.credit == credit) &&
            (identical(other.debit, debit) || other.debit == debit) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.referrenceId, referrenceId) ||
                other.referrenceId == referrenceId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, credit, debit, note, paymentId,
      orderId, type, status, referrenceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WalletInputCopyWith<_$_WalletInput> get copyWith =>
      __$$_WalletInputCopyWithImpl<_$_WalletInput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WalletInputToJson(
      this,
    );
  }
}

abstract class _WalletInput implements WalletInput {
  const factory _WalletInput(
      {final double? credit,
      final double? debit,
      final String? note,
      required final String? paymentId,
      required final String? orderId,
      final String? type,
      final String? status,
      required final String? referrenceId}) = _$_WalletInput;

  factory _WalletInput.fromJson(Map<String, dynamic> json) =
      _$_WalletInput.fromJson;

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
  String? get type;
  @override
  String? get status;
  @override
  String? get referrenceId;
  @override
  @JsonKey(ignore: true)
  _$$_WalletInputCopyWith<_$_WalletInput> get copyWith =>
      throw _privateConstructorUsedError;
}
