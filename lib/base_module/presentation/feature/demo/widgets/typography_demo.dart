import 'package:flutter/material.dart';

import '../../../../domain/entity/translation.dart';
import '../../../component/padding/app_padding.dart';

class TypographyDemo extends StatelessWidget {
  const TypographyDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppPadding(multipliedBy: 2),
        //Typography
        Text(
          "Typography",
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const AppPadding(dividedBy: 4),
        Text(
          "H1 ${translation.of('theme.placeholderText')}",
          style: Theme.of(context).textTheme.headline1,
          overflow: TextOverflow.visible,
          maxLines: 1,
        ),
        Text(
          "H2 ${translation.of('theme.placeholderText')}",
          style: Theme.of(context).textTheme.headline2,
          overflow: TextOverflow.visible,
          maxLines: 1,
        ),
        Text(
          "H3 ${translation.of('theme.placeholderText')}",
          style: Theme.of(context).textTheme.headline3,
          overflow: TextOverflow.visible,
          maxLines: 1,
        ),
        Text(
          "H4 ${translation.of('theme.placeholderText')}",
          style: Theme.of(context).textTheme.headline4,
          overflow: TextOverflow.visible,
          maxLines: 1,
        ),
        const AppPadding(dividedBy: 4),
        Text(
          "H5 ${translation.of('theme.placeholderText')}",
          style: Theme.of(context).textTheme.headline5,
        ),
        const AppPadding(dividedBy: 4),
        Text(
          "H6 ${translation.of('theme.placeholderText')}",
          style: Theme.of(context).textTheme.headline6,
        ),

        const AppPadding(dividedBy: 4),
        Text(
          "Subtitle1 ${translation.of('theme.placeholderText')}",
          style: Theme.of(context).textTheme.subtitle1,
        ),

        const AppPadding(dividedBy: 4),
        Text(
          "Subtitle2 ${translation.of('theme.placeholderText')}",
          style: Theme.of(context).textTheme.subtitle2,
        ),

        const AppPadding(dividedBy: 4),
        Text(
          "bodyText1 ${translation.of('theme.placeholderText')}",
          style: Theme.of(context).textTheme.bodyText1,
        ),

        const AppPadding(dividedBy: 4),
        Text(
          "bodyText2 ${translation.of('theme.placeholderText')}",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        const AppPadding(dividedBy: 4),
        Text(
          "Button ${translation.of('theme.placeholderText')}",
          style: Theme.of(context).textTheme.button,
        ),

        const AppPadding(dividedBy: 4),
        Text(
          "Subtitle2 ${translation.of('theme.placeholderText')}",
          style: Theme.of(context).textTheme.subtitle2,
        ),
        const AppPadding(dividedBy: 4),
        Text(
          "Caption ${translation.of('theme.placeholderText')}",
          style: Theme.of(context).textTheme.caption,
        ),

        const AppPadding(dividedBy: 4),
        Text(
          "Overline ${translation.of('theme.placeholderText')}",
          style: Theme.of(context).textTheme.overline,
        ),
      ],
    );
  }
}
