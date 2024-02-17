import 'package:freezed_annotation/freezed_annotation.dart';

import 'product.dart';

part 'product_list.freezed.dart';
part 'product_list.g.dart';

@Freezed()
class ProductList with _$ProductList {
  @JsonSerializable(explicitToJson: true,includeIfNull: false)
  const factory ProductList({
    @JsonKey(defaultValue: []) required final List<Product> products,
    required final int totalCount,
  }) = _ProductList;

  factory ProductList.fromJson(Map<String, dynamic> json) =>
      _$ProductListFromJson(json);
}
