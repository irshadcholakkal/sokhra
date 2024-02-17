import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  final double height;
  const AppDivider({Key? key, this.height = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      height: height,
    );
  }
}
