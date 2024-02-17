// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_variant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductVariant _$ProductVariantFromJson(Map<String, dynamic> json) {
  return _ProductVariant.fromJson(json);
}

/// @nodoc
mixin _$ProductVariant {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  Product? get product => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get minimumQuantity => throw _privateConstructorUsedError;
  int? get maximumQuantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductVariantCopyWith<ProductVariant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductVariantCopyWith<$Res> {
  factory $ProductVariantCopyWith(
          ProductVariant value, $Res Function(ProductVariant) then) =
      _$ProductVariantCopyWithImpl<$Res, ProductVariant>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      Product? product,
      String? name,
      int? minimumQuantity,
      int? maximumQuantity});

  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class _$ProductVariantCopyWithImpl<$Res, $Val extends ProductVariant>
    implements $ProductVariantCopyWith<$Res> {
  _$ProductVariantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? product = freezed,
    Object? name = freezed,
    Object? minimumQuantity = freezed,
    Object? maximumQuantity = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      minimumQuantity: freezed == minimumQuantity
          ? _value.minimumQuantity
          : minimumQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      maximumQuantity: freezed == maximumQuantity
          ? _value.maximumQuantity
          : maximumQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProductVariantCopyWith<$Res>
    implements $ProductVariantCopyWith<$Res> {
  factory _$$_ProductVariantCopyWith(
          _$_ProductVariant value, $Res Function(_$_ProductVariant) then) =
      __$$_ProductVariantCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      Product? product,
      String? name,
      int? minimumQuantity,
      int? maximumQuantity});

  @override
  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class __$$_ProductVariantCopyWithImpl<$Res>
    extends _$ProductVariantCopyWithImpl<$Res, _$_ProductVariant>
    implements _$$_ProductVariantCopyWith<$Res> {
  __$$_ProductVariantCopyWithImpl(
      _$_ProductVariant _value, $Res Function(_$_ProductVariant) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? product = freezed,
    Object? name = freezed,
    Object? minimumQuantity = freezed,
    Object? maximumQuantity = freezed,
  }) {
    return _then(_$_ProductVariant(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      minimumQuantity: freezed == minimumQuantity
          ? _value.minimumQuantity
          : minimumQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      maximumQuantity: freezed == maximumQuantity
          ? _value.maximumQuantity
          : maximumQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$_ProductVariant implements _ProductVariant {
  const _$_ProductVariant(
      {@JsonKey(name: "_id") this.id,
      this.product,
      this.name,
      this.minimumQuantity,
      this.maximumQuantity});

  factory _$_ProductVariant.fromJson(Map<String, dynamic> json) =>
      _$$_ProductVariantFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  final Product? product;
  @override
  final String? name;
  @override
  final int? minimumQuantity;
  @override
  final int? maximumQuantity;

  @override
  String toString() {
    return 'ProductVariant(id: $id, product: $product, name: $name, minimumQuantity: $minimumQuantity, maximumQuantity: $maximumQuantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductVariant &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.minimumQuantity, minimumQuantity) ||
                other.minimumQuantity == minimumQuantity) &&
            (identical(other.maximumQuantity, maximumQuantity) ||
                other.maximumQuantity == maximumQuantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, product, name, minimumQuantity, maximumQuantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductVariantCopyWith<_$_ProductVariant> get copyWith =>
      __$$_ProductVariantCopyWithImpl<_$_ProductVariant>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductVariantToJson(
      this,
    );
  }
}

abstract class _ProductVariant implements ProductVariant {
  const factory _ProductVariant(
      {@JsonKey(name: "_id") final String? id,
      final Product? product,
      final String? name,
      final int? minimumQuantity,
      final int? maximumQuantity}) = _$_ProductVariant;

  factory _ProductVariant.fromJson(Map<String, dynamic> json) =
      _$_ProductVariant.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  Product? get product;
  @override
  String? get name;
  @override
  int? get minimumQuantity;
  @override
  int? get maximumQuantity;
  @override
  @JsonKey(ignore: true)
  _$$_ProductVariantCopyWith<_$_ProductVariant> get copyWith =>
      throw _privateConstructorUsedError;
}
