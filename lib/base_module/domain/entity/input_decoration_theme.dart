// import 'package:flutter/material.dart';

// import '../../presentation/core/values/app_constants.dart';
// import 'color_scheme.dart';

// class AppInputDecorationTheme {
//   static InputDecorationTheme inputDecorationThemeDark() {
//     return InputDecorationTheme(
//       border: const OutlineInputBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(AppConstants.cornerRadius * 4),
//         ),
//       ),
//       fillColor: AppColorScheme.secondaryVariantColorDark,
//       filled: true,
//       labelStyle: const TextStyle(
//         color: AppColorScheme.onPrimaryLight60,
//       ),
//       contentPadding: const EdgeInsets.symmetric(
//         horizontal: AppConstants.defaultPadding / 3,
//         vertical: AppConstants.defaultPadding / 2,
//       ),

//       //borders
//       enabledBorder: const OutlineInputBorder(
//         borderSide: BorderSide(
//           color: Colors.transparent,
//         ),
//         borderRadius: BorderRadius.all(
//           Radius.circular(AppConstants.cornerRadius * 4),
//         ),
//       ),
//       disabledBorder: const OutlineInputBorder(
//         borderSide: BorderSide(
//           color: Colors.transparent,
//         ),
//         borderRadius: BorderRadius.all(
//           Radius.circular(AppConstants.cornerRadius * 4),
//         ),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: Colors.grey.shade400.withOpacity(0.6),
//         ),
//         borderRadius: const BorderRadius.all(
//           Radius.circular(AppConstants.cornerRadius * 4),
//         ),
//       ),
//       errorBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: AppColorScheme.errorColorDark,
//         ),
//         borderRadius: const BorderRadius.all(
//           Radius.circular(AppConstants.cornerRadius * 4),
//         ),
//       ),
//       focusedErrorBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: AppColorScheme.errorColorDark,
//         ),
//         borderRadius: const BorderRadius.all(
//           Radius.circular(AppConstants.cornerRadius * 4),
//         ),
//       ),
//     );
//   }

//   static InputDecorationTheme inputDecorationThemeLight() {
//     final inputDecoration = inputDecorationThemeDark();
//     return inputDecoration.copyWith(
//       fillColor: AppColorScheme.secondaryVariantColorDark,
//       labelStyle: const TextStyle(
//         color: AppColorScheme.onBlack54,
//       ),
//       errorBorder: inputDecoration.enabledBorder!.copyWith(
//         borderSide: BorderSide(
//           color: AppColorScheme.errorColorLight,
//         ),
//       ),
//       focusedErrorBorder: inputDecoration.focusedErrorBorder!.copyWith(
//         borderSide: BorderSide(
//           color: AppColorScheme.errorColorLight,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../../presentation/core/values/app_constants.dart';
import 'color_scheme.dart';

class AppInputDecorationTheme {
  static InputDecorationTheme inputDecorationThemeDark() {
    return InputDecorationTheme(
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppConstants.cornerRadius * 4),
        ),
      ),
      fillColor: AppColorScheme.secondaryVariantColorDark,
      filled: true,
      labelStyle: const TextStyle(
        color: Colors.white60,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding / 2,
        vertical: AppConstants.defaultPadding / 2,
      ),

      //borders
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppConstants.cornerRadius * 4),
        ),
      ),
      disabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppConstants.cornerRadius * 4),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade400.withOpacity(0.6),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppConstants.cornerRadius * 4),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColorScheme.errorColorDark,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppConstants.cornerRadius * 4),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColorScheme.errorColorDark,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppConstants.cornerRadius * 4),
        ),
      ),
    );
  } //todo configure dark theme

  static InputDecorationTheme inputDecorationThemeLight() {
    InputBorder _border = OutlineInputBorder(
      borderSide: BorderSide(color: AppColorScheme.onPrimaryLight),
      borderRadius: BorderRadius.circular(AppConstants.cornerRadius),
    );
    final inputDecoration = inputDecorationThemeDark();
    return inputDecoration.copyWith(
        fillColor: AppColorScheme.onPrimaryLight,
        labelStyle: const TextStyle(
          color: Colors.black54,
        ),
        hintStyle: TextStyle(
          color: AppColorScheme.primaryColorLight.withOpacity(0.6),
        ),
        errorBorder: _border,
        focusedErrorBorder: _border,
        enabledBorder: _border,
        disabledBorder: _border,
        focusedBorder: _border);
  }
}
