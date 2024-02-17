import 'package:flutter/material.dart';
import '../../../domain/entity/translation.dart';

class LoadButton extends StatelessWidget {
  final String? title;
  final String? message;
  final void Function()? onPressed;

  const LoadButton({
    Key? key,
    this.title,
    this.message,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            message ?? translation.of("could_not_load"),
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
            textAlign: TextAlign.center,
          ),
          if (onPressed != null)
            TextButton(
              onPressed: onPressed,
              child: Text(
                title ?? translation.of("retry"),
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}
