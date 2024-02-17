import 'package:flutter/material.dart';

import '../../../domain/entity/app_theme_singleton.dart';
import '../../core/values/app_assets.dart';

class AppIconLarge extends StatelessWidget {
  final double height;
  final double width;

  const AppIconLarge({Key? key, this.height = 52.0, this.width = 156.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      child: Image.asset(
        appTheme.isDark ? ThemeAssets.appIconPrimary : ThemeAssets.appIconPrimary,
        height: height,
        width: width,
        fit: BoxFit.fitWidth,
        // color: Palette.forgroundColorOg,
      ),
    );
  }
}
