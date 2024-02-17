import 'package:flutter/material.dart';

class CustomCloseButton extends StatelessWidget {
  final void Function()? onTap;

  const CustomCloseButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        borderRadius: BorderRadius.circular(48),
        radius: 48,
        onTap: () {
          if (onTap != null) {
            onTap?.call();
          } else {
            Navigator.maybePop(context);
          }
        },
        child: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          radius: 36 / 2,
          child: Icon(
            Icons.clear,
            size: 20,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      ),
    );
  }
}
