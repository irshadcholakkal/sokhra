import 'package:flutter/material.dart';

import '../../../../../base_module/presentation/component/buttons/add_to_cart_button.dart';
import '../../../../../base_module/presentation/component/padding/app_padding.dart';

class ElevatedButtonsDemo extends StatelessWidget {
  const ElevatedButtonsDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppPadding(),
        Text(
          "Elevated Buttons",
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const AppPadding(dividedBy: 2),
        Wrap(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('Button'.toUpperCase()),
            ),
            const AppPadding(dividedBy: 2),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.check_circle_outline),
              label: Text('With Icon'.toUpperCase()),
            ),
            const AppPadding(dividedBy: 2),
            ElevatedButton(
              onPressed: null,
              child: Text('Disabled'.toUpperCase()),
            ),
            const AppPadding(dividedBy: 2),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AddToCartButton(
                id: '',
                onPressed: () {},
              ),
            ),
            const AppPadding(dividedBy: 2),
          ],
        )
      ],
    );
  }
}
