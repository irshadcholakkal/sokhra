// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_check_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeliveryCheckResponse _$DeliveryCheckResponseFromJson(
    Map<String, dynamic> json) {
  return _DeliveryCheckResponse.fromJson(json);
}

/// @nodoc
mixin _$DeliveryCheckResponse {
  String? get zoneName => throw _privateConstructorUsedError;
  String? get deliveryDate => throw _privateConstructorUsedError;
  String? get deliveryDay => throw _privateConstructorUsedError;
  bool? get hasSameDayDelivery => throw _privateConstructorUsedError;
  bool? get hasSameDayShipping => throw _privateConstructorUsedError;
  double? get minimumPurchaseAmount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeliveryCheckResponseCopyWith<DeliveryCheckResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryCheckResponseCopyWith<$Res> {
  factory $DeliveryCheckResponseCopyWith(DeliveryCheckResponse value,
          $Res Function(DeliveryCheckResponse) then) =
      _$DeliveryCheckResponseCopyWithImpl<$Res, DeliveryCheckResponse>;
  @useResult
  $Res call(
      {String? zoneName,
      String? deliveryDate,
      String? deliveryDay,
      bool? hasSameDayDelivery,
      bool? hasSameDayShipping,
      double? minimumPurchaseAmount});
}

/// @nodoc
class _$DeliveryCheckResponseCopyWithImpl<$Res,
        $Val extends DeliveryCheckResponse>
    implements $DeliveryCheckResponseCopyWith<$Res> {
  _$DeliveryCheckResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zoneName = freezed,
    Object? deliveryDate = freezed,
    Object? deliveryDay = freezed,
    Object? hasSameDayDelivery = freezed,
    Object? hasSameDayShipping = freezed,
    Object? minimumPurchaseAmount = freezed,
  }) {
    return _then(_value.copyWith(
      zoneName: freezed == zoneName
          ? _value.zoneName
          : zoneName // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryDay: freezed == deliveryDay
          ? _value.deliveryDay
          : deliveryDay // ignore: cast_nullable_to_non_nullable
              as String?,
      hasSameDayDelivery: freezed == hasSameDayDelivery
          ? _value.hasSameDayDelivery
          : hasSameDayDelivery // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSameDayShipping: freezed == hasSameDayShipping
          ? _value.hasSameDayShipping
          : hasSameDayShipping // ignore: cast_nullable_to_non_nullable
              as bool?,
      minimumPurchaseAmount: freezed == minimumPurchaseAmount
          ? _value.minimumPurchaseAmount
          : minimumPurchaseAmount // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeliveryCheckResponseCopyWith<$Res>
    implements $DeliveryCheckResponseCopyWith<$Res> {
  factory _$$_DeliveryCheckResponseCopyWith(_$_DeliveryCheckResponse value,
          $Res Function(_$_DeliveryCheckResponse) then) =
      __$$_DeliveryCheckResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? zoneName,
      String? deliveryDate,
      String? deliveryDay,
      bool? hasSameDayDelivery,
      bool? hasSameDayShipping,
      double? minimumPurchaseAmount});
}

/// @nodoc
class __$$_DeliveryCheckResponseCopyWithImpl<$Res>
    extends _$DeliveryCheckResponseCopyWithImpl<$Res, _$_DeliveryCheckResponse>
    implements _$$_DeliveryCheckResponseCopyWith<$Res> {
  __$$_DeliveryCheckResponseCopyWithImpl(_$_DeliveryCheckResponse _value,
      $Res Function(_$_DeliveryCheckResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zoneName = freezed,
    Object? deliveryDate = freezed,
    Object? deliveryDay = freezed,
    Object? hasSameDayDelivery = freezed,
    Object? hasSameDayShipping = freezed,
    Object? minimumPurchaseAmount = freezed,
  }) {
    return _then(_$_DeliveryCheckResponse(
      zoneName: freezed == zoneName
          ? _value.zoneName
          : zoneName // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryDay: freezed == deliveryDay
          ? _value.deliveryDay
          : deliveryDay // ignore: cast_nullable_to_non_nullable
              as String?,
      hasSameDayDelivery: freezed == hasSameDayDelivery
          ? _value.hasSameDayDelivery
          : hasSameDayDelivery // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSameDayShipping: freezed == hasSameDayShipping
          ? _value.hasSameDayShipping
          : hasSameDayShipping // ignore: cast_nullable_to_non_nullable
              as bool?,
      minimumPurchaseAmount: freezed == minimumPurchaseAmount
          ? _value.minimumPurchaseAmount
          : minimumPurchaseAmount // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_DeliveryCheckResponse implements _DeliveryCheckResponse {
  const _$_DeliveryCheckResponse(
      {this.zoneName,
      this.deliveryDate,
      this.deliveryDay,
      this.hasSameDayDelivery,
      this.hasSameDayShipping,
      this.minimumPurchaseAmount});

  factory _$_DeliveryCheckResponse.fromJson(Map<String, dynamic> json) =>
      _$$_DeliveryCheckResponseFromJson(json);

  @override
  final String? zoneName;
  @override
  final String? deliveryDate;
  @override
  final String? deliveryDay;
  @override
  final bool? hasSameDayDelivery;
  @override
  final bool? hasSameDayShipping;
  @override
  final double? minimumPurchaseAmount;

  @override
  String toString() {
    return 'DeliveryCheckResponse(zoneName: $zoneName, deliveryDate: $deliveryDate, deliveryDay: $deliveryDay, hasSameDayDelivery: $hasSameDayDelivery, hasSameDayShipping: $hasSameDayShipping, minimumPurchaseAmount: $minimumPurchaseAmount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeliveryCheckResponse &&
            (identical(other.zoneName, zoneName) ||
                other.zoneName == zoneName) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate) &&
            (identical(other.deliveryDay, deliveryDay) ||
                other.deliveryDay == deliveryDay) &&
            (identical(other.hasSameDayDelivery, hasSameDayDelivery) ||
                other.hasSameDayDelivery == hasSameDayDelivery) &&
            (identical(other.hasSameDayShipping, hasSameDayShipping) ||
                other.hasSameDayShipping == hasSameDayShipping) &&
            (identical(other.minimumPurchaseAmount, minimumPurchaseAmount) ||
                other.minimumPurchaseAmount == minimumPurchaseAmount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      zoneName,
      deliveryDate,
      deliveryDay,
      hasSameDayDelivery,
      hasSameDayShipping,
      minimumPurchaseAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeliveryCheckResponseCopyWith<_$_DeliveryCheckResponse> get copyWith =>
      __$$_DeliveryCheckResponseCopyWithImpl<_$_DeliveryCheckResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeliveryCheckResponseToJson(
      this,
    );
  }
}

abstract class _DeliveryCheckResponse implements DeliveryCheckResponse {
  const factory _DeliveryCheckResponse(
      {final String? zoneName,
      final String? deliveryDate,
      final String? deliveryDay,
      final bool? hasSameDayDelivery,
      final bool? hasSameDayShipping,
      final double? minimumPurchaseAmount}) = _$_DeliveryCheckResponse;

  factory _DeliveryCheckResponse.fromJson(Map<String, dynamic> json) =
      _$_DeliveryCheckResponse.fromJson;

  @override
  String? get zoneName;
  @override
  String? get deliveryDate;
  @override
  String? get deliveryDay;
  @override
  bool? get hasSameDayDelivery;
  @override
  bool? get hasSameDayShipping;
  @override
  double? get minimumPurchaseAmount;
  @override
  @JsonKey(ignore: true)
  _$$_DeliveryCheckResponseCopyWith<_$_DeliveryCheckResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
