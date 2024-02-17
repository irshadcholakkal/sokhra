import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/app_theme_singleton.dart';
import '../../feature/theming/bloc/theme_bloc.dart';

class ThemeSwitcherButton extends StatefulWidget {
  @override
  _ThemeSwitcherButtonState createState() => _ThemeSwitcherButtonState();
}

class _ThemeSwitcherButtonState extends State<ThemeSwitcherButton> {
  late ThemeBloc _themeBloc;

  @override
  void initState() {
    super.initState();

    _themeBloc = BlocProvider.of<ThemeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return IconButton(
          color: Theme.of(context).colorScheme.onSurface,
          icon: appTheme.isDark
              ? const Icon(Icons.wb_sunny)
              : const Icon(Icons.brightness_2),
          onPressed: () {
            if (appTheme.isDark) {
              _themeBloc.add(const ChangeTheme(
                themeType: ThemeType.light,
              ));
            } else {
              _themeBloc.add(const ChangeTheme(
                themeType: ThemeType.dark,
              ));
            }
          },
        );
      },
    );
  }
}
