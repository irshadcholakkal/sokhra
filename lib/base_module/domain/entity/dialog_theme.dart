import 'package:flutter/material.dart';

import '../../presentation/core/values/app_constants.dart';
import 'color_scheme.dart';

class AppDialogTheme {
  static DialogTheme dialogThemeDark() {
    return DialogTheme(
      backgroundColor: AppColorScheme.surfaceColorDark,
      elevation: AppConstants.elevation,
      contentTextStyle: TextStyle(
        color: AppColorScheme.onSurfaceDark.withOpacity(0.6),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppConstants.cornerRadius),
        ),
      ),
    );
  }

  static DialogTheme dialogThemeLight() {
    return dialogThemeDark().copyWith(
      backgroundColor: AppColorScheme.surfaceColorLight,
      contentTextStyle: TextStyle(
        color: AppColorScheme.onSurfaceLight.withOpacity(0.6),
      ),
    );
  }
}
