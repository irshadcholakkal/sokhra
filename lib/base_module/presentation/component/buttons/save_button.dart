import 'package:flutter/material.dart';

import '../../../domain/entity/translation.dart';
import '../../core/values/app_constants.dart';
import '../../util/responsive.dart';

class SaveButton extends StatefulWidget {
  final Function onpress;
  final bool isExpanded;
  const SaveButton({
    Key? key,
    required this.onpress,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  _SaveButtonState createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  @override
  Widget build(BuildContext context) {
    final bool _isExpanded = widget.isExpanded || !Responsive.isMobile(context);
    final Icon _icon = Icon(
      Icons.check_circle,
      color: Theme.of(context).colorScheme.onPrimary,
    );
    if (_isExpanded) {
      return ElevatedButton.icon(
        onPressed: () => widget.onpress,
        icon: _icon,
        label: Text(translation.of('theme.save').toUpperCase()),
      );
    } else {
      return SizedBox(
        width: AppConstants.defaultPadding * 1.5,
        child: IconButton(
          iconSize: 32,
          icon: _icon,
          onPressed: () => widget.onpress,
        ),
      );
    }
  }
}
