import 'package:flutter/material.dart';

import '../../core/values/app_constants.dart';
import '../slivers/sliver_sized_box.dart';
import 'load_button.dart';

class SliverLoadFailedButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const SliverLoadFailedButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverSizedBox(
      child: Container(
        margin: const EdgeInsets.only(
          top: AppConstants.defaultPadding,
        ),
        child: LoadButton(
          onPressed: onPressed,
        ),
      ),
    );
  }
}
