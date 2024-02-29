import 'package:flutter/material.dart';

import '../../../../../base_module/presentation/component/padding/app_padding.dart';

class TextButtonsDemo extends StatelessWidget {
  const TextButtonsDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppPadding(),
        Text(
          "Text Buttons",
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Wrap(
          children: [
            TextButton(
              onPressed: () {},
              child: const Text('Button'),
            ),
            TextButton.icon(
              onPressed: () {},
              label: const Text('Button'),
              icon: const Icon(Icons.refresh),
            ),
          ],
        )
      ],
    );
  }
}
