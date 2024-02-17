import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entity/translation.dart';
import '../bloc/translation_bloc.dart';

class LanguageSwitcherButton extends StatefulWidget {
  @override
  _LanguageSwitcherButtonState createState() => _LanguageSwitcherButtonState();
}

class _LanguageSwitcherButtonState extends State<LanguageSwitcherButton> {
  late TranslationBloc _translationBloc;

  @override
  void initState() {
    super.initState();

    _translationBloc = BlocProvider.of<TranslationBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationBloc, TranslationState>(
      builder: (context, state) {
        return TextButton(
          onPressed: () {
            if (translation.isArabic) {
              _translationBloc.add(const ChangeLanguage(
                language: "en",
                save: true,
              ));
            } else {
              _translationBloc.add(const ChangeLanguage(
                language: "ar",
                save: true,
              ));
            }
          },
          child: Text(
            translation.isArabic ? "En" : "ع",
            style: (translation.isArabic
                    ? Theme.of(context).textTheme.bodyText1
                    : Theme.of(context).textTheme.headline6)!
                .copyWith(color: Theme.of(context).colorScheme.primary),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
