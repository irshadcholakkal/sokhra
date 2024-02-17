import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entity/translation.dart';

part 'translation_event.dart';

part 'translation_state.dart';

class TranslationBloc extends Bloc<TranslationEvent, TranslationState> {
  TranslationBloc()
      : super(LanguageChanged(
          locale: translation.selectedLocale,
        ));

  @override
  Stream<TranslationState> mapEventToState(TranslationEvent event) async* {
    if (event is ChangeLanguage) {
      await translation.setLanguage(
        language: event.language,
        save: event.save,
      );

      yield LanguageChanged(
        locale: translation.selectedLocale,
      );
    }
  }
}
