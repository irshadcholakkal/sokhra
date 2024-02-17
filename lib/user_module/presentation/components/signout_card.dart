import 'package:flutter/material.dart';

import '../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../base_module/presentation/core/values/app_constants.dart';
import '../core/values/user_assets.dart';

class SignoutCard extends StatelessWidget {
  final VoidCallback onPressed;
  const SignoutCard({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _IconBox = 80;
    return Card(
      child: Container(
        constraints: BoxConstraints(maxWidth: 360),
        padding: EdgeInsets.all(
          AppConstants.defaultPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: _IconBox,
              height: _IconBox,
              child: Image.asset(
                UserAssets.POWER_ICON,
                fit: BoxFit.contain,
              ),
            ),
            const AppPadding(),
            Container(
              width: 200,
              child: Text(
                "Do you really want to Signout?",
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.center,
              ),
            ),
            const AppPadding(),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: onPressed,
                  child: Text(
                    "YES,SIGNOUT",
                    style: Theme.of(context).textTheme.button!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
