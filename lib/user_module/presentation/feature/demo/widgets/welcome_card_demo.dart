import 'package:flutter/material.dart';

import '../../../../../base_module/presentation/component/cards/welcome_card.dart';
import '../../../../../base_module/presentation/component/padding/app_padding.dart';

class WelcomeCardDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppPadding(),
        Text(
          "WelcomeCard",
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const AppPadding(dividedBy: 2),
        const WelcomeCard(
          message: "Welcome,",
          name: "John Deo",
        )
      ],
    );
  }
}
