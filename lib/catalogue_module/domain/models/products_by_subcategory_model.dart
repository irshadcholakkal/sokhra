import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'tax.dart';

part 'products_by_subcategory_model.g.dart';

@JsonSerializable()
class Brand extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? nameAr;

  Brand({this.id, this.name,this.nameAr});

  @override
  List<Object?> get props => [id, name,nameAr];

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);

  Map<String, dynamic> toJson() => _$BrandToJson(this);
}

@JsonSerializable()
class Colour extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? nameAr;
  final String? nameFr;
  final String? code;

  Colour(
      {required this.id,
      required this.name,
      required this.nameAr,
      required this.nameFr,
      required this.code});

  @override
  List<Object?> get props => [id, name, nameAr, nameFr, code];

  factory Colour.fromJson(Map<String, dynamic> json) => _$ColourFromJson(json);

  Map<String, dynamic> toJson() => _$ColourToJson(this);
}

@JsonSerializable()
class Variant extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final bool? isDefault;
  final int? minimumQuantity;
  final int? maximumQuantity;
  final double? reductionPrice;
  final double? price;
  final int? quantity;
  final String? choiceType;
  final Colour? color;
  final String? status;
  Variant(
      {this.id,
      this.isDefault,
      this.maximumQuantity,
      this.minimumQuantity,
      this.name,
      this.price,
      this.quantity,
      this.reductionPrice,
      this.choiceType,
      this.color,
      this.status,
      });

  @override
  List<Object?> get props => [
        id,
        isDefault,
        maximumQuantity,
        minimumQuantity,
        name,
        price,
        quantity,
        reductionPrice,
        choiceType,
        color,
        status
      ];

  factory Variant.fromJson(Map<String, dynamic> json) =>
      _$VariantFromJson(json);

  Map<String, dynamic> toJson() => _$VariantToJson(this);
}




@JsonSerializable()
class Category extends Equatable{
  @JsonKey(name: '_id')
  final String? id;
  final String? code;
  final String? nameEn;
  final String? nameAr;
  final String? nameFr;
  final int? order;
  final String? avatar;
  final bool? active;
  final bool? listProductsInHomePage;
  final SubCategory? subCategories;
  final bool? isBigImage;
  final String? descriptionEn;
  final String? descriptionAr;
  final String? descriptionFr;

  Category({required this.id, required this.code, required this.nameEn, required this.nameAr, required this.nameFr, required this.order, required this.avatar, required this.active, required this.listProductsInHomePage, required this.subCategories, required this.isBigImage, required this.descriptionEn, required this.descriptionAr, required this.descriptionFr});



  @override
  List<Object?> get props => [id,code,nameAr,nameEn,nameFr,order,avatar,active,listProductsInHomePage,subCategories,isBigImage,descriptionAr,descriptionEn,descriptionFr];
  
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class SubCategory extends Equatable{
  @JsonKey(name: '_id')
  final String? id;
  final String? code;
  final String? nameAr;
  final String? nameEn;
  final String? nameFr;
  final String? avatar;
  final int? order;
  final Category? category;

  SubCategory({required this.id, this.code,  this.nameAr, this.nameEn,  this.nameFr,  this.avatar,  this.order,  this.category});
  @override
  List<Object?> get props =>[id,code,nameAr,nameEn,nameFr,avatar,order,category];

factory SubCategory.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryToJson(this);  
}






@JsonSerializable()
class Product extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String? nameEn;
  final String? nameAr;
  final String? nameFr;
  final String? descriptionEn;
  final String? descriptionAr;
  final String? descriptionFr;
  final bool? featured;
  final bool? hasOffer;
  final bool? active;
 // final String? status;
  final int? order;
  final List<String?>? avatar;
  final String? thumbnailImage;
  final String? variantName;
  final Brand? brand;
  final Colour? color;
  final List<Variant>? variants;
  final Tax? tax;
  final String? variantChoiceName;
  final List<SubCategory>? subCategories;
  final List<Category>? categories;
  final String? sku;

  Product({
    this.active,
    this.avatar,
    this.brand,
    this.descriptionAr,
    this.descriptionEn,
    this.featured,
    this.hasOffer,
    this.id,
    this.nameAr,
    this.nameEn,
    this.order,
   // this.status,
    this.thumbnailImage,
    this.variantName,
    this.variants,
    this.tax,
    this.nameFr,
    this.descriptionFr,
    this.variantChoiceName,
    this.color,
    this.categories,
    this.subCategories,
    this.sku,
  });

  @override
  List<Object?> get props => [
        active,
        avatar,
        brand,
        descriptionAr,
        descriptionEn,
        featured,
        hasOffer,
        id,
        nameAr,
        nameEn,
        order,
      //  status,
        thumbnailImage,
        variantName,
        variants,
        tax,
        color,
        categories,
        subCategories,
        sku,
      ];

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  void sort(Function(dynamic a, dynamic b) param0) {}
}

@JsonSerializable()
class CustomerPoducts extends Equatable {
  final int? totalCount;
  final List<Product>? products;

  CustomerPoducts({
    this.products,
    this.totalCount,
  });

  @override
  List<Object?> get props => [totalCount, products];

  factory CustomerPoducts.fromJson(Map<String, dynamic> json) =>
      _$CustomerPoductsFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerPoductsToJson(this);
}
