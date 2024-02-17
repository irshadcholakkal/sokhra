import 'package:flutter/material.dart';

import '../../../base_module/presentation/core/values/app_constants.dart';

class CustomQuantityWidget extends StatefulWidget {
  final String quantity;
  final VoidCallback onRemovePressed;
  final VoidCallback onAddPressed;
  const CustomQuantityWidget(
      {Key? key,
      this.quantity = "1",
      required this.onRemovePressed,
      required this.onAddPressed})
      : super(key: key);

  @override
  _CustomQuantityWidgetState createState() => _CustomQuantityWidgetState();
}

class _CustomQuantityWidgetState extends State<CustomQuantityWidget> {
  double _containerWidth = 100;
  double _iconSize = 15;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _containerWidth,
      clipBehavior: Clip.antiAlias,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.cornerRadius * 0.6),
        // border: Border.all(color: Theme.of(context).colorScheme.primary)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _removeButton(context),
          _quantityCount(context),
          _addButton(context),
        ],
      ),
    );
  }

  Expanded _quantityCount(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        // width: _width*0.3,
        decoration:
            BoxDecoration(color: Theme.of(context).colorScheme.background),
        child: Center(
          child: Text(
            "${widget.quantity.split(".").first}",
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
      ),
    );
  }

  Expanded _addButton(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Material(
        child: InkWell(
          onTap: widget.onAddPressed,
          child: Container(
            // width: _width*0.3,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              // borderRadius: BorderRadius.only(
              //     topRight: Radius.circular(AppConstants.cornerRadius * 0.6),
              //     bottomRight: Radius.circular(AppConstants.cornerRadius * 0.6))
              borderRadius:
                  BorderRadius.circular(AppConstants.cornerRadius * 0.6),
            ),
            child: Center(
              child: Icon(
                Icons.add,
                size: _iconSize,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded _removeButton(BuildContext context) {
    return Expanded(
      flex: 2,
      child:
      Material(

        child: InkWell(
          onTap: widget.onRemovePressed,
          child: Container(
            // width: _width*0.3,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              // borderRadius: BorderRadius.only(
              //     topLeft: Radius.circular(AppConstants.cornerRadius * 0.6),
              //     bottomLeft: Radius.circular(AppConstants.cornerRadius * 0.6)
              // ),
              borderRadius:
                  BorderRadius.circular(AppConstants.cornerRadius * 0.6),
            ),
            child: Center(
              child: Icon(
                Icons.remove,
                size: _iconSize,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
