import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../domain/entity/app_theme_singleton.dart';
import '../../core/values/app_assets.dart';

class AppIconSmall extends StatelessWidget {
  final double height;
  final double width;

  const AppIconSmall({Key? key, this.height = 52.0, this.width = 156.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      child: SvgPicture.asset(
        appTheme.isDark ? ThemeAssets.appIconPrimary : ThemeAssets.appIconPrimary,
        height: height,
        width: width,
        fit: BoxFit.cover,
        // color: Palette.forgroundColorOg,
      ),
    );
  }
}
