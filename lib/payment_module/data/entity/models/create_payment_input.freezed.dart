// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_payment_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreatePaymentInput _$CreatePaymentInputFromJson(Map<String, dynamic> json) {
  return _CreatePaymentInput.fromJson(json);
}

/// @nodoc
mixin _$CreatePaymentInput {
  String get razorpayPaymentId => throw _privateConstructorUsedError;
  String get razorpayOrderId => throw _privateConstructorUsedError;
  String get razorpaySignature => throw _privateConstructorUsedError;
  String get pendingOrderId => throw _privateConstructorUsedError;
  String? get deviceId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreatePaymentInputCopyWith<CreatePaymentInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePaymentInputCopyWith<$Res> {
  factory $CreatePaymentInputCopyWith(
          CreatePaymentInput value, $Res Function(CreatePaymentInput) then) =
      _$CreatePaymentInputCopyWithImpl<$Res, CreatePaymentInput>;
  @useResult
  $Res call(
      {String razorpayPaymentId,
      String razorpayOrderId,
      String razorpaySignature,
      String pendingOrderId,
      String? deviceId});
}

/// @nodoc
class _$CreatePaymentInputCopyWithImpl<$Res, $Val extends CreatePaymentInput>
    implements $CreatePaymentInputCopyWith<$Res> {
  _$CreatePaymentInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? razorpayPaymentId = null,
    Object? razorpayOrderId = null,
    Object? razorpaySignature = null,
    Object? pendingOrderId = null,
    Object? deviceId = freezed,
  }) {
    return _then(_value.copyWith(
      razorpayPaymentId: null == razorpayPaymentId
          ? _value.razorpayPaymentId
          : razorpayPaymentId // ignore: cast_nullable_to_non_nullable
              as String,
      razorpayOrderId: null == razorpayOrderId
          ? _value.razorpayOrderId
          : razorpayOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      razorpaySignature: null == razorpaySignature
          ? _value.razorpaySignature
          : razorpaySignature // ignore: cast_nullable_to_non_nullable
              as String,
      pendingOrderId: null == pendingOrderId
          ? _value.pendingOrderId
          : pendingOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreatePaymentInputCopyWith<$Res>
    implements $CreatePaymentInputCopyWith<$Res> {
  factory _$$_CreatePaymentInputCopyWith(_$_CreatePaymentInput value,
          $Res Function(_$_CreatePaymentInput) then) =
      __$$_CreatePaymentInputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String razorpayPaymentId,
      String razorpayOrderId,
      String razorpaySignature,
      String pendingOrderId,
      String? deviceId});
}

/// @nodoc
class __$$_CreatePaymentInputCopyWithImpl<$Res>
    extends _$CreatePaymentInputCopyWithImpl<$Res, _$_CreatePaymentInput>
    implements _$$_CreatePaymentInputCopyWith<$Res> {
  __$$_CreatePaymentInputCopyWithImpl(
      _$_CreatePaymentInput _value, $Res Function(_$_CreatePaymentInput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? razorpayPaymentId = null,
    Object? razorpayOrderId = null,
    Object? razorpaySignature = null,
    Object? pendingOrderId = null,
    Object? deviceId = freezed,
  }) {
    return _then(_$_CreatePaymentInput(
      razorpayPaymentId: null == razorpayPaymentId
          ? _value.razorpayPaymentId
          : razorpayPaymentId // ignore: cast_nullable_to_non_nullable
              as String,
      razorpayOrderId: null == razorpayOrderId
          ? _value.razorpayOrderId
          : razorpayOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      razorpaySignature: null == razorpaySignature
          ? _value.razorpaySignature
          : razorpaySignature // ignore: cast_nullable_to_non_nullable
              as String,
      pendingOrderId: null == pendingOrderId
          ? _value.pendingOrderId
          : pendingOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_CreatePaymentInput implements _CreatePaymentInput {
  const _$_CreatePaymentInput(
      {required this.razorpayPaymentId,
      required this.razorpayOrderId,
      required this.razorpaySignature,
      required this.pendingOrderId,
      this.deviceId = ''});

  factory _$_CreatePaymentInput.fromJson(Map<String, dynamic> json) =>
      _$$_CreatePaymentInputFromJson(json);

  @override
  final String razorpayPaymentId;
  @override
  final String razorpayOrderId;
  @override
  final String razorpaySignature;
  @override
  final String pendingOrderId;
  @override
  @JsonKey()
  final String? deviceId;

  @override
  String toString() {
    return 'CreatePaymentInput(razorpayPaymentId: $razorpayPaymentId, razorpayOrderId: $razorpayOrderId, razorpaySignature: $razorpaySignature, pendingOrderId: $pendingOrderId, deviceId: $deviceId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreatePaymentInput &&
            (identical(other.razorpayPaymentId, razorpayPaymentId) ||
                other.razorpayPaymentId == razorpayPaymentId) &&
            (identical(other.razorpayOrderId, razorpayOrderId) ||
                other.razorpayOrderId == razorpayOrderId) &&
            (identical(other.razorpaySignature, razorpaySignature) ||
                other.razorpaySignature == razorpaySignature) &&
            (identical(other.pendingOrderId, pendingOrderId) ||
                other.pendingOrderId == pendingOrderId) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, razorpayPaymentId,
      razorpayOrderId, razorpaySignature, pendingOrderId, deviceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreatePaymentInputCopyWith<_$_CreatePaymentInput> get copyWith =>
      __$$_CreatePaymentInputCopyWithImpl<_$_CreatePaymentInput>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreatePaymentInputToJson(
      this,
    );
  }
}

abstract class _CreatePaymentInput implements CreatePaymentInput {
  const factory _CreatePaymentInput(
      {required final String razorpayPaymentId,
      required final String razorpayOrderId,
      required final String razorpaySignature,
      required final String pendingOrderId,
      final String? deviceId}) = _$_CreatePaymentInput;

  factory _CreatePaymentInput.fromJson(Map<String, dynamic> json) =
      _$_CreatePaymentInput.fromJson;

  @override
  String get razorpayPaymentId;
  @override
  String get razorpayOrderId;
  @override
  String get razorpaySignature;
  @override
  String get pendingOrderId;
  @override
  String? get deviceId;
  @override
  @JsonKey(ignore: true)
  _$$_CreatePaymentInputCopyWith<_$_CreatePaymentInput> get copyWith =>
      throw _privateConstructorUsedError;
}
