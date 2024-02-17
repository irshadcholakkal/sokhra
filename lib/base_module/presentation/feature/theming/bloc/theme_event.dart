part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ChangeTheme extends ThemeEvent {
  final ThemeType themeType;

  const ChangeTheme({
    required this.themeType,
  });

  @override
  List<Object> get props => [themeType];
}
