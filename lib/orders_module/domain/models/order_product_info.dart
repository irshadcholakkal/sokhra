import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_product_info.freezed.dart';

part 'order_product_info.g.dart';

@freezed
class OrderProductInfo with _$OrderProductInfo {
  @JsonSerializable(includeIfNull: false)
  const factory OrderProductInfo({
    final String? thumbnailImage,
    final String? name,
    final String? variant,
  }) = _OrderProductInfo;

  factory OrderProductInfo.fromJson(Map<String, dynamic> json) =>
      _$OrderProductInfoFromJson(json);
}
