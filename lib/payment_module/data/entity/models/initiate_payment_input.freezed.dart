// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'initiate_payment_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InitiatePaymentInput _$InitiatePaymentInputFromJson(Map<String, dynamic> json) {
  return _InitiatePaymentInput.fromJson(json);
}

/// @nodoc
mixin _$InitiatePaymentInput {
  String? get addressId => throw _privateConstructorUsedError;
  String? get deviceId => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  PaymentType get paymentType => throw _privateConstructorUsedError;
  double get invoiceAmount => throw _privateConstructorUsedError;
  double get promoDiscount => throw _privateConstructorUsedError;
  double get subTotal => throw _privateConstructorUsedError;
  String? get deliveryDate => throw _privateConstructorUsedError;
  String? get deliveryShift => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  File? get customerAudio =>
      throw _privateConstructorUsedError; // final String? customerAudio,
  bool get applyWallet => throw _privateConstructorUsedError;
  String? get promoCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InitiatePaymentInputCopyWith<InitiatePaymentInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitiatePaymentInputCopyWith<$Res> {
  factory $InitiatePaymentInputCopyWith(InitiatePaymentInput value,
          $Res Function(InitiatePaymentInput) then) =
      _$InitiatePaymentInputCopyWithImpl<$Res, InitiatePaymentInput>;
  @useResult
  $Res call(
      {String? addressId,
      String? deviceId,
      String? note,
      PaymentType paymentType,
      double invoiceAmount,
      double promoDiscount,
      double subTotal,
      String? deliveryDate,
      String? deliveryShift,
      @JsonKey(ignore: true) File? customerAudio,
      bool applyWallet,
      String? promoCode});
}

/// @nodoc
class _$InitiatePaymentInputCopyWithImpl<$Res,
        $Val extends InitiatePaymentInput>
    implements $InitiatePaymentInputCopyWith<$Res> {
  _$InitiatePaymentInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressId = freezed,
    Object? deviceId = freezed,
    Object? note = freezed,
    Object? paymentType = null,
    Object? invoiceAmount = null,
    Object? promoDiscount = null,
    Object? subTotal = null,
    Object? deliveryDate = freezed,
    Object? deliveryShift = freezed,
    Object? customerAudio = freezed,
    Object? applyWallet = null,
    Object? promoCode = freezed,
  }) {
    return _then(_value.copyWith(
      addressId: freezed == addressId
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as PaymentType,
      invoiceAmount: null == invoiceAmount
          ? _value.invoiceAmount
          : invoiceAmount // ignore: cast_nullable_to_non_nullable
              as double,
      promoDiscount: null == promoDiscount
          ? _value.promoDiscount
          : promoDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      subTotal: null == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryShift: freezed == deliveryShift
          ? _value.deliveryShift
          : deliveryShift // ignore: cast_nullable_to_non_nullable
              as String?,
      customerAudio: freezed == customerAudio
          ? _value.customerAudio
          : customerAudio // ignore: cast_nullable_to_non_nullable
              as File?,
      applyWallet: null == applyWallet
          ? _value.applyWallet
          : applyWallet // ignore: cast_nullable_to_non_nullable
              as bool,
      promoCode: freezed == promoCode
          ? _value.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitiatePaymentInputCopyWith<$Res>
    implements $InitiatePaymentInputCopyWith<$Res> {
  factory _$$_InitiatePaymentInputCopyWith(_$_InitiatePaymentInput value,
          $Res Function(_$_InitiatePaymentInput) then) =
      __$$_InitiatePaymentInputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? addressId,
      String? deviceId,
      String? note,
      PaymentType paymentType,
      double invoiceAmount,
      double promoDiscount,
      double subTotal,
      String? deliveryDate,
      String? deliveryShift,
      @JsonKey(ignore: true) File? customerAudio,
      bool applyWallet,
      String? promoCode});
}

/// @nodoc
class __$$_InitiatePaymentInputCopyWithImpl<$Res>
    extends _$InitiatePaymentInputCopyWithImpl<$Res, _$_InitiatePaymentInput>
    implements _$$_InitiatePaymentInputCopyWith<$Res> {
  __$$_InitiatePaymentInputCopyWithImpl(_$_InitiatePaymentInput _value,
      $Res Function(_$_InitiatePaymentInput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressId = freezed,
    Object? deviceId = freezed,
    Object? note = freezed,
    Object? paymentType = null,
    Object? invoiceAmount = null,
    Object? promoDiscount = null,
    Object? subTotal = null,
    Object? deliveryDate = freezed,
    Object? deliveryShift = freezed,
    Object? customerAudio = freezed,
    Object? applyWallet = null,
    Object? promoCode = freezed,
  }) {
    return _then(_$_InitiatePaymentInput(
      addressId: freezed == addressId
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as PaymentType,
      invoiceAmount: null == invoiceAmount
          ? _value.invoiceAmount
          : invoiceAmount // ignore: cast_nullable_to_non_nullable
              as double,
      promoDiscount: null == promoDiscount
          ? _value.promoDiscount
          : promoDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      subTotal: null == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryShift: freezed == deliveryShift
          ? _value.deliveryShift
          : deliveryShift // ignore: cast_nullable_to_non_nullable
              as String?,
      customerAudio: freezed == customerAudio
          ? _value.customerAudio
          : customerAudio // ignore: cast_nullable_to_non_nullable
              as File?,
      applyWallet: null == applyWallet
          ? _value.applyWallet
          : applyWallet // ignore: cast_nullable_to_non_nullable
              as bool,
      promoCode: freezed == promoCode
          ? _value.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_InitiatePaymentInput implements _InitiatePaymentInput {
  const _$_InitiatePaymentInput(
      {required this.addressId,
      this.deviceId,
      this.note,
      required this.paymentType,
      required this.invoiceAmount,
      required this.promoDiscount,
      required this.subTotal,
      this.deliveryDate,
      this.deliveryShift,
      @JsonKey(ignore: true) this.customerAudio,
      this.applyWallet = false,
      this.promoCode});

  factory _$_InitiatePaymentInput.fromJson(Map<String, dynamic> json) =>
      _$$_InitiatePaymentInputFromJson(json);

  @override
  final String? addressId;
  @override
  final String? deviceId;
  @override
  final String? note;
  @override
  final PaymentType paymentType;
  @override
  final double invoiceAmount;
  @override
  final double promoDiscount;
  @override
  final double subTotal;
  @override
  final String? deliveryDate;
  @override
  final String? deliveryShift;
  @override
  @JsonKey(ignore: true)
  final File? customerAudio;
// final String? customerAudio,
  @override
  @JsonKey()
  final bool applyWallet;
  @override
  final String? promoCode;

  @override
  String toString() {
    return 'InitiatePaymentInput(addressId: $addressId, deviceId: $deviceId, note: $note, paymentType: $paymentType, invoiceAmount: $invoiceAmount, promoDiscount: $promoDiscount, subTotal: $subTotal, deliveryDate: $deliveryDate, deliveryShift: $deliveryShift, customerAudio: $customerAudio, applyWallet: $applyWallet, promoCode: $promoCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InitiatePaymentInput &&
            (identical(other.addressId, addressId) ||
                other.addressId == addressId) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.invoiceAmount, invoiceAmount) ||
                other.invoiceAmount == invoiceAmount) &&
            (identical(other.promoDiscount, promoDiscount) ||
                other.promoDiscount == promoDiscount) &&
            (identical(other.subTotal, subTotal) ||
                other.subTotal == subTotal) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate) &&
            (identical(other.deliveryShift, deliveryShift) ||
                other.deliveryShift == deliveryShift) &&
            (identical(other.customerAudio, customerAudio) ||
                other.customerAudio == customerAudio) &&
            (identical(other.applyWallet, applyWallet) ||
                other.applyWallet == applyWallet) &&
            (identical(other.promoCode, promoCode) ||
                other.promoCode == promoCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      addressId,
      deviceId,
      note,
      paymentType,
      invoiceAmount,
      promoDiscount,
      subTotal,
      deliveryDate,
      deliveryShift,
      customerAudio,
      applyWallet,
      promoCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitiatePaymentInputCopyWith<_$_InitiatePaymentInput> get copyWith =>
      __$$_InitiatePaymentInputCopyWithImpl<_$_InitiatePaymentInput>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InitiatePaymentInputToJson(
      this,
    );
  }
}

abstract class _InitiatePaymentInput implements InitiatePaymentInput {
  const factory _InitiatePaymentInput(
      {required final String? addressId,
      final String? deviceId,
      final String? note,
      required final PaymentType paymentType,
      required final double invoiceAmount,
      required final double promoDiscount,
      required final double subTotal,
      final String? deliveryDate,
      final String? deliveryShift,
      @JsonKey(ignore: true) final File? customerAudio,
      final bool applyWallet,
      final String? promoCode}) = _$_InitiatePaymentInput;

  factory _InitiatePaymentInput.fromJson(Map<String, dynamic> json) =
      _$_InitiatePaymentInput.fromJson;

  @override
  String? get addressId;
  @override
  String? get deviceId;
  @override
  String? get note;
  @override
  PaymentType get paymentType;
  @override
  double get invoiceAmount;
  @override
  double get promoDiscount;
  @override
  double get subTotal;
  @override
  String? get deliveryDate;
  @override
  String? get deliveryShift;
  @override
  @JsonKey(ignore: true)
  File? get customerAudio;
  @override // final String? customerAudio,
  bool get applyWallet;
  @override
  String? get promoCode;
  @override
  @JsonKey(ignore: true)
  _$$_InitiatePaymentInputCopyWith<_$_InitiatePaymentInput> get copyWith =>
      throw _privateConstructorUsedError;
}
