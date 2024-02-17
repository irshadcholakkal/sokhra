import 'package:flutter/material.dart';

import 'app_data_table_header.dart';

// ref:
// https://stackoverflow.com/questions/54376593/flutter-paginateddatatable-rowsperpage
// https://medium.com/codechai/flutter-web-and-paginateddatatable-3779da7683e

class AppDataTable extends StatefulWidget {
  final bool headerRequired;
  final String? title;
  final List<DataTableFilter>? filters;
  final Function? onAdd;
  final Function? onSearch;
  final DataRow Function(int, dynamic) generateRow;
  final List<dynamic>? tableData;
  final List<DataColumn> dataColumns;
  final Function? onPageChange;
  final Function? onFilterChange;
  final bool isLoading;

  const AppDataTable(
      {Key? key,
      this.title,
      this.filters,
      this.onAdd,
      this.onSearch,
      required this.tableData,
      required this.dataColumns,
      required this.generateRow,
      this.onPageChange,
      this.onFilterChange,
      this.isLoading = false,
      this.headerRequired = false})
      : super(key: key);
  @override
  _AppDataTableState createState() => _AppDataTableState();
}

class _AppDataTableState extends State<AppDataTable> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int? _rowsPerPage1 = PaginatedDataTable.defaultRowsPerPage;

  @override
  Widget build(BuildContext context) {
    final List<dynamic> _tableData = widget.tableData ?? [];
    final CustomDataTableSource _dataTableSource = CustomDataTableSource(
      demoData: _tableData,
      generateRow: widget.generateRow,
    );

    final int tableItemsCount = _dataTableSource.rowCount;
    final int defaultRowsPerPage = PaginatedDataTable.defaultRowsPerPage;
    final bool isRowCountLessDefaultRowsPerPage =
        tableItemsCount < defaultRowsPerPage;
    _rowsPerPage =
        isRowCountLessDefaultRowsPerPage ? tableItemsCount : defaultRowsPerPage;
    return Column(
      children: [
        widget.headerRequired
            ? AppDataTableHeader(
                title: widget.title,
                filters: widget.filters,
                onFilterChange: widget.onFilterChange,
                onAdd: widget.onAdd,
                onSearch: widget.onSearch,
              )
            : Container(),
        if (widget.isLoading)
          const DataTableLoadingIndicator()
        else
          PaginatedDataTable(
            rowsPerPage: isRowCountLessDefaultRowsPerPage
                ? _rowsPerPage
                : _rowsPerPage1!,
            onRowsPerPageChanged: isRowCountLessDefaultRowsPerPage
                ? null
                : (rowCount) {
                    setState(() {
                      _rowsPerPage1 = rowCount;
                    });
                  },
            onPageChanged: (skip) {
              widget.onPageChange!(skip, defaultRowsPerPage);
            },
            columns: widget.dataColumns,
            source: _dataTableSource,
            showCheckboxColumn: false,
          ),
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
