import 'package:flutter/material.dart';

import '../../../../../base_module/presentation/component/buttons/app_toggle_button.dart';
import '../../../../../base_module/presentation/component/padding/app_padding.dart';

class ToggleButtonsDemo extends StatefulWidget {
  const ToggleButtonsDemo({
    Key? key,
  }) : super(key: key);

  @override
  _ToggleButtonsDemoState createState() => _ToggleButtonsDemoState();
}

bool value = false;

class _ToggleButtonsDemoState extends State<ToggleButtonsDemo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppPadding(),
        Text(
          "Custom Toggle Buttons*",
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Wrap(
          children: [
            AppToggleButton(
              value: value,
              onChange: () {
                debugPrint("Toggled");
                setState(() {
                  value = !value;
                });
              },
            ),
            AppToggleButton(
              value: !value,
            ),
          ],
        )
      ],
    );
  }
}
