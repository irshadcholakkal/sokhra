import 'package:flutter/material.dart';

class ClearButton extends StatelessWidget {
  final Function onpress;
  const ClearButton({
    Key? key,
    required this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onpress,
      child: Text(
        'Clear',
        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }
}
