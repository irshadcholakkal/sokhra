import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_history.freezed.dart';
part 'order_history.g.dart';

@freezed
class OrderHistory with _$OrderHistory {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory OrderHistory({
    final String? createdAt,
    final String? note,
  }) = _OrderHistory;

  factory OrderHistory.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryFromJson(json);
}
