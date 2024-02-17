import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../orders_module/domain/models/tax_details.dart';

part 'tax.freezed.dart';
part 'tax.g.dart';

@freezed
class Tax with _$Tax {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory Tax(
      {@JsonKey(name: "_id") final String? id,
      final String? hsnCode,
      final String? hsnTaxCode,
      final List<TaxDetails>? tax}) = _Tax;

  factory Tax.fromJson(Map<String, dynamic> json) => _$TaxFromJson(json);
}
