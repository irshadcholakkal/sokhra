// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

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
  @JsonKey(name: "_id")
  String? get productId => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get nameEn => throw _privateConstructorUsedError;
  String? get nameAr => throw _privateConstructorUsedError;
  String? get descriptionEn => throw _privateConstructorUsedError;
  String? get descriptionAr => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [])
  List<Categorys>? get categories => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [])
  List<SubCategory>? get subCategories => throw _privateConstructorUsedError;
  Seller? get seller => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [])
  List<String?>? get avatar => throw _privateConstructorUsedError;
  String? get thumbnailImage => throw _privateConstructorUsedError;
  bool? get featured => throw _privateConstructorUsedError;
  bool? get hasOffer => throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;
  ProductStatus? get productStatus => throw _privateConstructorUsedError;
  String? get sku => throw _privateConstructorUsedError;
  int? get order => throw _privateConstructorUsedError;
  bool? get approved => throw _privateConstructorUsedError;
  List<Tag>? get tags => throw _privateConstructorUsedError;
  Brand? get brand => throw _privateConstructorUsedError;
  Color? get color => throw _privateConstructorUsedError;
  List<Variant>? get variants => throw _privateConstructorUsedError;
  String? get variantName => throw _privateConstructorUsedError;
  List<MapProductRegion>? get productRegion =>
      throw _privateConstructorUsedError;

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
      {@JsonKey(name: "_id") String? productId,
      String? code,
      String? nameEn,
      String? nameAr,
      String? descriptionEn,
      String? descriptionAr,
      @JsonKey(defaultValue: []) List<Categorys>? categories,
      @JsonKey(defaultValue: []) List<SubCategory>? subCategories,
      Seller? seller,
      @JsonKey(defaultValue: []) List<String?>? avatar,
      String? thumbnailImage,
      bool? featured,
      bool? hasOffer,
      bool? active,
      ProductStatus? productStatus,
      String? sku,
      int? order,
      bool? approved,
      List<Tag>? tags,
      Brand? brand,
      Color? color,
      List<Variant>? variants,
      String? variantName,
      List<MapProductRegion>? productRegion});

  $SellerCopyWith<$Res>? get seller;
  $BrandCopyWith<$Res>? get brand;
  $ColorCopyWith<$Res>? get color;
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
    Object? productId = freezed,
    Object? code = freezed,
    Object? nameEn = freezed,
    Object? nameAr = freezed,
    Object? descriptionEn = freezed,
    Object? descriptionAr = freezed,
    Object? categories = freezed,
    Object? subCategories = freezed,
    Object? seller = freezed,
    Object? avatar = freezed,
    Object? thumbnailImage = freezed,
    Object? featured = freezed,
    Object? hasOffer = freezed,
    Object? active = freezed,
    Object? productStatus = freezed,
    Object? sku = freezed,
    Object? order = freezed,
    Object? approved = freezed,
    Object? tags = freezed,
    Object? brand = freezed,
    Object? color = freezed,
    Object? variants = freezed,
    Object? variantName = freezed,
    Object? productRegion = freezed,
  }) {
    return _then(_value.copyWith(
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEn: freezed == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      nameAr: freezed == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionEn: freezed == descriptionEn
          ? _value.descriptionEn
          : descriptionEn // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionAr: freezed == descriptionAr
          ? _value.descriptionAr
          : descriptionAr // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Categorys>?,
      subCategories: freezed == subCategories
          ? _value.subCategories
          : subCategories // ignore: cast_nullable_to_non_nullable
              as List<SubCategory>?,
      seller: freezed == seller
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as Seller?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      thumbnailImage: freezed == thumbnailImage
          ? _value.thumbnailImage
          : thumbnailImage // ignore: cast_nullable_to_non_nullable
              as String?,
      featured: freezed == featured
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasOffer: freezed == hasOffer
          ? _value.hasOffer
          : hasOffer // ignore: cast_nullable_to_non_nullable
              as bool?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      productStatus: freezed == productStatus
          ? _value.productStatus
          : productStatus // ignore: cast_nullable_to_non_nullable
              as ProductStatus?,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      approved: freezed == approved
          ? _value.approved
          : approved // ignore: cast_nullable_to_non_nullable
              as bool?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as Brand?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      variants: freezed == variants
          ? _value.variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<Variant>?,
      variantName: freezed == variantName
          ? _value.variantName
          : variantName // ignore: cast_nullable_to_non_nullable
              as String?,
      productRegion: freezed == productRegion
          ? _value.productRegion
          : productRegion // ignore: cast_nullable_to_non_nullable
              as List<MapProductRegion>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SellerCopyWith<$Res>? get seller {
    if (_value.seller == null) {
      return null;
    }

    return $SellerCopyWith<$Res>(_value.seller!, (value) {
      return _then(_value.copyWith(seller: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BrandCopyWith<$Res>? get brand {
    if (_value.brand == null) {
      return null;
    }

    return $BrandCopyWith<$Res>(_value.brand!, (value) {
      return _then(_value.copyWith(brand: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ColorCopyWith<$Res>? get color {
    if (_value.color == null) {
      return null;
    }

    return $ColorCopyWith<$Res>(_value.color!, (value) {
      return _then(_value.copyWith(color: value) as $Val);
    });
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
      {@JsonKey(name: "_id") String? productId,
      String? code,
      String? nameEn,
      String? nameAr,
      String? descriptionEn,
      String? descriptionAr,
      @JsonKey(defaultValue: []) List<Categorys>? categories,
      @JsonKey(defaultValue: []) List<SubCategory>? subCategories,
      Seller? seller,
      @JsonKey(defaultValue: []) List<String?>? avatar,
      String? thumbnailImage,
      bool? featured,
      bool? hasOffer,
      bool? active,
      ProductStatus? productStatus,
      String? sku,
      int? order,
      bool? approved,
      List<Tag>? tags,
      Brand? brand,
      Color? color,
      List<Variant>? variants,
      String? variantName,
      List<MapProductRegion>? productRegion});

  @override
  $SellerCopyWith<$Res>? get seller;
  @override
  $BrandCopyWith<$Res>? get brand;
  @override
  $ColorCopyWith<$Res>? get color;
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
    Object? productId = freezed,
    Object? code = freezed,
    Object? nameEn = freezed,
    Object? nameAr = freezed,
    Object? descriptionEn = freezed,
    Object? descriptionAr = freezed,
    Object? categories = freezed,
    Object? subCategories = freezed,
    Object? seller = freezed,
    Object? avatar = freezed,
    Object? thumbnailImage = freezed,
    Object? featured = freezed,
    Object? hasOffer = freezed,
    Object? active = freezed,
    Object? productStatus = freezed,
    Object? sku = freezed,
    Object? order = freezed,
    Object? approved = freezed,
    Object? tags = freezed,
    Object? brand = freezed,
    Object? color = freezed,
    Object? variants = freezed,
    Object? variantName = freezed,
    Object? productRegion = freezed,
  }) {
    return _then(_$_Product(
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEn: freezed == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      nameAr: freezed == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionEn: freezed == descriptionEn
          ? _value.descriptionEn
          : descriptionEn // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionAr: freezed == descriptionAr
          ? _value.descriptionAr
          : descriptionAr // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Categorys>?,
      subCategories: freezed == subCategories
          ? _value._subCategories
          : subCategories // ignore: cast_nullable_to_non_nullable
              as List<SubCategory>?,
      seller: freezed == seller
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as Seller?,
      avatar: freezed == avatar
          ? _value._avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      thumbnailImage: freezed == thumbnailImage
          ? _value.thumbnailImage
          : thumbnailImage // ignore: cast_nullable_to_non_nullable
              as String?,
      featured: freezed == featured
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasOffer: freezed == hasOffer
          ? _value.hasOffer
          : hasOffer // ignore: cast_nullable_to_non_nullable
              as bool?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      productStatus: freezed == productStatus
          ? _value.productStatus
          : productStatus // ignore: cast_nullable_to_non_nullable
              as ProductStatus?,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      approved: freezed == approved
          ? _value.approved
          : approved // ignore: cast_nullable_to_non_nullable
              as bool?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as Brand?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      variants: freezed == variants
          ? _value._variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<Variant>?,
      variantName: freezed == variantName
          ? _value.variantName
          : variantName // ignore: cast_nullable_to_non_nullable
              as String?,
      productRegion: freezed == productRegion
          ? _value._productRegion
          : productRegion // ignore: cast_nullable_to_non_nullable
              as List<MapProductRegion>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_Product implements _Product {
  const _$_Product(
      {@JsonKey(name: "_id") this.productId,
      this.code,
      this.nameEn,
      this.nameAr,
      this.descriptionEn,
      this.descriptionAr,
      @JsonKey(defaultValue: []) final List<Categorys>? categories,
      @JsonKey(defaultValue: []) final List<SubCategory>? subCategories,
      this.seller,
      @JsonKey(defaultValue: []) final List<String?>? avatar,
      this.thumbnailImage,
      this.featured,
      this.hasOffer,
      this.active,
      this.productStatus,
      this.sku,
      this.order,
      this.approved,
      final List<Tag>? tags,
      this.brand,
      this.color,
      final List<Variant>? variants,
      this.variantName,
      final List<MapProductRegion>? productRegion})
      : _categories = categories,
        _subCategories = subCategories,
        _avatar = avatar,
        _tags = tags,
        _variants = variants,
        _productRegion = productRegion;

  factory _$_Product.fromJson(Map<String, dynamic> json) =>
      _$$_ProductFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? productId;
  @override
  final String? code;
  @override
  final String? nameEn;
  @override
  final String? nameAr;
  @override
  final String? descriptionEn;
  @override
  final String? descriptionAr;
  final List<Categorys>? _categories;
  @override
  @JsonKey(defaultValue: [])
  List<Categorys>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SubCategory>? _subCategories;
  @override
  @JsonKey(defaultValue: [])
  List<SubCategory>? get subCategories {
    final value = _subCategories;
    if (value == null) return null;
    if (_subCategories is EqualUnmodifiableListView) return _subCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Seller? seller;
  final List<String?>? _avatar;
  @override
  @JsonKey(defaultValue: [])
  List<String?>? get avatar {
    final value = _avatar;
    if (value == null) return null;
    if (_avatar is EqualUnmodifiableListView) return _avatar;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? thumbnailImage;
  @override
  final bool? featured;
  @override
  final bool? hasOffer;
  @override
  final bool? active;
  @override
  final ProductStatus? productStatus;
  @override
  final String? sku;
  @override
  final int? order;
  @override
  final bool? approved;
  final List<Tag>? _tags;
  @override
  List<Tag>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Brand? brand;
  @override
  final Color? color;
  final List<Variant>? _variants;
  @override
  List<Variant>? get variants {
    final value = _variants;
    if (value == null) return null;
    if (_variants is EqualUnmodifiableListView) return _variants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? variantName;
  final List<MapProductRegion>? _productRegion;
  @override
  List<MapProductRegion>? get productRegion {
    final value = _productRegion;
    if (value == null) return null;
    if (_productRegion is EqualUnmodifiableListView) return _productRegion;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Product(productId: $productId, code: $code, nameEn: $nameEn, nameAr: $nameAr, descriptionEn: $descriptionEn, descriptionAr: $descriptionAr, categories: $categories, subCategories: $subCategories, seller: $seller, avatar: $avatar, thumbnailImage: $thumbnailImage, featured: $featured, hasOffer: $hasOffer, active: $active, productStatus: $productStatus, sku: $sku, order: $order, approved: $approved, tags: $tags, brand: $brand, color: $color, variants: $variants, variantName: $variantName, productRegion: $productRegion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Product &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.nameAr, nameAr) || other.nameAr == nameAr) &&
            (identical(other.descriptionEn, descriptionEn) ||
                other.descriptionEn == descriptionEn) &&
            (identical(other.descriptionAr, descriptionAr) ||
                other.descriptionAr == descriptionAr) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other._subCategories, _subCategories) &&
            (identical(other.seller, seller) || other.seller == seller) &&
            const DeepCollectionEquality().equals(other._avatar, _avatar) &&
            (identical(other.thumbnailImage, thumbnailImage) ||
                other.thumbnailImage == thumbnailImage) &&
            (identical(other.featured, featured) ||
                other.featured == featured) &&
            (identical(other.hasOffer, hasOffer) ||
                other.hasOffer == hasOffer) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.productStatus, productStatus) ||
                other.productStatus == productStatus) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.approved, approved) ||
                other.approved == approved) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.color, color) || other.color == color) &&
            const DeepCollectionEquality().equals(other._variants, _variants) &&
            (identical(other.variantName, variantName) ||
                other.variantName == variantName) &&
            const DeepCollectionEquality()
                .equals(other._productRegion, _productRegion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        productId,
        code,
        nameEn,
        nameAr,
        descriptionEn,
        descriptionAr,
        const DeepCollectionEquality().hash(_categories),
        const DeepCollectionEquality().hash(_subCategories),
        seller,
        const DeepCollectionEquality().hash(_avatar),
        thumbnailImage,
        featured,
        hasOffer,
        active,
        productStatus,
        sku,
        order,
        approved,
        const DeepCollectionEquality().hash(_tags),
        brand,
        color,
        const DeepCollectionEquality().hash(_variants),
        variantName,
        const DeepCollectionEquality().hash(_productRegion)
      ]);

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
      {@JsonKey(name: "_id") final String? productId,
      final String? code,
      final String? nameEn,
      final String? nameAr,
      final String? descriptionEn,
      final String? descriptionAr,
      @JsonKey(defaultValue: []) final List<Categorys>? categories,
      @JsonKey(defaultValue: []) final List<SubCategory>? subCategories,
      final Seller? seller,
      @JsonKey(defaultValue: []) final List<String?>? avatar,
      final String? thumbnailImage,
      final bool? featured,
      final bool? hasOffer,
      final bool? active,
      final ProductStatus? productStatus,
      final String? sku,
      final int? order,
      final bool? approved,
      final List<Tag>? tags,
      final Brand? brand,
      final Color? color,
      final List<Variant>? variants,
      final String? variantName,
      final List<MapProductRegion>? productRegion}) = _$_Product;

  factory _Product.fromJson(Map<String, dynamic> json) = _$_Product.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get productId;
  @override
  String? get code;
  @override
  String? get nameEn;
  @override
  String? get nameAr;
  @override
  String? get descriptionEn;
  @override
  String? get descriptionAr;
  @override
  @JsonKey(defaultValue: [])
  List<Categorys>? get categories;
  @override
  @JsonKey(defaultValue: [])
  List<SubCategory>? get subCategories;
  @override
  Seller? get seller;
  @override
  @JsonKey(defaultValue: [])
  List<String?>? get avatar;
  @override
  String? get thumbnailImage;
  @override
  bool? get featured;
  @override
  bool? get hasOffer;
  @override
  bool? get active;
  @override
  ProductStatus? get productStatus;
  @override
  String? get sku;
  @override
  int? get order;
  @override
  bool? get approved;
  @override
  List<Tag>? get tags;
  @override
  Brand? get brand;
  @override
  Color? get color;
  @override
  List<Variant>? get variants;
  @override
  String? get variantName;
  @override
  List<MapProductRegion>? get productRegion;
  @override
  @JsonKey(ignore: true)
  _$$_ProductCopyWith<_$_Product> get copyWith =>
      throw _privateConstructorUsedError;
}
