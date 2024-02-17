import 'package:flutter/material.dart';

import '../../presentation/core/values/app_constants.dart';
import 'color_scheme.dart';

class VendorAppBarTheme {
  static AppBarTheme appbarThemeDark() {
    return AppBarTheme(
      backgroundColor: AppColorScheme.scaffoldBackgroundColorDark,
      iconTheme: IconThemeData(color: AppColorScheme.secondaryColorDark),
      elevation: AppConstants.elevation,
    );
  }

  static AppBarTheme appbarThemeLight() {
    return appbarThemeDark().copyWith(
      backgroundColor: AppColorScheme.scaffoldBackgroundColorLight,
      iconTheme: IconThemeData(color: AppColorScheme.secondaryColorLight),
    );
  }
}
