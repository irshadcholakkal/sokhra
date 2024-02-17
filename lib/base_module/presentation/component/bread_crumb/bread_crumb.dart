import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';

class AppBreadCrumb extends StatelessWidget {
  final List<Widget> breadCrumbItemList;

  const AppBreadCrumb({Key? key, required this.breadCrumbItemList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BreadCrumb(
      items: breadCrumbItemList
          .map(
            (breadCrumbItem) => BreadCrumbItem(
              content: breadCrumbItem,
            ),
          )
          .toList(),
      divider: const Icon(Icons.chevron_right),
      overflow: ScrollableOverflow(),
    );
  }
}
