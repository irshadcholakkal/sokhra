import 'package:freezed_annotation/freezed_annotation.dart';

part 'tax_details.freezed.dart';
part 'tax_details.g.dart';

@freezed
class TaxDetails with _$TaxDetails {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory TaxDetails({
    @JsonKey(name: "_id") final String? id,
    final String? name,
    final double? percentage,
  }) = _TaxDetails;

  factory TaxDetails.fromJson(Map<String, dynamic> json) =>
      _$TaxDetailsFromJson(json);
}
