import 'package:flutter/material.dart';

import '../../../../../base_module/presentation/component/bread_crumb/bread_crumb.dart';
import '../../../../../base_module/presentation/component/padding/app_padding.dart';

class BreadcrumbDemo extends StatelessWidget {
  const BreadcrumbDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        AppPadding(multipliedBy: 2),
        Text('Breadcrumb'),
        AppPadding(dividedBy: 2),
        AppBreadCrumb(
          breadCrumbItemList: [
            Icon(Icons.home),
            Text("Orders"),
            Text("Create Order"),
          ],
        ),
      ],
    );
  }
}
