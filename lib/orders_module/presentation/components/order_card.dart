import 'package:flutter/material.dart';

import '../../../base_module/domain/entity/color_scheme.dart';
import '../../../base_module/presentation/component/images/custom_network_image.dart';
import '../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../base_module/presentation/core/values/app_constants.dart';
import '../../../base_module/presentation/util/date_time_helper.dart';
import '../../../base_module/presentation/util/string_modifiers.dart';
import '../../domain/models/order.dart';
import '../../domain/models/order_status.dart';
import '../feature/orders/screens/order_details_screen.dart';

class OrderCard extends StatefulWidget {
  final Order order;

  const OrderCard({Key? key, required this.order}) : super(key: key);

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  String get _orderStatusMessage {
    switch (widget.order.status) {
      case OrderStatus.PENDING:
        return "Order is confirmed";
      case OrderStatus.DISPATCHED:
        return "Order is dispatched";
      case OrderStatus.DELIVERED:
        return "Order is delivered";
      case OrderStatus.DECLINED:
        return "Order is declined";
      case OrderStatus.CANCELLED:
        return "Order is cancelled";
      case OrderStatus.DISPATCH_HELD:
        return "Order is dispatch held";
      default:
        return "";
    }
  }

  String get _orderPriceAndDate {
    try {
      final price = widget.order.pricing?.billedValue?.toStringAsFixed(2) ?? "";

      final utcTime =
          dateTimeHelper.parseDateTimeString(dateTime: widget.order.createdAt);
      final localTime = dateTimeHelper.toDateTimeString(utcTime,
          dateFormat: "d MMM yyyy, hh:mm a");

      return "₹$price  -  $localTime";
    } catch (_) {}

    return "";
  }

  Color get _orderStatusColor {
    switch (widget.order.status) {
      case OrderStatus.PENDING:
        return Colors.blue;
      case OrderStatus.DISPATCHED:
        return Colors.blue;
      case OrderStatus.DELIVERED:
        return Colors.green;
      case OrderStatus.DECLINED:
        return Colors.red;
      case OrderStatus.CANCELLED:
        return Colors.red;
      case OrderStatus.DISPATCH_HELD:
        return Colors.red;
      default:
        return Colors.transparent;
    }
  }

  String get _orderStatus {
    switch (widget.order.status) {
      case OrderStatus.PENDING:
        return "Active";
      case OrderStatus.DISPATCHED:
        return "Dispatched";
      case OrderStatus.DELIVERED:
        return "Delivered";
      case OrderStatus.DECLINED:
        return "Declined";
      case OrderStatus.CANCELLED:
        return "Cancelled";
      case OrderStatus.DISPATCH_HELD:
        return "Dispatch held";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = widget.order.orders ?? [];

    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => OrderDetailsScreen(order: widget.order),
        ));
      },
      child: Container(
        height: 132,
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.all(
            Radius.circular(AppConstants.cornerRadiusLarge),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppPadding(dividedBy: 3),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding / 3,
              ),
              child: Row(
                children: [
                  _orderStatusIcon(),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                _orderStatusMessage,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 14,
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                          ],
                          mainAxisSize: MainAxisSize.max,
                        ),
                        SizedBox(height: 2),
                        Text(
                          _orderPriceAndDate,
                          style: Theme.of(context).textTheme.caption?.copyWith(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(0.5),
                              ),
                        )
                      ],
                    ),
                  ),
                  // SizedBox(width: 8),
                  // Row(
                  //   children: [
                  //     CircleAvatar(
                  //       backgroundColor: _orderStatusColor,
                  //       radius: 4,
                  //     ),
                  //     SizedBox(width: 8),
                  //     Container(
                  //       padding: EdgeInsets.symmetric(
                  //         vertical: 4,
                  //         horizontal: 12,
                  //       ),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(color: _orderStatusColor),
                  //         borderRadius: const BorderRadius.all(
                  //           Radius.circular(AppConstants.cornerRadius / 3),
                  //         ),
                  //       ),
                  //       child: Text(
                  //         _orderStatus,
                  //         style: Theme.of(context).textTheme.caption?.copyWith(
                  //               fontWeight: FontWeight.w400,
                  //               color: _orderStatusColor,
                  //             ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            AppPadding(dividedBy: 3),
            Divider(height: 1),
            AppPadding(dividedBy: 3),
            SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.defaultPadding / 3,
                ),
                child: Container(
                  // color: Colors.yellow,
                  child: Row(
                    children: items.map((item) {
                      return Padding(
                        padding: const EdgeInsetsDirectional.only(end: 8.0),
                        child: CustomNetworkImage(
                          height: 48,
                          width: 48,
                          urlList: [
                            StringModifiers.toUrl(
                              item.productInfo?.thumbnailImage,
                            )
                          ],
                          border: Border.all(
                            color: AppColorScheme.productCardBorderColor,
                          ),
                          borderRadius: AppConstants.cornerRadius,
                          fit: BoxFit.contain,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _orderStatusIcon() {
    final isDelivered = [OrderStatus.DELIVERED].contains(widget.order.status);
    final isCancelled = [
      OrderStatus.DECLINED,
      OrderStatus.CANCELLED,
      OrderStatus.DISPATCH_HELD
    ].contains(widget.order.status);
    final isPending = !isDelivered && !isCancelled;

    return Container(
      width: 36,
      height: 36,
      // color: Colors.red,
      alignment: Alignment.center,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.cornerRadius / 1.5),
        color: isPending
            ? AppColorScheme.disabledColor.withOpacity(0.2)
            : _orderStatusColor.withOpacity(0.2),
      ),
      child: Icon(
        isPending
            ? Icons.pedal_bike_rounded
            : isDelivered
                ? Icons.done_rounded
                : isCancelled
                    ? Icons.close_rounded
                    : Icons.warning_rounded,
        size: 20,
        color: isPending ? Colors.blue : _orderStatusColor,
      ),
    );
  }
}
