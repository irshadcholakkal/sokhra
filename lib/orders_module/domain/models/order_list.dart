import 'package:freezed_annotation/freezed_annotation.dart';
import 'order.dart';

part 'order_list.freezed.dart';

part 'order_list.g.dart';

@freezed
class OrderList with _$OrderList {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory OrderList({
    final int? totalCount,
    @JsonValue([]) final List<Order>? orders,
  }) = _OrderList;

  factory OrderList.fromJson(Map<String, dynamic> json) =>
      _$OrderListFromJson(json);
}

// import 'package:flutter/foundation.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
//
// import 'order.dart';
//
// part 'order_list.freezed.dart';
// part 'order_list.g.dart';
//
// @freezed
// class OrderList with _$OrderList {
//   @JsonSerializable(explicitToJson: true,includeIfNull: false)
//   const factory OrderList({
//
//   @JsonValue([]) final List<Order>? orders,
//   final int? totalCount,
//   }) = _OrderList;
//
//   factory OrderList.fromJson(Map<String, dynamic> json) =>
//       _$OrderListFromJson(json);
// }
