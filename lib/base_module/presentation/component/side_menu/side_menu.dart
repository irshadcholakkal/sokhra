import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../user_module/presentation/components/header_section_with_pattern_and_logo.dart';
import '../../../domain/entity/translation.dart';
import '../../core/values/app_constants.dart';
import '../padding/app_padding.dart';
import 'side_menu_item.dart';

class SideMenu extends StatelessWidget {
  final List<SideMenuItem> sideMenuItems;

  const SideMenu({
    Key? key,
    required this.sideMenuItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(context),
              const AppPadding(),
              ...sideMenuItems
            ],
          ),
        ),
      ),
    );
  }

  Stack _buildHeader(BuildContext context) {
    Alignment _alignment = Alignment.topRight;
    IconData _icon = MdiIcons.arrowRight;
    if (translation.isArabic) {
      _alignment = Alignment.topLeft;
      _icon = MdiIcons.arrowLeft;
    }

    return Stack(
      alignment: _alignment,
      children: [
        const HeaderSectionWithPatternAndLogo(height: 300),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppConstants.defaultPadding / 1.4,
            horizontal: AppConstants.defaultPadding / 8,
          ),
          child: IconButton(
            icon: Icon(
              _icon,
              color: Theme.of(context).colorScheme.onPrimary,
              size: 32,
            ),
            onPressed: () {
              Navigator.maybePop(context);
            },
          ),
        )
      ],
    );
  }
}
