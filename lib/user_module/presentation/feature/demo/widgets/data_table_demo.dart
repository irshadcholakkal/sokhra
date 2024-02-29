import 'package:flutter/material.dart';

import '../../../../../base_module/presentation/component/data_table/app_data_table.dart';
import '../../../../../base_module/presentation/component/padding/app_padding.dart';
import 'form_demo_content.dart';

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  List<dynamic>? tableDemoData;
  @override
  void initState() {
    tableDemoData = [
      DataTableDemoModel("100", "John", "Kuwait"),
      DataTableDemoModel("200", "John", "India"),
      DataTableDemoModel("300", "John", "Kuwait"),
      DataTableDemoModel("400", "John", "India"),
      DataTableDemoModel("500", "John", "Kuwait"),
      DataTableDemoModel("600", "John", "India"),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppPadding(),
        Text(
          "Table",
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const AppPadding(dividedBy: 2),
        AppDataTable(
          title: "Demo Table",
          tableData: tableDemoData,
          dataColumns: const [
            DataColumn(label: Text('#')),
            DataColumn(label: Text('Vendor')),
            DataColumn(label: Text('Price')),
            DataColumn(label: Text('Place'))
          ],
          onPageChange: (int skip, int limit) {
            //Fetch updated data here
            debugPrint(skip.toString());
            debugPrint(limit.toString());
          },
          onAdd: () {
            setState(() {
              tableDemoData!.add(DataTableDemoModel("66", "John", "India"));
            });
          },
          onSearch: (String searchKey) {
            //Fetch updated data here
            debugPrint(searchKey);
          },
          filters: [
            DataTableFilter(
                filterKey: 'vendor',
                title: 'Vendor One',
                value: "e54j4543kk65mm342435"),
            DataTableFilter(
                filterKey: 'vendor',
                title: 'Vendor Two',
                value: "224j4543kk65mm342435"),
            DataTableFilter(
                filterKey: 'vendor',
                title: 'Vendor Three',
                value: "444543kk65mm342435"),
          ],
          onFilterChange: (String filterKey, String value) {
            //Fetch updated data here
            debugPrint(filterKey.toString());
            debugPrint(value.toString());
          },
          generateRow: (int index, dynamic rowData) {
            return DataRow.byIndex(
              index: index,
              cells: <DataCell>[
                DataCell(Text((index + 1).toString())),
                DataCell(
                    Text(rowData.name != null ? rowData.name.toString() : '')),
                DataCell(Text(rowData.id != null ? rowData.id.toString() : '')),
                DataCell(
                  Text(rowData.location != null
                      ? rowData.location.toString()
                      : ''),
                ),
              ],
              // on row cliked
              onSelectChanged: (bool? value) {
                showModalBottomSheet(
                  enableDrag: true,
                  isScrollControlled: true,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.85,
                      child: FormDemoContent(),
                    );
                  },
                );
              },
            );
          },
        )
      ],
    );
  }
}

class DataTableDemoModel {
  final String id;
  final String name;
  final String location;

  DataTableDemoModel(this.id, this.name, this.location);
}
