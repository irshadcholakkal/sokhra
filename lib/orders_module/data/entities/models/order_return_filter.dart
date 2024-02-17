import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_return_filter.freezed.dart';
part 'order_return_filter.g.dart';

@freezed
class OrderReturnFilter with _$OrderReturnFilter {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory OrderReturnFilter({
    final String? status,
    final String? regionFilter,
    final String? searchKey,
    final String? returnDate,
    final String? invoiceDate,
  }) = _OrderReturnFilter;

  factory OrderReturnFilter.fromJson(Map<String, dynamic> json) =>
      _$OrderReturnFilterFromJson(json);
}
