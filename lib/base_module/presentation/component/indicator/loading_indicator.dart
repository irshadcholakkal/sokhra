import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/values/app_constants.dart';
import '../../util/string_modifiers.dart';

class LoadingIndicator extends StatelessWidget {
  final String? message;
  final bool loading;

  const LoadingIndicator({
    Key? key,
    this.message,
    this.loading = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (loading)
            const CupertinoActivityIndicator(
              radius: AppConstants.defaultPadding / 2,
            ),
          const SizedBox(height: AppConstants.defaultPadding),
          if (message != null)
            Text(
              StringModifiers.capitalize(message),
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}
