part of 'translation_bloc.dart';

abstract class TranslationState extends Equatable {
  const TranslationState();

  @override
  List<Object?> get props => [];
}

class LanguageChanged extends TranslationState {
  final Locale? locale;

  const LanguageChanged({
    required this.locale,
  });

  @override
  List<Object?> get props => [locale];
}
