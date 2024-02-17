import 'package:flutter/material.dart';

import '../../../component/padding/app_padding.dart';
import '../../../core/values/app_constants.dart';

class ColorSwatchesDemo extends StatelessWidget {
  const ColorSwatchesDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppPadding(),
        //Colors
        TextButton(
          onPressed: () {
            // Navigator.pushNamed(
            //   context,
            //   UserRouter.signInScreen,
            // );
          },
          child: Text(
            "Colors",
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        const AppPadding(dividedBy: 2),
        Wrap(
          runSpacing: AppConstants.defaultPadding,
          spacing: AppConstants.defaultPadding,
          children: [
            ColorTile(
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).colorScheme.onPrimary,
              title: "Primary",
            ),
            ColorTile(
              color: Theme.of(context).colorScheme.secondary,
              textColor: Theme.of(context).colorScheme.onSecondary,
              title: "Secondary",
            ),
            ColorTile(
              color: Theme.of(context).colorScheme.secondary,
              textColor: Theme.of(context).colorScheme.onPrimary,
              title: "Accent",
            ),
            ColorTile(
              color: Theme.of(context).colorScheme.error,
              textColor: Theme.of(context).colorScheme.onError,
              title: "Error",
            ),
            ColorTile(
              color: Theme.of(context).scaffoldBackgroundColor,
              textColor: Theme.of(context).colorScheme.onBackground,
              title: "Scaffold Bg",
            ),
            ColorTile(
              color: Theme.of(context).colorScheme.background,
              textColor: Theme.of(context).colorScheme.onBackground,
              title: "Background",
            ),
            ColorTile(
              color: Theme.of(context).colorScheme.surface,
              textColor: Theme.of(context).colorScheme.onSurface,
              title: "Surface",
            ),
          ],
        ),
      ],
    );
  }
}

class ColorTile extends StatelessWidget {
  const ColorTile({
    Key? key,
    required Color color,
    required this.title,
    this.textColor,
  })  : _color = color,
        super(key: key);

  final Color _color;
  final Color? textColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.defaultPadding * 3,
      width: AppConstants.defaultPadding * 4,
      padding: const EdgeInsets.all(AppConstants.defaultPadding / 4),
      decoration: BoxDecoration(
        color: _color,
        borderRadius: BorderRadius.circular(
          AppConstants.cornerRadius,
        ),
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style:
              Theme.of(context).textTheme.subtitle2!.copyWith(color: textColor),
        ),
      ),
    );
  }
}
