import 'package:flutter/material.dart';

showScaffoldSnackBar({
  required BuildContext context,
  required String message,
  required Color color,
  required Widget icon,
  required Duration duration,
}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar
    ..showSnackBar(
      SnackBar(
        duration: duration,
        content: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  message ,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            icon,
          ],
        ),
        backgroundColor: color,
      ),
    );
}

SnackBar snackBar({
  required String message,
  required Color color,
  required Widget icon,
  required Duration duration,
}) {
  return SnackBar(
    duration: duration,
    content: Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              message ,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        icon,
      ],
    ),
    backgroundColor: color,
  );
}