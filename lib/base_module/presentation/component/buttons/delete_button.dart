import 'package:flutter/material.dart';

import '../../core/values/app_constants.dart';

class DeleteButton extends StatelessWidget {
  final VoidCallback onPressed;
  const DeleteButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConstants.defaultPadding * 1.7,
      child: IconButton(
          iconSize: 32,
          icon: Icon(
            Icons.delete_outline,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
          ),
          onPressed: () => onPressed()),
    );
  }
}
