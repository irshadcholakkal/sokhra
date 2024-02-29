import 'package:flutter/material.dart';

import '../../../../../base_module/presentation/component/padding/app_padding.dart';

class OutlinedButtonsDemo extends StatelessWidget {
  const OutlinedButtonsDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppPadding(),
        Text(
          "Outlined Buttons",
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const AppPadding(dividedBy: 2),
        Wrap(
          children: [
            OutlinedButton(
              onPressed: () {},
              child: Text('Button'.toUpperCase()),
            ),
            const AppPadding(dividedBy: 2),
            OutlinedButton.icon(
              onPressed: () {},
              label: Text('With Icon'.toUpperCase()),
              icon: const Icon(Icons.check_circle_outline),
            ),
            const AppPadding(dividedBy: 2),
            OutlinedButton(
              onPressed: null,
              child: Text('Disabled'.toUpperCase()),
            ),
          ],
        )
      ],
    );
  }
}
