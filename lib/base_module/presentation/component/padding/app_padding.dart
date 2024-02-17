import 'package:flutter/material.dart';

import '../../core/values/app_constants.dart';

class AppPadding extends StatelessWidget {
  final double dividedBy;
  final double multipliedBy;

  const AppPadding({
    Key? key,
    this.dividedBy = 1,
    this.multipliedBy = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConstants.defaultPadding * multipliedBy / dividedBy,
      width: AppConstants.defaultPadding * multipliedBy / dividedBy,
    );
  }
}
