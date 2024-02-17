import 'package:freezed_annotation/freezed_annotation.dart';

part 'promocode_info.freezed.dart';

part 'promocode_info.g.dart';

@freezed
class PromoCodeInfo with _$PromoCodeInfo {
  @JsonSerializable(includeIfNull: false)
  const factory PromoCodeInfo({
    final double? discountedPrice,
    final double? price,
    final double? discount,
    final double? deliveryCharge,
    final double? netPrice,
    final String? promoCode,
  }) = _PromoCodeInfo;

  factory PromoCodeInfo.fromJson(Map<String, dynamic> json) =>
      _$PromoCodeInfoFromJson(json);
}
