import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base_module/domain/entity/translation.dart';
import '../../../base_module/presentation/core/values/app_constants.dart';
import '../../../user_module/domain/user_data.dart';
import '../../domain/models/order_data_table.dart';
import '../feature/orders/blocs/repeat_order_bloc/repeat_order_bloc.dart';

class CustomAppDataTable extends StatefulWidget {
  final String? title;
  final List<DataTableFilter>? filters;
  final String orderId;
  final Function? onAdd;
  final Function? onSearch;
  final DataRow Function(int, dynamic)? generateRow;
  final OrderDataTableModel data;
  final List<DataColumn> dataColumns;
  final Function? onPageChange;
  final Function? onFilterChange;
  final bool isLoading;
  final String paymentStatus;

  const CustomAppDataTable({
    Key? key,
    this.paymentStatus = "",
    this.title,
    this.filters,
    required this.orderId,
    this.onAdd,
    this.onSearch,
    required this.data,
    required this.dataColumns,
    this.generateRow,
    this.onPageChange,
    this.onFilterChange,
    this.isLoading = false,
  }) : super(key: key);

  @override
  _CustomAppDataTableState createState() => _CustomAppDataTableState();
}

class _CustomAppDataTableState extends State<CustomAppDataTable> {
  @override
  Widget build(BuildContext context) {
    List<DataRow> _dataRow = [];

    generateRow(List<DataRow> dataRow, OrderDataTableModel data) {
      int i = 0;
      data.orderData?.forEach((element) {
        dataRow.add(DataRow(cells: [
          DataCell(Text((i + 1).toString())),
          DataCell(Text(element.productName != null
              ? element.productName.toString()
              : '')),
          DataCell(
              Text(element.price != null ? "${element.price ?? 0.0}" : '')),
          DataCell(
            Text(element.quantity != null ? "${element.quantity ?? 0}" : ''),
          ),
          DataCell(
            Text(element.total != null ? "₹  ${element.total ?? 0.0}" : ''),
          ),
        ]));
        i++;
      });
      dataRow.add(DataRow(cells: [
        DataCell(Text("")),
        DataCell(Text("")),
        DataCell(Text("")),
        DataCell(Text("")),
        DataCell(Text("")),
      ]));
      dataRow.add(DataRow(cells: [
        DataCell(Text("")),
        DataCell(Text(translation.of("orders.delivery_charge"))),
        DataCell(Text("")),
        DataCell(Text("")),
        DataCell(Text("₹ " + data.deliveryCharge.toString())),
      ]));
      dataRow.add(DataRow(cells: [
        DataCell(Text("")),
        DataCell(Text(
          translation.of("orders.total"),
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600),
        )),
        DataCell(Text("")),
        DataCell(Text("")),
        DataCell(Text(
          "₹ ${data.total ?? translation.of("n/a")}",
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600),
        )),
      ]));
    }

    generateRow(_dataRow, widget.data);

    return Column(
      children: [
        if (widget.isLoading)
          const DataTableLoadingIndicator()
        else
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DataTable(columns: widget.dataColumns, rows: _dataRow),
                  Container(
                    constraints: BoxConstraints(maxWidth: 600),
                    padding: EdgeInsets.all(AppConstants.defaultPadding),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Container(
                          //   child: Row(
                          //     mainAxisSize: MainAxisSize.min,
                          //     children: [
                          //       widget.paymentStatus == "SUCCESS"
                          //           ? Icon(
                          //               Icons.check,
                          //               color: Theme.of(context)
                          //                   .colorScheme
                          //                   .primary,
                          //             )
                          //           : Container(),
                          //       SizedBox(
                          //         width: 10,
                          //       ),
                          //       Text(
                          //         widget.paymentStatus,
                          //         style: Theme.of(context)
                          //             .textTheme
                          //             .subtitle2!
                          //             .copyWith(
                          //               color: Theme.of(context)
                          //                   .colorScheme
                          //                   .primary,
                          //             ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // Container(
                          //     width: 200,
                          //     child: TextButton(
                          //         onPressed: () {},
                          //         child: Text(
                          //           translation
                          //               .of("orders.download_invoice")
                          //               .toUpperCase(),
                          //           style: Theme.of(context)
                          //               .textTheme
                          //               .button!
                          //               .copyWith(
                          //                 color: Theme.of(context)
                          //                     .colorScheme
                          //                     .primary,
                          //                 decoration: TextDecoration.underline,
                          //                 decorationColor: Theme.of(context)
                          //                     .colorScheme
                          //                     .primary,
                          //               ),
                          //         ))), //TODO add download invoice functionality
                          Container(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                    horizontal: AppConstants.defaultPadding,
                                    vertical: AppConstants.defaultPadding / 4,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                BlocProvider.of<RepeatOrderBloc>(context).add(
                                    RepeatOrderCreateEvent(
                                        orderId: widget.orderId,
                                        // pinCode: userData.pinCode,
                                    lng: userData.lng,
                                      lat: userData.lat,
                                    ));
                              },
                              child: Text(
                                translation.of("orders.reorder").toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .button!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary),
                              ),
                            ),
                          )
                        ]),
                  ),
                ],
              )),
      ],
    );
  }
}

class DataTableLoadingIndicator extends StatelessWidget {
  const DataTableLoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
        // child: SkeletonLoader(
        //   builder: Container(
        //     margin: const EdgeInsets.fromLTRB(AppConstants.defaultPadding,
        //         AppConstants.defaultPadding, AppConstants.defaultPadding, 0),
        //     child: Expanded(
        //       child: Container(
        //         width: double.infinity,
        //         height: AppConstants.defaultPadding * 1,
        //         decoration: BoxDecoration(
        //           color: Theme.of(context).scaffoldBackgroundColor,
        //           borderRadius: BorderRadius.circular(AppConstants.cornerRadius),
        //         ),
        //       ),
        //     ),
        //   ),
        //   items: 6,
        //   period: const Duration(seconds: 1),
        //   baseColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        //   highlightColor: Theme.of(context).colorScheme.surface,
        //   direction: translation.isArabic
        //       ? SkeletonDirection.rtl
        //       : SkeletonDirection.ltr,
        // ),
        );
  }
}

class CustomDataTableSource extends DataTableSource {
  final List<dynamic> demoData;
  final DataRow Function(int, dynamic) generateRow;

  CustomDataTableSource({required this.generateRow, required this.demoData});
  @override
  DataRow getRow(int index) {
    final dynamic rowData = demoData[index];
    // return DataRow.byIndex(cells: <DataCell>[DataCell(Text(index.toString()))]);

    return generateRow(index, rowData);
    // TODO: FIX ME
  }

  @override
  int get rowCount => demoData.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}

class DataTableFilter {
  final String? title;
  final String? filterKey;
  final String? value;
  DataTableFilter({this.title, this.filterKey, this.value});
}
