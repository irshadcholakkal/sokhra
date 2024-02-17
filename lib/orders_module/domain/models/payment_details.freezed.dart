// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentDetails _$PaymentDetailsFromJson(Map<String, dynamic> json) {
  return _PaymentDetails.fromJson(json);
}

/// @nodoc
mixin _$PaymentDetails {
  String? get status => throw _privateConstructorUsedError;
  double? get invoiceAmount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentDetailsCopyWith<PaymentDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentDetailsCopyWith<$Res> {
  factory $PaymentDetailsCopyWith(
          PaymentDetails value, $Res Function(PaymentDetails) then) =
      _$PaymentDetailsCopyWithImpl<$Res, PaymentDetails>;
  @useResult
  $Res call({String? status, double? invoiceAmount});
}

/// @nodoc
class _$PaymentDetailsCopyWithImpl<$Res, $Val extends PaymentDetails>
    implements $PaymentDetailsCopyWith<$Res> {
  _$PaymentDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? invoiceAmount = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      invoiceAmount: freezed == invoiceAmount
          ? _value.invoiceAmount
          : invoiceAmount // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentDetailsCopyWith<$Res>
    implements $PaymentDetailsCopyWith<$Res> {
  factory _$$_PaymentDetailsCopyWith(
          _$_PaymentDetails value, $Res Function(_$_PaymentDetails) then) =
      __$$_PaymentDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, double? invoiceAmount});
}

/// @nodoc
class __$$_PaymentDetailsCopyWithImpl<$Res>
    extends _$PaymentDetailsCopyWithImpl<$Res, _$_PaymentDetails>
    implements _$$_PaymentDetailsCopyWith<$Res> {
  __$$_PaymentDetailsCopyWithImpl(
      _$_PaymentDetails _value, $Res Function(_$_PaymentDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? invoiceAmount = freezed,
  }) {
    return _then(_$_PaymentDetails(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      invoiceAmount: freezed == invoiceAmount
          ? _value.invoiceAmount
          : invoiceAmount // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_PaymentDetails implements _PaymentDetails {
  const _$_PaymentDetails({this.status, this.invoiceAmount});

  factory _$_PaymentDetails.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentDetailsFromJson(json);

  @override
  final String? status;
  @override
  final double? invoiceAmount;

  @override
  String toString() {
    return 'PaymentDetails(status: $status, invoiceAmount: $invoiceAmount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentDetails &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.invoiceAmount, invoiceAmount) ||
                other.invoiceAmount == invoiceAmount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, invoiceAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentDetailsCopyWith<_$_PaymentDetails> get copyWith =>
      __$$_PaymentDetailsCopyWithImpl<_$_PaymentDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentDetailsToJson(
      this,
    );
  }
}

abstract class _PaymentDetails implements PaymentDetails {
  const factory _PaymentDetails(
      {final String? status, final double? invoiceAmount}) = _$_PaymentDetails;

  factory _PaymentDetails.fromJson(Map<String, dynamic> json) =
      _$_PaymentDetails.fromJson;

  @override
  String? get status;
  @override
  double? get invoiceAmount;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentDetailsCopyWith<_$_PaymentDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
