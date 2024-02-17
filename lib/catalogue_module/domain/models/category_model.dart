import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class SubCategory extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String? nameEn;
  final String? nameAr;
    final String? nameFr;

  final String? avatar;
  final String? thumbnail;
  final int? order;

  SubCategory({
    this.id,
    this.nameEn,
    this.nameAr,
        this.nameFr,

    this.avatar,
    this.thumbnail,
    this.order,
  });

  @override
  List<Object?> get props => [
        id,
        nameEn,
        nameAr,
        nameFr,
        avatar,
        order,
      ];

  factory SubCategory.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryToJson(this);
}

@JsonSerializable()
class Category extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String? nameEn;
  final String? nameAr;
  final String? nameFr;


  final String? avatar;
  final bool? active;
  final bool? isBigImage;

  final List<SubCategory>? subCategories;

  Category({
    this.active,
    this.avatar,
    this.id,
    this.nameEn,
    this.nameAr,this.nameFr,
    this.subCategories,
    this.isBigImage
  });

  @override
  List<Object?> get props => [
        id,
        nameEn,
        avatar,
        active,
        subCategories,
        isBigImage,
        nameAr,
        nameFr

      ];

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class CategoryRootModel extends Equatable {
  final List<Category>? categories;

  CategoryRootModel({
    this.categories,
  });

  @override
  List<Object?> get props => [
        categories,
      ];

  factory CategoryRootModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryRootModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryRootModelToJson(this);
}
