import 'package:flutter/material.dart';

import '../../../domain/entity/translation.dart';
import '../../core/values/app_constants.dart';
import '../../util/responsive.dart';

class EditButton extends StatefulWidget {
  final void Function() onpress;
  final bool isExpanded;

  const EditButton({
    Key? key,
    required this.onpress,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  _EditButtonState createState() => _EditButtonState();
}

class _EditButtonState extends State<EditButton> {
  @override
  Widget build(BuildContext context) {
    final bool _isExpanded = widget.isExpanded || !Responsive.isMobile(context);
    final Icon _icon = Icon(
      Icons.edit,
      color: Theme.of(context).colorScheme.onPrimary,
    );
    if (_isExpanded) {
      return SizedBox(
        child: ElevatedButton.icon(
          onPressed: () => widget.onpress,
          icon: _icon,
          label: Text(translation.of('theme.edit').toUpperCase()),
        ),
      );
    } else {
      return SizedBox(
        width: AppConstants.defaultPadding * 1.5,
        child: IconButton(
          iconSize: 32,
          icon: _icon,
          onPressed: widget.onpress,
        ),
      );
    }
  }
}
