// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'initiate_payment_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InitiatePaymentResponse _$InitiatePaymentResponseFromJson(
    Map<String, dynamic> json) {
  return _InitiatePaymentResponse.fromJson(json);
}

/// @nodoc
mixin _$InitiatePaymentResponse {
  String? get pendingOrderId => throw _privateConstructorUsedError;
  String? get referrenceId => throw _privateConstructorUsedError;
  String? get gatewayId => throw _privateConstructorUsedError;
  String? get gatewayReceipt => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InitiatePaymentResponseCopyWith<InitiatePaymentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitiatePaymentResponseCopyWith<$Res> {
  factory $InitiatePaymentResponseCopyWith(InitiatePaymentResponse value,
          $Res Function(InitiatePaymentResponse) then) =
      _$InitiatePaymentResponseCopyWithImpl<$Res, InitiatePaymentResponse>;
  @useResult
  $Res call(
      {String? pendingOrderId,
      String? referrenceId,
      String? gatewayId,
      String? gatewayReceipt,
      double? amount,
      String? status});
}

/// @nodoc
class _$InitiatePaymentResponseCopyWithImpl<$Res,
        $Val extends InitiatePaymentResponse>
    implements $InitiatePaymentResponseCopyWith<$Res> {
  _$InitiatePaymentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pendingOrderId = freezed,
    Object? referrenceId = freezed,
    Object? gatewayId = freezed,
    Object? gatewayReceipt = freezed,
    Object? amount = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      pendingOrderId: freezed == pendingOrderId
          ? _value.pendingOrderId
          : pendingOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      referrenceId: freezed == referrenceId
          ? _value.referrenceId
          : referrenceId // ignore: cast_nullable_to_non_nullable
              as String?,
      gatewayId: freezed == gatewayId
          ? _value.gatewayId
          : gatewayId // ignore: cast_nullable_to_non_nullable
              as String?,
      gatewayReceipt: freezed == gatewayReceipt
          ? _value.gatewayReceipt
          : gatewayReceipt // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitiatePaymentResponseCopyWith<$Res>
    implements $InitiatePaymentResponseCopyWith<$Res> {
  factory _$$_InitiatePaymentResponseCopyWith(_$_InitiatePaymentResponse value,
          $Res Function(_$_InitiatePaymentResponse) then) =
      __$$_InitiatePaymentResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? pendingOrderId,
      String? referrenceId,
      String? gatewayId,
      String? gatewayReceipt,
      double? amount,
      String? status});
}

/// @nodoc
class __$$_InitiatePaymentResponseCopyWithImpl<$Res>
    extends _$InitiatePaymentResponseCopyWithImpl<$Res,
        _$_InitiatePaymentResponse>
    implements _$$_InitiatePaymentResponseCopyWith<$Res> {
  __$$_InitiatePaymentResponseCopyWithImpl(_$_InitiatePaymentResponse _value,
      $Res Function(_$_InitiatePaymentResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pendingOrderId = freezed,
    Object? referrenceId = freezed,
    Object? gatewayId = freezed,
    Object? gatewayReceipt = freezed,
    Object? amount = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_InitiatePaymentResponse(
      pendingOrderId: freezed == pendingOrderId
          ? _value.pendingOrderId
          : pendingOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      referrenceId: freezed == referrenceId
          ? _value.referrenceId
          : referrenceId // ignore: cast_nullable_to_non_nullable
              as String?,
      gatewayId: freezed == gatewayId
          ? _value.gatewayId
          : gatewayId // ignore: cast_nullable_to_non_nullable
              as String?,
      gatewayReceipt: freezed == gatewayReceipt
          ? _value.gatewayReceipt
          : gatewayReceipt // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_InitiatePaymentResponse implements _InitiatePaymentResponse {
  const _$_InitiatePaymentResponse(
      {this.pendingOrderId,
      this.referrenceId,
      this.gatewayId,
      this.gatewayReceipt,
      this.amount,
      this.status});

  factory _$_InitiatePaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$$_InitiatePaymentResponseFromJson(json);

  @override
  final String? pendingOrderId;
  @override
  final String? referrenceId;
  @override
  final String? gatewayId;
  @override
  final String? gatewayReceipt;
  @override
  final double? amount;
  @override
  final String? status;

  @override
  String toString() {
    return 'InitiatePaymentResponse(pendingOrderId: $pendingOrderId, referrenceId: $referrenceId, gatewayId: $gatewayId, gatewayReceipt: $gatewayReceipt, amount: $amount, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InitiatePaymentResponse &&
            (identical(other.pendingOrderId, pendingOrderId) ||
                other.pendingOrderId == pendingOrderId) &&
            (identical(other.referrenceId, referrenceId) ||
                other.referrenceId == referrenceId) &&
            (identical(other.gatewayId, gatewayId) ||
                other.gatewayId == gatewayId) &&
            (identical(other.gatewayReceipt, gatewayReceipt) ||
                other.gatewayReceipt == gatewayReceipt) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pendingOrderId, referrenceId,
      gatewayId, gatewayReceipt, amount, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitiatePaymentResponseCopyWith<_$_InitiatePaymentResponse>
      get copyWith =>
          __$$_InitiatePaymentResponseCopyWithImpl<_$_InitiatePaymentResponse>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InitiatePaymentResponseToJson(
      this,
    );
  }
}

abstract class _InitiatePaymentResponse implements InitiatePaymentResponse {
  const factory _InitiatePaymentResponse(
      {final String? pendingOrderId,
      final String? referrenceId,
      final String? gatewayId,
      final String? gatewayReceipt,
      final double? amount,
      final String? status}) = _$_InitiatePaymentResponse;

  factory _InitiatePaymentResponse.fromJson(Map<String, dynamic> json) =
      _$_InitiatePaymentResponse.fromJson;

  @override
  String? get pendingOrderId;
  @override
  String? get referrenceId;
  @override
  String? get gatewayId;
  @override
  String? get gatewayReceipt;
  @override
  double? get amount;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$_InitiatePaymentResponseCopyWith<_$_InitiatePaymentResponse>
      get copyWith => throw _privateConstructorUsedError;
}
