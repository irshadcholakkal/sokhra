import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../core/values/app_constants.dart';
import '../padding/app_padding.dart';

class WelcomeCard extends StatelessWidget {
  final String? message;
  final String? name;
  final Icon? icon;

  const WelcomeCard({
    Key? key,
    this.message,
    this.name,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Row(
          children: [
            icon ??
                const Icon(
                  MdiIcons.emoticonCoolOutline,
                  size: 44,
                  color: Colors.amber,
                ),
            const AppPadding(),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    message ?? "Hi",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  const AppPadding(dividedBy: 2),
                  if (name != null)
                    Text(
                      name!,
                      style: Theme.of(context).textTheme.headline6,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
