import 'package:flutter/material.dart';

import '../../../component/alerts/app_alert_dialog.dart';
import '../../../component/padding/app_padding.dart';

class AlertDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppPadding(),
        Text(
          "Modal",
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const AppPadding(dividedBy: 2),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AppAlertDialog(
                      title: "New order placed successfully.",
                      icon: Icon(
                        Icons.check_circle_outline,
                        size: 60.0,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      content:
                          'Description about new order placed successfully. Description about new order placed successfully. Description about new order placed successfully.',
                      actions: [
                        OutlinedButton(
                            onPressed: () {}, child: const Text("Cancel")),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text("Okay"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                "Click me".toUpperCase(),
              ),
            )
          ],
        )
      ],
    );
  }
}
