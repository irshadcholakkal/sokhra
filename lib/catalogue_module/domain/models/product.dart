import 'package:freezed_annotation/freezed_annotation.dart';

import 'brand.dart';
import 'category.dart';
import 'color.dart';
import 'map_product_region.dart';
import 'product_status.dart';
import 'seller.dart';
import 'sub_category.dart';
import 'tag.dart';
import 'variant.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory Product({
    @JsonKey(name: "_id") final String? productId,
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
    final List<MapProductRegion>? productRegion,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

 // void sort(Function(dynamic a, dynamic b) param0) {}
}
