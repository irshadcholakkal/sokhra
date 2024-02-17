import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../base_module/presentation/core/values/app_assets.dart';
import '../../../base_module/presentation/core/values/app_constants.dart';

class HeaderSectionWithPatternAndLogo extends StatelessWidget {
  const HeaderSectionWithPatternAndLogo({
    Key? key,
    required double height,
  })  : _height = height,
        super(key: key);

  final double _height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          color: Theme.of(context).colorScheme.primary,
          width: double.infinity,
          height: _height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // SvgPicture.asset(
              //   ThemeAssets.appPattern,
              //   color: AppColorScheme.onPrimaryLight,
              //   width: double.infinity,
              //   fit: BoxFit.cover,
              // ),
              SvgPicture.asset(
                ThemeAssets.appIconPrimary,
                height: _height / 3,
              ),
            ],
          ),
        ),
        Container(
          height: AppConstants.defaultPadding,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppConstants.defaultPadding),
              topRight: Radius.circular(AppConstants.defaultPadding),
            ),
          ),
        )
      ],
    );
  }
}
