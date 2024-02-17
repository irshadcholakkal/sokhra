import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../domain/entity/app_theme_singleton.dart';
import '../../core/values/app_constants.dart';

class AppToggleButton extends StatefulWidget {
  final bool value;
  final Function? onChange;

  const AppToggleButton({Key? key, this.value = false, this.onChange})
      : super(key: key);

  @override
  _AppToggleButtonState createState() => _AppToggleButtonState();
}

class _AppToggleButtonState extends State<AppToggleButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.defaultPadding / 4),
      child: Transform.scale(
        scale: 0.8,
        child: CupertinoSwitch(
          value: widget.value,
          activeColor: Theme.of(context).primaryColor,
          trackColor: appTheme.isDark
              ? Theme.of(context).primaryColor.withOpacity(0.3)
              : Colors.grey.withOpacity(0.5),
          onChanged: (bool value) {
            if (widget.onChange != null) {
              widget.onChange!();
              debugPrint(value.toString());
            }
          },
        ),
      ),
    );
  }
}
