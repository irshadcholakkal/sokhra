// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promocode_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PromoCodeInfo _$PromoCodeInfoFromJson(Map<String, dynamic> json) {
  return _PromoCodeInfo.fromJson(json);
}

/// @nodoc
mixin _$PromoCodeInfo {
  double? get discountedPrice => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  double? get discount => throw _privateConstructorUsedError;
  double? get deliveryCharge => throw _privateConstructorUsedError;
  double? get netPrice => throw _privateConstructorUsedError;
  String? get promoCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PromoCodeInfoCopyWith<PromoCodeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromoCodeInfoCopyWith<$Res> {
  factory $PromoCodeInfoCopyWith(
          PromoCodeInfo value, $Res Function(PromoCodeInfo) then) =
      _$PromoCodeInfoCopyWithImpl<$Res, PromoCodeInfo>;
  @useResult
  $Res call(
      {double? discountedPrice,
      double? price,
      double? discount,
      double? deliveryCharge,
      double? netPrice,
      String? promoCode});
}

/// @nodoc
class _$PromoCodeInfoCopyWithImpl<$Res, $Val extends PromoCodeInfo>
    implements $PromoCodeInfoCopyWith<$Res> {
  _$PromoCodeInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discountedPrice = freezed,
    Object? price = freezed,
    Object? discount = freezed,
    Object? deliveryCharge = freezed,
    Object? netPrice = freezed,
    Object? promoCode = freezed,
  }) {
    return _then(_value.copyWith(
      discountedPrice: freezed == discountedPrice
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryCharge: freezed == deliveryCharge
          ? _value.deliveryCharge
          : deliveryCharge // ignore: cast_nullable_to_non_nullable
              as double?,
      netPrice: freezed == netPrice
          ? _value.netPrice
          : netPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      promoCode: freezed == promoCode
          ? _value.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PromoCodeInfoCopyWith<$Res>
    implements $PromoCodeInfoCopyWith<$Res> {
  factory _$$_PromoCodeInfoCopyWith(
          _$_PromoCodeInfo value, $Res Function(_$_PromoCodeInfo) then) =
      __$$_PromoCodeInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? discountedPrice,
      double? price,
      double? discount,
      double? deliveryCharge,
      double? netPrice,
      String? promoCode});
}

/// @nodoc
class __$$_PromoCodeInfoCopyWithImpl<$Res>
    extends _$PromoCodeInfoCopyWithImpl<$Res, _$_PromoCodeInfo>
    implements _$$_PromoCodeInfoCopyWith<$Res> {
  __$$_PromoCodeInfoCopyWithImpl(
      _$_PromoCodeInfo _value, $Res Function(_$_PromoCodeInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discountedPrice = freezed,
    Object? price = freezed,
    Object? discount = freezed,
    Object? deliveryCharge = freezed,
    Object? netPrice = freezed,
    Object? promoCode = freezed,
  }) {
    return _then(_$_PromoCodeInfo(
      discountedPrice: freezed == discountedPrice
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryCharge: freezed == deliveryCharge
          ? _value.deliveryCharge
          : deliveryCharge // ignore: cast_nullable_to_non_nullable
              as double?,
      netPrice: freezed == netPrice
          ? _value.netPrice
          : netPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      promoCode: freezed == promoCode
          ? _value.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_PromoCodeInfo implements _PromoCodeInfo {
  const _$_PromoCodeInfo(
      {this.discountedPrice,
      this.price,
      this.discount,
      this.deliveryCharge,
      this.netPrice,
      this.promoCode});

  factory _$_PromoCodeInfo.fromJson(Map<String, dynamic> json) =>
      _$$_PromoCodeInfoFromJson(json);

  @override
  final double? discountedPrice;
  @override
  final double? price;
  @override
  final double? discount;
  @override
  final double? deliveryCharge;
  @override
  final double? netPrice;
  @override
  final String? promoCode;

  @override
  String toString() {
    return 'PromoCodeInfo(discountedPrice: $discountedPrice, price: $price, discount: $discount, deliveryCharge: $deliveryCharge, netPrice: $netPrice, promoCode: $promoCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PromoCodeInfo &&
            (identical(other.discountedPrice, discountedPrice) ||
                other.discountedPrice == discountedPrice) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.deliveryCharge, deliveryCharge) ||
                other.deliveryCharge == deliveryCharge) &&
            (identical(other.netPrice, netPrice) ||
                other.netPrice == netPrice) &&
            (identical(other.promoCode, promoCode) ||
                other.promoCode == promoCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, discountedPrice, price, discount,
      deliveryCharge, netPrice, promoCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PromoCodeInfoCopyWith<_$_PromoCodeInfo> get copyWith =>
      __$$_PromoCodeInfoCopyWithImpl<_$_PromoCodeInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PromoCodeInfoToJson(
      this,
    );
  }
}

abstract class _PromoCodeInfo implements PromoCodeInfo {
  const factory _PromoCodeInfo(
      {final double? discountedPrice,
      final double? price,
      final double? discount,
      final double? deliveryCharge,
      final double? netPrice,
      final String? promoCode}) = _$_PromoCodeInfo;

  factory _PromoCodeInfo.fromJson(Map<String, dynamic> json) =
      _$_PromoCodeInfo.fromJson;

  @override
  double? get discountedPrice;
  @override
  double? get price;
  @override
  double? get discount;
  @override
  double? get deliveryCharge;
  @override
  double? get netPrice;
  @override
  String? get promoCode;
  @override
  @JsonKey(ignore: true)
  _$$_PromoCodeInfoCopyWith<_$_PromoCodeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
