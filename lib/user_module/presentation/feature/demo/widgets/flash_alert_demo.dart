import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

import '../../../../../base_module/presentation/component/alerts/flash_alert.dart';
import '../../../../../base_module/presentation/component/padding/app_padding.dart';

class FlashAlertDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppPadding(),
        Text(
          "Flash Alert",
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const AppPadding(dividedBy: 2),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                showFlash(
                  context: context,
                  duration: const Duration(seconds: 2),
                  builder: (_, controller) {
                    return FlashAlert(
                      flashController: controller,
                      iconData: Icons.check,
                      message: "Info Alert",
                    );
                  },
                );
              },
              child: const Text('Info Alert'),
            ),
            const AppPadding(dividedBy: 2),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
              onPressed: () {
                showFlash(
                  context: context,
                  duration: const Duration(seconds: 2),
                  builder: (_, controller) {
                    return FlashAlert(
                      flashController: controller,
                      color: Theme.of(context).colorScheme.error,
                      iconData: Icons.error,
                      message: "Error Alert",
                    );
                  },
                );
              },
              child: const Text('Error Alert'),
            )
          ],
        )
      ],
    );
  }
}
