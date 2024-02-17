import 'package:flutter/material.dart';

import '../../domain/entity/translation.dart';
import '../core/values/app_constants.dart';

class ExitPopupHelper {
  static Future<bool> showExitPopup(BuildContext context) async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            insetPadding: const EdgeInsets.all(AppConstants.defaultPadding),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstants.cornerRadius),
            ),
            title: Text(
              translation.of("exit_app"),
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
            ),
            content: Text(
              translation.of("exit_app_question"),
              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                  color: Theme.of(context).colorScheme.primaryContainer),
            ),
            actionsAlignment: MainAxisAlignment.spaceAround,
            actions: [
              ElevatedButton(
                style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(horizontal: 45)),

                      // backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                onPressed: () => Navigator.of(context).pop(false),
                //return false when click on "NO"
                child: Text(
                  translation.of('no').toUpperCase(),
                  style: Theme.of(context).textTheme.button?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
              OutlinedButton(
                style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(horizontal: 45)),
                      side: MaterialStateProperty.all(BorderSide(
                          color: Theme.of(context).colorScheme.error)),
                      // backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                onPressed: () => Navigator.of(context).pop(true),
                //return true when click on "Yes"
                child: Text(
                  translation.of("yes").toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .button
                      ?.copyWith(color: Theme.of(context).colorScheme.error),
                ),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }
}
