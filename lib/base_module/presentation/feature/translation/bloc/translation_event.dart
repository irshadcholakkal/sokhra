part of 'translation_bloc.dart';

abstract class TranslationEvent extends Equatable {
  const TranslationEvent();

  @override
  List<Object> get props => [];
}

class ChangeLanguage extends TranslationEvent {
  final String language;
  final bool save;

  const ChangeLanguage({
    required this.language,
    this.save = false,
  });

  @override
  List<Object> get props => [language];
}
