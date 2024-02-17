import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/values/app_assets.dart';

class CustomTextAppbar extends AppBar {
  final double radius;
  final bool isTitleText;
  final String? titleText;
  final BuildContext context;
  CustomTextAppbar({
    this.titleText,
    this.isTitleText = false,
    required this.context,
    this.radius = 30,
  })  : assert(isTitleText ? titleText != null : titleText == null),
        super(
            elevation: 5,
            backgroundColor: Theme.of(context).colorScheme.surface,
            leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_sharp,
                      color: Theme.of(context).colorScheme.primary,
                    )),
            title: isTitleText
                ? Text(
                    titleText!,
                    style: Theme.of(context).textTheme.headline6,
                  )
                : SvgPicture.asset(ThemeAssets.appIconSecondary),
            centerTitle: isTitleText ? false : true,
           
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(radius),
                    bottomRight: Radius.circular(radius))));
}
