// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_product_variant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MapProductVariant _$MapProductVariantFromJson(Map<String, dynamic> json) {
  return _MapProductVariant.fromJson(json);
}

/// @nodoc
mixin _$MapProductVariant {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  ProductVariant? get variant => throw _privateConstructorUsedError;
  bool? get isDefault => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  double? get reductionPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MapProductVariantCopyWith<MapProductVariant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapProductVariantCopyWith<$Res> {
  factory $MapProductVariantCopyWith(
          MapProductVariant value, $Res Function(MapProductVariant) then) =
      _$MapProductVariantCopyWithImpl<$Res, MapProductVariant>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      ProductVariant? variant,
      bool? isDefault,
      double? price,
      int? quantity,
      double? reductionPrice});

  $ProductVariantCopyWith<$Res>? get variant;
}

/// @nodoc
class _$MapProductVariantCopyWithImpl<$Res, $Val extends MapProductVariant>
    implements $MapProductVariantCopyWith<$Res> {
  _$MapProductVariantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? variant = freezed,
    Object? isDefault = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
    Object? reductionPrice = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      variant: freezed == variant
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as ProductVariant?,
      isDefault: freezed == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      reductionPrice: freezed == reductionPrice
          ? _value.reductionPrice
          : reductionPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductVariantCopyWith<$Res>? get variant {
    if (_value.variant == null) {
      return null;
    }

    return $ProductVariantCopyWith<$Res>(_value.variant!, (value) {
      return _then(_value.copyWith(variant: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MapProductVariantCopyWith<$Res>
    implements $MapProductVariantCopyWith<$Res> {
  factory _$$_MapProductVariantCopyWith(_$_MapProductVariant value,
          $Res Function(_$_MapProductVariant) then) =
      __$$_MapProductVariantCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      ProductVariant? variant,
      bool? isDefault,
      double? price,
      int? quantity,
      double? reductionPrice});

  @override
  $ProductVariantCopyWith<$Res>? get variant;
}

/// @nodoc
class __$$_MapProductVariantCopyWithImpl<$Res>
    extends _$MapProductVariantCopyWithImpl<$Res, _$_MapProductVariant>
    implements _$$_MapProductVariantCopyWith<$Res> {
  __$$_MapProductVariantCopyWithImpl(
      _$_MapProductVariant _value, $Res Function(_$_MapProductVariant) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? variant = freezed,
    Object? isDefault = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
    Object? reductionPrice = freezed,
  }) {
    return _then(_$_MapProductVariant(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      variant: freezed == variant
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as ProductVariant?,
      isDefault: freezed == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      reductionPrice: freezed == reductionPrice
          ? _value.reductionPrice
          : reductionPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_MapProductVariant implements _MapProductVariant {
  const _$_MapProductVariant(
      {@JsonKey(name: "_id") this.id,
      this.variant,
      this.isDefault,
      this.price,
      this.quantity,
      this.reductionPrice});

  factory _$_MapProductVariant.fromJson(Map<String, dynamic> json) =>
      _$$_MapProductVariantFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  final ProductVariant? variant;
  @override
  final bool? isDefault;
  @override
  final double? price;
  @override
  final int? quantity;
  @override
  final double? reductionPrice;

  @override
  String toString() {
    return 'MapProductVariant(id: $id, variant: $variant, isDefault: $isDefault, price: $price, quantity: $quantity, reductionPrice: $reductionPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MapProductVariant &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.variant, variant) || other.variant == variant) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.reductionPrice, reductionPrice) ||
                other.reductionPrice == reductionPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, variant, isDefault, price, quantity, reductionPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MapProductVariantCopyWith<_$_MapProductVariant> get copyWith =>
      __$$_MapProductVariantCopyWithImpl<_$_MapProductVariant>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MapProductVariantToJson(
      this,
    );
  }
}

abstract class _MapProductVariant implements MapProductVariant {
  const factory _MapProductVariant(
      {@JsonKey(name: "_id") final String? id,
      final ProductVariant? variant,
      final bool? isDefault,
      final double? price,
      final int? quantity,
      final double? reductionPrice}) = _$_MapProductVariant;

  factory _MapProductVariant.fromJson(Map<String, dynamic> json) =
      _$_MapProductVariant.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  ProductVariant? get variant;
  @override
  bool? get isDefault;
  @override
  double? get price;
  @override
  int? get quantity;
  @override
  double? get reductionPrice;
  @override
  @JsonKey(ignore: true)
  _$$_MapProductVariantCopyWith<_$_MapProductVariant> get copyWith =>
      throw _privateConstructorUsedError;
}
