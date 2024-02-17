import 'package:flutter/material.dart';

import '../../presentation/feature/theming/bloc/theme_bloc.dart';
import 'appbar_theme.dart';
import 'bottomnavbar_theme.dart';
import 'button_theme_data.dart';
import 'card_theme.dart';
import 'chip_theme.dart';
import 'color_scheme.dart';
import 'dialog_theme.dart';
import 'input_decoration_theme.dart';

mixin AppThemes {
  static appThemeData(BuildContext context) => {
    ThemeState.light: ThemeData(
      // font
      fontFamily: 'GeneralSans',
      //colors
      primaryColor: AppColorScheme.primaryColorLight,
      scaffoldBackgroundColor: AppColorScheme.scaffoldBackgroundColorLight,
      shadowColor: AppColorScheme.primaryColorLight.withOpacity(0.2),
      canvasColor: AppColorScheme.backgroundColorLight,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColorScheme.primaryColorLight,
        secondary: AppColorScheme.secondaryColorLight,
        error: AppColorScheme.errorColorLight,
        background: AppColorScheme.backgroundColorLight,
        surface: AppColorScheme.surfaceColorLight,
        onBackground: AppColorScheme.onBackgroundLight,
        onError: AppColorScheme.onErrorLight,
        onPrimary: AppColorScheme.onPrimaryLight,
        onSecondary: AppColorScheme.onSecondaryLight,
        onSurface: AppColorScheme.onSurfaceLight,
        inverseSurface: AppColorScheme.inverseSurfaceLight,
        tertiary: AppColorScheme.tertiaryLight,
        onTertiary: AppColorScheme.onTertiaryDark,
        onTertiaryContainer: AppColorScheme.onTertiaryContainerLite,
      ),
      textTheme: Theme.of(context).textTheme.apply(
        bodyColor: AppColorScheme.onBackgroundLight,
        displayColor: AppColorScheme.onBackgroundLight,
      ),
      backgroundColor: AppColorScheme.backgroundColorLight,
      // A color that contrasts with the primaryColor, e.g. used as the remaining part of a progress bar.

      //buttons
      elevatedButtonTheme: AppButtonThemeData.elevatedButtonThemeData(),
      outlinedButtonTheme: AppButtonThemeData.outlinedButtonThemeData(),
      textButtonTheme: AppButtonThemeData.textButtonThemeData(),

      //chip
      chipTheme: AppChipThemeData.chipThemeData(),

      //textfield
      inputDecorationTheme: AppInputDecorationTheme.inputDecorationThemeLight(),

      //card
      cardTheme: AppCardTheme.cardThemeLight(),

      //dialog
      dialogTheme: AppDialogTheme.dialogThemeLight(),

      //appbar and bottom navbar theme
      appBarTheme: VendorAppBarTheme.appbarThemeLight(),
      bottomNavigationBarTheme: BottomNavBarTheme.bottomNavBarThemeLight(),
      //listtile theme
      listTileTheme: ListTileThemeData(),
    ),
    ThemeState.dark: ThemeData(
      // font
      fontFamily: 'GeneralSans',
      primaryColor: AppColorScheme.primaryColorDark,
      scaffoldBackgroundColor: AppColorScheme.scaffoldBackgroundColorDark,
      shadowColor: AppColorScheme.onBlack.withOpacity(0.5),
      canvasColor: AppColorScheme.backgroundColorDark,
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: AppColorScheme.primaryColorDark,
        secondary: AppColorScheme.secondaryColorDark,
        error: AppColorScheme.errorColorDark,
        background: AppColorScheme.backgroundColorDark,
        surface: AppColorScheme.surfaceColorDark,
        onBackground: AppColorScheme.onBackgroundDark,
        onError: AppColorScheme.onErrorDark,
        onPrimary: AppColorScheme.onPrimaryDark,
        onSecondary: AppColorScheme.onSecondaryDark,
        onSurface: AppColorScheme.onSurfaceDark,
        inverseSurface: AppColorScheme.inverseSurfaceDark,
        tertiary: AppColorScheme.tertiaryDark,
        onTertiary: AppColorScheme.onTertiaryDark,
        onTertiaryContainer: AppColorScheme.onTertiaryContainerDark,
      ),
      textTheme: Theme.of(context).textTheme.apply(
        bodyColor: AppColorScheme.onBackgroundDark,
        displayColor: AppColorScheme.onBackgroundDark,
      ),
      backgroundColor: AppColorScheme.backgroundColorDark,
      // A color that contrasts with the primaryColor, e.g. used as the remaining part of a progress bar.

      //buttons
      elevatedButtonTheme: AppButtonThemeData.elevatedButtonThemeData(),
      outlinedButtonTheme: AppButtonThemeData.outlinedButtonThemeData(),
      textButtonTheme: AppButtonThemeData.textButtonThemeData(),
      //chip
      chipTheme: AppChipThemeData.chipThemeData(),
      //textfield
      inputDecorationTheme: AppInputDecorationTheme.inputDecorationThemeDark(),

      //card
      cardTheme: AppCardTheme.cardThemeDark(),

      //dialog
      dialogTheme: AppDialogTheme.dialogThemeDark(),

      //appbar and bottom navbar theme
      appBarTheme: VendorAppBarTheme.appbarThemeDark(),
      bottomNavigationBarTheme: BottomNavBarTheme.bottomNavBarThemeDark(),
    )
  };
}
