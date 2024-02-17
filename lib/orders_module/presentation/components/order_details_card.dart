import 'package:flutter/material.dart';

import '../../../base_module/domain/entity/color_scheme.dart';
import '../../../base_module/presentation/component/images/custom_network_image.dart';
import '../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../base_module/presentation/core/values/app_constants.dart';
import '../../../base_module/presentation/util/date_time_helper.dart';
import '../../../base_module/presentation/util/string_modifiers.dart';
import '../../domain/models/order.dart';
import '../../domain/models/order_status.dart';

class OrderDetailsCard extends StatefulWidget {
  final Order order;

  const OrderDetailsCard({Key? key, required this.order}) : super(key: key);

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderDetailsCard> {
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

  String get _orderDate {
    try {
      final price = widget.order.pricing?.billedValue?.toStringAsFixed(2) ?? "";

      final utcTime =
          dateTimeHelper.parseDateTimeString(dateTime: widget.order.createdAt);
      final localTime = dateTimeHelper.toDateTimeString(utcTime,
          dateFormat: "d MMM yyyy, hh:mm a");

      return "$localTime";
      // return "₹$price  -  $localTime";
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
    final deliveryCharge =
        widget.order.pricing?.deliveryCharge?.toStringAsFixed(2) ?? "-";
    final taxAmount = widget.order.pricing?.tax?.toStringAsFixed(2) ?? "-";
    final grandTotal =
        widget.order.pricing?.billedValue?.toStringAsFixed(2) ?? "-";

    return Column(
      children: [
        //order summary
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.defaultPadding / 3,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: const BorderRadius.all(
              Radius.circular(AppConstants.cornerRadiusLarge),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppPadding(dividedBy: 3),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order summary",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(
                                fontWeight: FontWeight.w700,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: _orderStatusColor,
                        radius: 4,
                      ),
                      SizedBox(width: 8),
                      Container(
                        // padding: EdgeInsets.symmetric(
                        //   vertical: 4,
                        //   horizontal: 12,
                        // ),
                        // decoration: BoxDecoration(
                        //   border: Border.all(color: _orderStatusColor),
                        //   borderRadius: const BorderRadius.all(
                        //     Radius.circular(AppConstants.cornerRadius / 3),
                        //   ),
                        // ),
                        child: Text(
                          _orderStatus,
                          style: Theme.of(context).textTheme.caption?.copyWith(
                                fontWeight: FontWeight.w400,
                                color: _orderStatusColor,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              AppPadding(dividedBy: 6),
              Text(
                "${items.length} item(s) in this order",
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                textAlign: TextAlign.start,
              ),
              AppPadding(dividedBy: 2),
              SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: items.map((item) {
                    final product = item.productInfo?.name ?? "-";
                    final variant = item.productInfo?.variant ?? "-";
                    final quantity = item.quantity?.toString() ?? "-";
                    final totalPrice =
                        item.pricing?.netAmount?.toStringAsFixed(2) ?? "-";

                    return Padding(
                      padding: const EdgeInsetsDirectional.only(bottom: 8.0),
                      child: Row(
                        children: [
                          CustomNetworkImage(
                            height: 52,
                            width: 52,
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
                          SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.55,
                                  child: Text(
                                    "$product",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                        ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "$variant x $quantity",
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption
                                            ?.copyWith(
                                              fontWeight: FontWeight.w400,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onBackground
                                                  .withOpacity(0.5),
                                            ),
                                      ),
                                    ),
                                    Text(
                                      "₹$totalPrice",
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onBackground,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              AppPadding(dividedBy: 6),
            ],
          ),
        ),
        AppPadding(dividedBy: 2),
        //bill details
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.defaultPadding / 3,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: const BorderRadius.all(
              Radius.circular(AppConstants.cornerRadiusLarge),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppPadding(dividedBy: 3),
              Text(
                "Bill details",
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              AppPadding(dividedBy: 3),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delivery charge",
                    style: Theme.of(context).textTheme.caption?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                  Text(
                    "₹$deliveryCharge",
                    style: Theme.of(context).textTheme.caption?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  )
                ],
              ),
              AppPadding(dividedBy: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Grand total',
                          style: Theme.of(context).textTheme.caption?.copyWith(
                                fontWeight: FontWeight.w600,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                        ),
                        TextSpan(
                          text: ' (Inc tax ₹${taxAmount})',
                          style: Theme.of(context).textTheme.caption?.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 9,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(0.65),
                              ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    "₹${grandTotal}",
                    style: Theme.of(context).textTheme.caption?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                ],
              ),
              AppPadding(dividedBy: 3),
            ],
          ),
        ),
        AppPadding(dividedBy: 2),
        //order details
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.defaultPadding / 3,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: const BorderRadius.all(
              Radius.circular(AppConstants.cornerRadiusLarge),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppPadding(dividedBy: 3),
              SizedBox(
                width: double.infinity,
                child: Text(
                  "Order details",
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
              AppPadding(dividedBy: 3),
              Text(
                "Order id",
                style: Theme.of(context).textTheme.caption?.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.5),
                    ),
              ),
              SizedBox(height: 2),
              Text(
                widget.order.orderNumber?.toString() ?? "",
                style: Theme.of(context).textTheme.caption?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              AppPadding(dividedBy: 3),
              Text(
                "Deliver to",
                style: Theme.of(context).textTheme.caption?.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.5),
                    ),
              ),
              SizedBox(height: 2),
              Text(
                [
                  widget.order.shippingDetails?.firstname ?? "",
                  widget.order.shippingDetails?.house ?? "",
                  widget.order.shippingDetails?.landmark ?? "",
                  widget.order.shippingDetails?.street ?? "",
                  widget.order.shippingDetails?.district ?? "",
                  widget.order.shippingDetails?.state ?? "",
                  widget.order.shippingDetails?.pincode ?? "",
                ].where((e) => e.isNotEmpty).join(", "),
                style: Theme.of(context).textTheme.caption?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              AppPadding(dividedBy: 3),
              Text(
                "Order placed",
                style: Theme.of(context).textTheme.caption?.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.5),
                    ),
              ),
              SizedBox(height: 2),
              Text(
                _orderDate,
                style: Theme.of(context).textTheme.caption?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              AppPadding(dividedBy: 3),
            ],
          ),
        ),
      ],
    );
  }
}
