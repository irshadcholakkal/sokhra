import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Translation {
  static final _instance = Translation.internal();

  factory Translation() {
    return _instance;
  }

  Translation.internal();

  final _languageAssets = [
    'base_module',
    // 'customer_module',
    'user_module',
    // 'vendor_module',
   // 'check_out_module'
    'catalogue_module',
    'cart_wishlist_module',
    'orders_module',
    'payment_module'
  ];

  final _keyLanguage = "keyLanguage";
  final _supportedLocales = [
    const Locale("en", ""),
    const Locale("ar", ""),
    const Locale("fr", ""),
  ];
  final _rtlLanguages = ["ar"];
  Locale? _selectedLocale;
  Map<String, dynamic> localizedValues = {};
  bool _isRtl = false;
  bool _isArabic = false;
  bool _isFrench =false;

  Locale? get selectedLocale => _selectedLocale;

  Iterable<Locale> get supportedLocales => _supportedLocales;

  bool get isRtl => _isRtl;

  bool get isArabic => _isArabic;

  bool get isFrench => _isFrench;

  String of(String key) {
    try {
      final value =
          key.split('.').fold(localizedValues, (dynamic obj, key) => obj[key]);
      return (value as String).trim();
    } catch (e) {
      return '** $key ** not found';
    }
  }

  Future<void> init() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await setLanguage(language: sharedPreferences.getString(_keyLanguage));
  }

  Future<void> setLanguage({
    required String? language,
    bool save = false,
  }) async {
    final _language = language?.split("_").first;

    if (_language != null &&
        _supportedLocales.contains(Locale(_language, ""))) {
      _selectedLocale = Locale(_language, "");
    } else {
      _selectedLocale = _supportedLocales.first;
    }

    for (final item in _languageAssets) {
      try {
        final jsonContent = await rootBundle.loadString(
            'lib/$item/presentation/core/assets/lang/${_selectedLocale!.languageCode}.json');
        localizedValues.addAll({...jsonDecode(jsonContent)});
      } catch (e) {
        debugPrint("Translation:setLanguage:Exception:$e");
      }
    }

    _isRtl = _rtlLanguages.contains(_selectedLocale?.languageCode);
    _isArabic = _selectedLocale?.languageCode == "ar";
    _isFrench = _selectedLocale?.languageCode== "fr";

    if (save) {
      await _saveLanguage(_language!);
    }
  }

  Future<void> _saveLanguage(String language) async =>
      await SharedPreferences.getInstance()
        ..setString(_keyLanguage, language);
}

final translation = Translation();
