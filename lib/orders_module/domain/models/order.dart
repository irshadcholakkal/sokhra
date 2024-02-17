import 'package:freezed_annotation/freezed_annotation.dart';
import 'order_pricing.dart';
import 'order_product.dart';
import 'order_status.dart';
import 'payment_details.dart';
import 'shipping_details.dart';

part 'order.freezed.dart';

part 'order.g.dart';

@freezed
class Order with _$Order {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory Order({
    @JsonKey(name: "_id") final String? id,
    final int? orderNumber,
    final OrderStatus? status,
    final String? reason,
    final OrderPricing? pricing,
    final String? deliveryDate,
    @JsonValue([]) final List<OrderProduct>? orders,
    final ShippingDetails? shippingDetails,
    final PaymentDetails? payment,
    final String? createdAt,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
