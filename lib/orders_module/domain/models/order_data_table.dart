import 'package:freezed_annotation/freezed_annotation.dart';

import 'order_data.dart';

part 'order_data_table.freezed.dart';

@freezed
class OrderDataTableModel with _$OrderDataTableModel {
  const factory OrderDataTableModel({
    @Default([]) final List<OrderData>? orderData,
    final double? deliveryCharge,
    final double? total,
  }) = _OrderDataTableModel;
}
