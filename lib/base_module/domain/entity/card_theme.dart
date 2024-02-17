import 'package:flutter/material.dart';

import '../../presentation/core/values/app_constants.dart';
import 'color_scheme.dart';

class AppCardTheme {
  static CardTheme cardThemeDark() {
    return CardTheme(
      color: AppColorScheme.surfaceColorDark,
      elevation: AppConstants.elevation,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppConstants.cornerRadius),
        ),
      ),
    );
  }

  static CardTheme cardThemeLight() {
    return cardThemeDark().copyWith(color: AppColorScheme.surfaceColorLight);
  }
}
