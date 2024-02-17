import 'package:freezed_annotation/freezed_annotation.dart';
import 'sub_choices.dart';

part 'variant.freezed.dart';
part 'variant.g.dart';

@freezed
class Variant with _$Variant {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory Variant({
    @JsonKey(name: "_id") final String? variantId,
    final String? name,
    final int? minimumQuantity,
    final int? maximumQuantity,
    final bool? isDefault,
    final double? price,
    final int? quantity,
    final double? reductionPrice,
    final String? choiceType,
    final List<SubChoice>?subChoices
  }) = _Variant;

  factory Variant.fromJson(Map<String, dynamic> json) =>
      _$VariantFromJson(json);
}
