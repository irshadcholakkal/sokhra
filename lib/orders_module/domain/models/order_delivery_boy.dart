import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_delivery_boy.freezed.dart';
part 'order_delivery_boy.g.dart';

@freezed
class OrderDeliveryBoy with _$OrderDeliveryBoy {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory OrderDeliveryBoy({final String? name, final String? phone}) =
      _OrderDeliveryBoy;

  factory OrderDeliveryBoy.fromJson(Map<String, dynamic> json) =>
      _$OrderDeliveryBoyFromJson(json);
}
