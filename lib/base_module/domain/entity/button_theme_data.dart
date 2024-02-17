import 'package:flutter/material.dart';

import '../../presentation/core/values/app_constants.dart';
import 'color_scheme.dart';

class AppButtonThemeData {
  static ElevatedButtonThemeData elevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColorScheme.primaryColor),
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
              horizontal: AppConstants.defaultPadding,
              vertical: AppConstants.defaultPadding / 3),
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppConstants.cornerRadius * 0.6),
            ),
          ),
        ),
      ),
    );
  }

  static OutlinedButtonThemeData outlinedButtonThemeData() {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding / 2,
                vertical: AppConstants.defaultPadding / 6),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(AppConstants.cornerRadius * 0.6),
              ),
            ),
          ),
          side: MaterialStateProperty.all(
            BorderSide(color: AppColorScheme.onBlack, width: 1),
          )),
    );
  }

  static TextButtonThemeData textButtonThemeData() {
    return TextButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
              horizontal: AppConstants.defaultPadding / 2,
              vertical: AppConstants.defaultPadding / 4),
        ),
      ),
    );
  }
}
