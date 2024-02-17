import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../presentation/feature/theming/bloc/theme_bloc.dart';
import 'app_theme_config.dart';

class AppTheme {
  static final _singleton = AppTheme._internal();

  factory AppTheme() {
    return _singleton;
  }

  AppTheme._internal();

  final _keyThemeType = "keyThemeType";
  ThemeType _themeType = ThemeType.light;
  ThemeState _themeState = ThemeState.light;
  bool _isDark = false;

  ThemeType get themeType => _themeType;

  ThemeState get themeState => _themeState;

  bool get isDark => _isDark;

  Future<void> init() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    _initThemeType(sharedPreferences.getString(_keyThemeType)?.trim() ?? "");
  }

  void _initThemeType(String? value) {
    _themeType = ThemeType.values.firstWhereOrNull(
            (item) => item.toString().toLowerCase() == value?.toLowerCase()) ??
        ThemeType.light;

    _setThemeState();
  }

  void _setThemeState() {
    // Note: this app has only light mode for now
    _themeState = ThemeState.light;

    // switch (_themeType) {
    //   case ThemeType.dark:
    //     _themeState = ThemeState.dark;

    //     break;
    //   case ThemeType.light:
    //     _themeState = ThemeState.light;
    //     break;
    //   case ThemeType.system:
    //     _themeState = SchedulerBinding.instance.window.platformBrightness ==
    //             Brightness.dark
    //         ? ThemeState.dark
    //         : ThemeState.light;
    //     break;
    // }

    _isDark = _themeState == ThemeState.dark;
  }

  Future<void> setThemeType({
    required ThemeType themeType,
  }) async {
    try {
      _themeType = themeType;
      _setThemeState();

      // if (_themeType != null) {
        (await SharedPreferences.getInstance())
            .setString(_keyThemeType, _themeType.toString());
      // }
    } catch (e) {
      debugPrint("App:setThemeType:Exception:$e");
    }
  }

  ThemeData themeData(BuildContext context) {
    switch (appTheme.themeState) {
      case ThemeState.dark:
        return AppThemes.appThemeData(context)[ThemeState.dark]!;
      case ThemeState.light:
        return AppThemes.appThemeData(context)[ThemeState.light]!;
      default:
        return AppThemes.appThemeData(context)[ThemeState.light]!;
    }
  }
}

enum ThemeType { dark, light, system }

final appTheme = AppTheme();
