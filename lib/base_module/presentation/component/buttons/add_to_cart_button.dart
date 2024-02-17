import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../core/values/app_constants.dart';

class AddToCartButton extends StatefulWidget {
  final String? id;
  final double width;
  final double height;
  final VoidCallback onPressed;

  const AddToCartButton({
    Key? key,
    this.width = 150,
    this.height = 35,
    required this.id,
    required this.onPressed,
  }) : super(key: key);
  @override
  _AddToCartButtonState createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.width,
        height: widget.height,
        child: ElevatedButton.icon(
            style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(
                        horizontal: AppConstants.defaultPadding / 3,
                        vertical: AppConstants.defaultPadding / 3),
                  ),
                ),
            onPressed: widget.onPressed,
            icon: Icon(
              MdiIcons.cartOutline,
              size: 15,
            ),
            label: Text(
              "ADD",
              style: Theme.of(context).textTheme.button!.copyWith(
                  fontSize: 10, color: Theme.of(context).colorScheme.onPrimary),
            )));
  }
}
