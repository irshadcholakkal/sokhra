import 'package:flutter/material.dart';

import '../../../component/app_icons/app_icon_large.dart';
import '../../../component/app_icons/app_icon_small.dart';
import '../../../component/padding/app_padding.dart';

class AppIconsDemo extends StatelessWidget {
  const AppIconsDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        AppPadding(multipliedBy: 2),
        Text('AppIconLarge'),
        AppPadding(dividedBy: 2),
        AppIconLarge(),
        AppPadding(dividedBy: 2),
        Text('AppIconSmall'),
        AppPadding(dividedBy: 2),
        AppIconSmall(),
      ],
    );
  }
}
