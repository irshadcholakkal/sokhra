import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base_module/domain/entity/color_scheme.dart';
import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/component/appbar/simple_app_bar.dart';
import '../../../../../base_module/presentation/feature/translation/bloc/translation_bloc.dart';

class LanguageSelection extends StatefulWidget {
  const LanguageSelection({Key? key}) : super(key: key);

  @override
  State<LanguageSelection> createState() => _LanguageSelectionState();
}

class _LanguageSelectionState extends State<LanguageSelection> {
  @override
  void initState() {
    super.initState();
    
    translation.init().then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorScheme.surfaceColorLight,
      appBar: SimpleAppBar(
        title: translation.of('language.my_account'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _languageTile(context, "French", "fr"),
            _languageTile(context, "English", "en"),
            _languageTile(context, "Arabic", "ar"),
          ],
        ),
      ),
    );
  }

  Widget _languageTile(BuildContext context, String language, String code) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xFFF7F2FA),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text(
            language,
            style: TextStyle(
              color: Color(0xFF1D1B1E),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: Radio(
            value: code,
            groupValue: translation.selectedLocale?.languageCode,
            onChanged: (String? newValue) {
              setState(() {
                translation.setLanguage(language: newValue, save: true)
                    .then((_) {
                  setState(() {});
                });
              });
            },
          ),
          onTap: () {
            setState(() {
              translation.setLanguage(language: code, save: true).then((_) {
                setState(() {});
              });
            });
          },
        ),
      ),
    );
  }
}
