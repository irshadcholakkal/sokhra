import 'package:flutter/material.dart';

import '../../core/values/app_constants.dart';
import '../padding/app_padding.dart';

class SideMenuItem extends StatelessWidget {
  const SideMenuItem({
    Key? key,
    required IconData icon,
    required String title,
    this.onPressed,
  })  : _icon = icon,
        _title = title,
        super(key: key);

  final IconData _icon;
  final String _title;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed!();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: AppConstants.defaultPadding * 1.6,
            vertical: AppConstants.defaultPadding / 3),
        padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.defaultPadding / 2,
            vertical: AppConstants.defaultPadding / 2),
        decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
            ),
            borderRadius: const BorderRadius.all(
                Radius.circular(AppConstants.defaultPadding))),
        child: Row(
          children: [
            Icon(
              _icon,
              color: Theme.of(context).colorScheme.secondary,
            ),
            const AppPadding(dividedBy: 2),
            Text(
              _title,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
