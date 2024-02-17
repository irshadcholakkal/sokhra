import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_data.freezed.dart';

@freezed
class OrderData with _$OrderData {
  const factory OrderData({
    final String? productName,
    final double? price,
    final double? quantity,
    final double? total,
  }) = _OrderData;
}
