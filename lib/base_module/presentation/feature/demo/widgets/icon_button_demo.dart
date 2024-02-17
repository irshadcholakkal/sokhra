import 'package:flutter/material.dart';

import '../../../component/padding/app_padding.dart';

class IconButtonsDemo extends StatelessWidget {
  const IconButtonsDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppPadding(),
        Text(
          "Icon Buttons",
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Wrap(
          children: [
            IconButton(
                icon: const Icon(Icons.check_circle_outline),
                onPressed: () {},
                iconSize: 40,
                color: Theme.of(context).colorScheme.primary),
            IconButton(
              icon: const Icon(Icons.check_circle_outline),
              onPressed: null,
              iconSize: 40,
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        )
      ],
    );
  }
}
