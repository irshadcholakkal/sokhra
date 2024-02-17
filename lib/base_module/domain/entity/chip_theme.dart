import 'package:flutter/material.dart';

import '../../presentation/core/values/app_constants.dart';
import 'color_scheme.dart';

class AppChipThemeData {
  static ChipThemeData chipThemeData() {
    return ChipThemeData(
      backgroundColor: AppColorScheme.surfaceColorLight,
      disabledColor: AppColorScheme.surfaceColorLight,
      selectedColor: AppColorScheme.primaryColorLight,
      secondarySelectedColor: AppColorScheme.primaryColorLight,
      padding: EdgeInsets.symmetric(
          vertical: AppConstants.defaultPadding * 0.08,
          horizontal: AppConstants.defaultPadding * 0.5),
      labelStyle: TextStyle(),
      secondaryLabelStyle: TextStyle(),
      showCheckmark: false,
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: AppColorScheme.primaryColorLight),
          borderRadius:
              BorderRadius.circular(AppConstants.cornerRadius * 0.90)),
      brightness: Brightness.light,
    );
  }
}
