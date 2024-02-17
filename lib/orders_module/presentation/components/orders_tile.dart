import 'package:flutter/material.dart';
import 'package:lumiereorganics_app/base_module/domain/entity/color_scheme.dart';

import '../../../base_module/domain/entity/translation.dart';
import '../../../base_module/presentation/core/values/app_constants.dart';
import '../../domain/models/order_data_table.dart';
import '../../domain/models/order_status.dart';
import 'custom_app_data_table.dart';

class OrdersTile extends StatelessWidget {
  final String? date;
  final OrderStatus? status;
  final String paymentStatus;
  final String orderId;
  const OrdersTile({
    Key? key,
    required OrderDataTableModel dataTableModel,
    required this.paymentStatus,
    required this.orderId,
    required this.date,
    required this.status,
  })  : _dataTableModel = dataTableModel,
        super(key: key);

  final OrderDataTableModel _dataTableModel;

  @override
  Widget build(BuildContext context) {
    List<String> list = status.toString().split(".");
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.defaultPadding / 2.2,
          vertical: AppConstants.defaultPadding / 5),
      child: ExpansionTile(
        collapsedBackgroundColor: Theme.of(context).colorScheme.surface,
        backgroundColor: Theme.of(context).colorScheme.surface,
        iconColor: Theme.of(context).colorScheme.primary,
        collapsedIconColor: Theme.of(context).colorScheme.primary,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          width: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${date}",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              Text(
                status == OrderStatus.DELIVERED
                    ? translation.of("orders.delivered")
                    : status == OrderStatus.DECLINED
                        ? translation.of("payment.cancelled")
                        : "${list[1]}",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: status == OrderStatus.DELIVERED
                        ? Colors.green
                        : status == OrderStatus.DECLINED
                            ? Colors.red
                            : AppColorScheme.onBlack),
              ),
            ],
          ),
        ),
        children: [
          CustomAppDataTable(
            paymentStatus: paymentStatus,
            orderId: orderId,
            dataColumns: [
              DataColumn(label: Text("#")),
              DataColumn(label: Text(translation.of("orders.item"))),
              DataColumn(label: Text(translation.of("orders.price"))),
              DataColumn(label: Text(translation.of("orders.quantity"))),
              DataColumn(label: Text(translation.of("orders.total"))),
            ],
            data: _dataTableModel,
          )
        ],
      ),
    );
  }
}
