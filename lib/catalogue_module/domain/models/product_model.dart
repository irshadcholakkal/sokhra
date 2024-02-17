import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class Product with _$Product {
  // @JsonKey(defaultValue: [])
//  final List<ProductTag> tags;
//   final ProductColor color;
  // @JsonKey(defaultValue: true)
  // final bool active;
  @JsonSerializable(
    explicitToJson: true,
  )
  const factory Product({
    @JsonKey(name: '_id') required final String id,
    required final String nameEn,
    required final String nameAr,
    required final String descriptionEn,
    required final String descriptionAr,
    // final Seller seller;
    @JsonKey(name: 'avatar', defaultValue: [])
        required final List<String> images,
    @JsonKey(defaultValue: 0) required final double price,
    @JsonKey(defaultValue: true) required final bool isQuantityInMeters,
    @JsonKey(defaultValue: 1) required final double minimumQuantity,
    @JsonKey(defaultValue: 0) required final double quantity,
  }) = _Product;

  static List<Product> processProductList(List<Product> list) {
    return list.fold([], (result, item) {
          // if (item != null) {
          result?.add(item);
          // }

          return result;
        }) ??
        [];
  }

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
