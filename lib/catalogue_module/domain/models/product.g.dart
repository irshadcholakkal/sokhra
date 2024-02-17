// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      productId: json['_id'] as String?,
      code: json['code'] as String?,
      nameEn: json['nameEn'] as String?,
      nameAr: json['nameAr'] as String?,
      descriptionEn: json['descriptionEn'] as String?,
      descriptionAr: json['descriptionAr'] as String?,
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => Categorys.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      subCategories: (json['subCategories'] as List<dynamic>?)
              ?.map((e) => SubCategory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      seller: json['seller'] == null
          ? null
          : Seller.fromJson(json['seller'] as Map<String, dynamic>),
      avatar: (json['avatar'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          [],
      thumbnailImage: json['thumbnailImage'] as String?,
      featured: json['featured'] as bool?,
      hasOffer: json['hasOffer'] as bool?,
      active: json['active'] as bool?,
      productStatus:
          $enumDecodeNullable(_$ProductStatusEnumMap, json['productStatus']),
      sku: json['sku'] as String?,
      order: json['order'] as int?,
      approved: json['approved'] as bool?,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      brand: json['brand'] == null
          ? null
          : Brand.fromJson(json['brand'] as Map<String, dynamic>),
      color: json['color'] == null
          ? null
          : Color.fromJson(json['color'] as Map<String, dynamic>),
      variants: (json['variants'] as List<dynamic>?)
          ?.map((e) => Variant.fromJson(e as Map<String, dynamic>))
          .toList(),
      variantName: json['variantName'] as String?,
      productRegion: (json['productRegion'] as List<dynamic>?)
          ?.map((e) => MapProductRegion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.productId);
  writeNotNull('code', instance.code);
  writeNotNull('nameEn', instance.nameEn);
  writeNotNull('nameAr', instance.nameAr);
  writeNotNull('descriptionEn', instance.descriptionEn);
  writeNotNull('descriptionAr', instance.descriptionAr);
  writeNotNull(
      'categories', instance.categories?.map((e) => e.toJson()).toList());
  writeNotNull(
      'subCategories', instance.subCategories?.map((e) => e.toJson()).toList());
  writeNotNull('seller', instance.seller?.toJson());
  writeNotNull('avatar', instance.avatar);
  writeNotNull('thumbnailImage', instance.thumbnailImage);
  writeNotNull('featured', instance.featured);
  writeNotNull('hasOffer', instance.hasOffer);
  writeNotNull('active', instance.active);
  writeNotNull('productStatus', _$ProductStatusEnumMap[instance.productStatus]);
  writeNotNull('sku', instance.sku);
  writeNotNull('order', instance.order);
  writeNotNull('approved', instance.approved);
  writeNotNull('tags', instance.tags?.map((e) => e.toJson()).toList());
  writeNotNull('brand', instance.brand?.toJson());
  writeNotNull('color', instance.color?.toJson());
  writeNotNull('variants', instance.variants?.map((e) => e.toJson()).toList());
  writeNotNull('variantName', instance.variantName);
  writeNotNull(
      'productRegion', instance.productRegion?.map((e) => e.toJson()).toList());
  return val;
}

const _$ProductStatusEnumMap = {
  ProductStatus.IN_STOCK: 'IN_STOCK',
  ProductStatus.OUT_OF_STOCK: 'OUT_OF_STOCK',
  ProductStatus.IN_ACTIVE: 'IN_ACTIVE',
};
