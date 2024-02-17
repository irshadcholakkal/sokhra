import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/models/order_status.dart';

part 'order_filter.freezed.dart';
part 'order_filter.g.dart';

@freezed
class OrderFilter with _$OrderFilter {
  @JsonSerializable(explicitToJson: true,includeIfNull: false)

  const factory OrderFilter({
    final String? name,
    final String? phone,
    final String? paymentId,
    final OrderStatus? status,
    final String? deviceId,
    final String? regionFilter,
    final String? zoneFilter,
    final String? searchKey,
    final String? deliveryDate,
    final String? orderDate,
    final String? fromDate,
    final String? toDate
  }) = _OrderFilter;

  factory OrderFilter.fromJson(Map<String, dynamic> json) =>
      _$OrderFilterFromJson(json);
}
