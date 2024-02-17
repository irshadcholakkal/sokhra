import 'package:flutter/material.dart';

import '../../core/values/app_constants.dart';
import '../slivers/sliver_sized_box.dart';
import 'loading_indicator.dart';

class SliverLoadingIndicator extends StatelessWidget {
  const SliverLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverSizedBox(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: AppConstants.defaultPadding,
        ),
        child: const LoadingIndicator(),
      ),
    );
  }
}
