import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../domain/entity/translation.dart';
import '../../core/values/app_constants.dart';
import '../padding/app_padding.dart';

class NoItemsFoundIndicator extends StatelessWidget {
  const NoItemsFoundIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Icon(
            MdiIcons.animationOutline,
            size: AppConstants.defaultPadding * 1.5,
            color: Theme.of(context).colorScheme.primary.withOpacity(
                  0.25,
                ),
          ),
          const AppPadding(dividedBy: 4),
          Text(
            translation.of("no_item"),
            style: TextStyle(
                color:
                    Theme.of(context).colorScheme.secondary.withOpacity(0.5)),
          ),
        ],
      ),
    );
  }
}
