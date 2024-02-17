// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get nameEn => throw _privateConstructorUsedError;
  String get nameAr => throw _privateConstructorUsedError;
  String get descriptionEn => throw _privateConstructorUsedError;
  String get descriptionAr =>
      throw _privateConstructorUsedError; // final Seller seller;
  @JsonKey(name: 'avatar', defaultValue: [])
  List<String> get images => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  double get price => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: true)
  bool get isQuantityInMeters => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 1)
  double get minimumQuantity => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  double get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String nameEn,
      String nameAr,
      String descriptionEn,
      String descriptionAr,
      @JsonKey(name: 'avatar', defaultValue: []) List<String> images,
      @JsonKey(defaultValue: 0) double price,
      @JsonKey(defaultValue: true) bool isQuantityInMeters,
      @JsonKey(defaultValue: 1) double minimumQuantity,
      @JsonKey(defaultValue: 0) double quantity});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameEn = null,
    Object? nameAr = null,
    Object? descriptionEn = null,
    Object? descriptionAr = null,
    Object? images = null,
    Object? price = null,
    Object? isQuantityInMeters = null,
    Object? minimumQuantity = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      nameAr: null == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionEn: null == descriptionEn
          ? _value.descriptionEn
          : descriptionEn // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionAr: null == descriptionAr
          ? _value.descriptionAr
          : descriptionAr // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      isQuantityInMeters: null == isQuantityInMeters
          ? _value.isQuantityInMeters
          : isQuantityInMeters // ignore: cast_nullable_to_non_nullable
              as bool,
      minimumQuantity: null == minimumQuantity
          ? _value.minimumQuantity
          : minimumQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$_ProductCopyWith(
          _$_Product value, $Res Function(_$_Product) then) =
      __$$_ProductCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String nameEn,
      String nameAr,
      String descriptionEn,
      String descriptionAr,
      @JsonKey(name: 'avatar', defaultValue: []) List<String> images,
      @JsonKey(defaultValue: 0) double price,
      @JsonKey(defaultValue: true) bool isQuantityInMeters,
      @JsonKey(defaultValue: 1) double minimumQuantity,
      @JsonKey(defaultValue: 0) double quantity});
}

/// @nodoc
class __$$_ProductCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$_Product>
    implements _$$_ProductCopyWith<$Res> {
  __$$_ProductCopyWithImpl(_$_Product _value, $Res Function(_$_Product) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameEn = null,
    Object? nameAr = null,
    Object? descriptionEn = null,
    Object? descriptionAr = null,
    Object? images = null,
    Object? price = null,
    Object? isQuantityInMeters = null,
    Object? minimumQuantity = null,
    Object? quantity = null,
  }) {
    return _then(_$_Product(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      nameAr: null == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionEn: null == descriptionEn
          ? _value.descriptionEn
          : descriptionEn // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionAr: null == descriptionAr
          ? _value.descriptionAr
          : descriptionAr // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      isQuantityInMeters: null == isQuantityInMeters
          ? _value.isQuantityInMeters
          : isQuantityInMeters // ignore: cast_nullable_to_non_nullable
              as bool,
      minimumQuantity: null == minimumQuantity
          ? _value.minimumQuantity
          : minimumQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Product implements _Product {
  const _$_Product(
      {@JsonKey(name: '_id')
          required this.id,
      required this.nameEn,
      required this.nameAr,
      required this.descriptionEn,
      required this.descriptionAr,
      @JsonKey(name: 'avatar', defaultValue: [])
          required final List<String> images,
      @JsonKey(defaultValue: 0)
          required this.price,
      @JsonKey(defaultValue: true)
          required this.isQuantityInMeters,
      @JsonKey(defaultValue: 1)
          required this.minimumQuantity,
      @JsonKey(defaultValue: 0)
          required this.quantity})
      : _images = images;

  factory _$_Product.fromJson(Map<String, dynamic> json) =>
      _$$_ProductFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String nameEn;
  @override
  final String nameAr;
  @override
  final String descriptionEn;
  @override
  final String descriptionAr;
// final Seller seller;
  final List<String> _images;
// final Seller seller;
  @override
  @JsonKey(name: 'avatar', defaultValue: [])
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  @JsonKey(defaultValue: 0)
  final double price;
  @override
  @JsonKey(defaultValue: true)
  final bool isQuantityInMeters;
  @override
  @JsonKey(defaultValue: 1)
  final double minimumQuantity;
  @override
  @JsonKey(defaultValue: 0)
  final double quantity;

  @override
  String toString() {
    return 'Product(id: $id, nameEn: $nameEn, nameAr: $nameAr, descriptionEn: $descriptionEn, descriptionAr: $descriptionAr, images: $images, price: $price, isQuantityInMeters: $isQuantityInMeters, minimumQuantity: $minimumQuantity, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Product &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.nameAr, nameAr) || other.nameAr == nameAr) &&
            (identical(other.descriptionEn, descriptionEn) ||
                other.descriptionEn == descriptionEn) &&
            (identical(other.descriptionAr, descriptionAr) ||
                other.descriptionAr == descriptionAr) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isQuantityInMeters, isQuantityInMeters) ||
                other.isQuantityInMeters == isQuantityInMeters) &&
            (identical(other.minimumQuantity, minimumQuantity) ||
                other.minimumQuantity == minimumQuantity) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      nameEn,
      nameAr,
      descriptionEn,
      descriptionAr,
      const DeepCollectionEquality().hash(_images),
      price,
      isQuantityInMeters,
      minimumQuantity,
      quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductCopyWith<_$_Product> get copyWith =>
      __$$_ProductCopyWithImpl<_$_Product>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  const factory _Product(
      {@JsonKey(name: '_id')
          required final String id,
      required final String nameEn,
      required final String nameAr,
      required final String descriptionEn,
      required final String descriptionAr,
      @JsonKey(name: 'avatar', defaultValue: [])
          required final List<String> images,
      @JsonKey(defaultValue: 0)
          required final double price,
      @JsonKey(defaultValue: true)
          required final bool isQuantityInMeters,
      @JsonKey(defaultValue: 1)
          required final double minimumQuantity,
      @JsonKey(defaultValue: 0)
          required final double quantity}) = _$_Product;

  factory _Product.fromJson(Map<String, dynamic> json) = _$_Product.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get nameEn;
  @override
  String get nameAr;
  @override
  String get descriptionEn;
  @override
  String get descriptionAr;
  @override // final Seller seller;
  @JsonKey(name: 'avatar', defaultValue: [])
  List<String> get images;
  @override
  @JsonKey(defaultValue: 0)
  double get price;
  @override
  @JsonKey(defaultValue: true)
  bool get isQuantityInMeters;
  @override
  @JsonKey(defaultValue: 1)
  double get minimumQuantity;
  @override
  @JsonKey(defaultValue: 0)
  double get quantity;
  @override
  @JsonKey(ignore: true)
  _$$_ProductCopyWith<_$_Product> get copyWith =>
      throw _privateConstructorUsedError;
}
