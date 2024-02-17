import 'package:flutter/material.dart';

import '../../core/values/app_constants.dart';
import '../../util/responsive.dart';
import '../padding/app_padding.dart';

class AppAlertDialog extends StatelessWidget {
  final Icon? icon;
  final String? title;
  final String? content;
  final List<Widget>? actions;

  const AppAlertDialog(
      {Key? key, this.icon, this.title, this.content, this.actions})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(
          horizontal: Responsive.isMobile(context)
              ? AppConstants.defaultPadding
              : Responsive.isTablet(context)
                  ? MediaQuery.of(context).size.width / 4
                  : MediaQuery.of(context).size.width / 3),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) icon!,
          if (icon != null) const AppPadding(dividedBy: 4),
          if (title != null)
            Text(
              title!,
              textAlign: TextAlign.center,
            )
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (content != null) Text(content!),
          const AppPadding(),
          if (actions != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: actions!,
            )
        ],
      ),
    );
  }
}
