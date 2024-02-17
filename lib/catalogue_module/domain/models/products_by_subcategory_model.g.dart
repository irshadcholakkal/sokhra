// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_by_subcategory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Brand _$BrandFromJson(Map<String, dynamic> json) => Brand(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      nameAr: json['nameAr'] as String?,
    );

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'nameAr': instance.nameAr,
    };

Colour _$ColourFromJson(Map<String, dynamic> json) => Colour(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      nameAr: json['nameAr'] as String?,
      nameFr: json['nameFr'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$ColourToJson(Colour instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'nameAr': instance.nameAr,
      'nameFr': instance.nameFr,
      'code': instance.code,
    };

Variant _$VariantFromJson(Map<String, dynamic> json) => Variant(
      id: json['_id'] as String?,
      isDefault: json['isDefault'] as bool?,
      maximumQuantity: json['maximumQuantity'] as int?,
      minimumQuantity: json['minimumQuantity'] as int?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      quantity: json['quantity'] as int?,
      reductionPrice: (json['reductionPrice'] as num?)?.toDouble(),
      choiceType: json['choiceType'] as String?,
      color: json['color'] == null
          ? null
          : Colour.fromJson(json['color'] as Map<String, dynamic>),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$VariantToJson(Variant instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'isDefault': instance.isDefault,
      'minimumQuantity': instance.minimumQuantity,
      'maximumQuantity': instance.maximumQuantity,
      'reductionPrice': instance.reductionPrice,
      'price': instance.price,
      'quantity': instance.quantity,
      'choiceType': instance.choiceType,
      'color': instance.color,
      'status': instance.status,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['_id'] as String?,
      code: json['code'] as String?,
      nameEn: json['nameEn'] as String?,
      nameAr: json['nameAr'] as String?,
      nameFr: json['nameFr'] as String?,
      order: json['order'] as int?,
      avatar: json['avatar'] as String?,
      active: json['active'] as bool?,
      listProductsInHomePage: json['listProductsInHomePage'] as bool?,
      subCategories: json['subCategories'] == null
          ? null
          : SubCategory.fromJson(json['subCategories'] as Map<String, dynamic>),
      isBigImage: json['isBigImage'] as bool?,
      descriptionEn: json['descriptionEn'] as String?,
      descriptionAr: json['descriptionAr'] as String?,
      descriptionFr: json['descriptionFr'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      '_id': instance.id,
      'code': instance.code,
      'nameEn': instance.nameEn,
      'nameAr': instance.nameAr,
      'nameFr': instance.nameFr,
      'order': instance.order,
      'avatar': instance.avatar,
      'active': instance.active,
      'listProductsInHomePage': instance.listProductsInHomePage,
      'subCategories': instance.subCategories,
      'isBigImage': instance.isBigImage,
      'descriptionEn': instance.descriptionEn,
      'descriptionAr': instance.descriptionAr,
      'descriptionFr': instance.descriptionFr,
    };

SubCategory _$SubCategoryFromJson(Map<String, dynamic> json) => SubCategory(
      id: json['_id'] as String?,
      code: json['code'] as String?,
      nameAr: json['nameAr'] as String?,
      nameEn: json['nameEn'] as String?,
      nameFr: json['nameFr'] as String?,
      avatar: json['avatar'] as String?,
      order: json['order'] as int?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubCategoryToJson(SubCategory instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'code': instance.code,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
      'nameFr': instance.nameFr,
      'avatar': instance.avatar,
      'order': instance.order,
      'category': instance.category,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      active: json['active'] as bool?,
      avatar:
          (json['avatar'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      brand: json['brand'] == null
          ? null
          : Brand.fromJson(json['brand'] as Map<String, dynamic>),
      descriptionAr: json['descriptionAr'] as String?,
      descriptionEn: json['descriptionEn'] as String?,
      featured: json['featured'] as bool?,
      hasOffer: json['hasOffer'] as bool?,
      id: json['_id'] as String?,
      nameAr: json['nameAr'] as String?,
      nameEn: json['nameEn'] as String?,
      order: json['order'] as int?,
      thumbnailImage: json['thumbnailImage'] as String?,
      variantName: json['variantName'] as String?,
      variants: (json['variants'] as List<dynamic>?)
          ?.map((e) => Variant.fromJson(e as Map<String, dynamic>))
          .toList(),
      tax: json['tax'] == null
          ? null
          : Tax.fromJson(json['tax'] as Map<String, dynamic>),
      nameFr: json['nameFr'] as String?,
      descriptionFr: json['descriptionFr'] as String?,
      variantChoiceName: json['variantChoiceName'] as String?,
      color: json['color'] == null
          ? null
          : Colour.fromJson(json['color'] as Map<String, dynamic>),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      subCategories: (json['subCategories'] as List<dynamic>?)
          ?.map((e) => SubCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      sku: json['sku'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      '_id': instance.id,
      'nameEn': instance.nameEn,
      'nameAr': instance.nameAr,
      'nameFr': instance.nameFr,
      'descriptionEn': instance.descriptionEn,
      'descriptionAr': instance.descriptionAr,
      'descriptionFr': instance.descriptionFr,
      'featured': instance.featured,
      'hasOffer': instance.hasOffer,
      'active': instance.active,
      'order': instance.order,
      'avatar': instance.avatar,
      'thumbnailImage': instance.thumbnailImage,
      'variantName': instance.variantName,
      'brand': instance.brand,
      'color': instance.color,
      'variants': instance.variants,
      'tax': instance.tax,
      'variantChoiceName': instance.variantChoiceName,
      'subCategories': instance.subCategories,
      'categories': instance.categories,
      'sku': instance.sku,
    };

CustomerPoducts _$CustomerPoductsFromJson(Map<String, dynamic> json) =>
    CustomerPoducts(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['totalCount'] as int?,
    );

Map<String, dynamic> _$CustomerPoductsToJson(CustomerPoducts instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'products': instance.products,
    };
