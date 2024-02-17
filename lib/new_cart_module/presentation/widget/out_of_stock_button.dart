import 'package:flutter/material.dart';
import 'package:lumiereorganics_app/base_module/domain/entity/color_scheme.dart';

import '../../../base_module/domain/entity/translation.dart';
import '../../../base_module/presentation/core/values/app_constants.dart';

class OutOfStockButton extends StatefulWidget {
  final double? borderRadius;
  final double? width;
  final double? height;

  const OutOfStockButton({
    Key? key,
    this.borderRadius,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  State<OutOfStockButton> createState() => _OutOfStockButtonState();
}

class _OutOfStockButtonState extends State<OutOfStockButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 88,
      height: widget.height ?? 36,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColorScheme.onBlack.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(
          widget.borderRadius ?? AppConstants.cornerRadius / 3,
        ),
      ),
      child: Center(
        child: Text(
          translation.of('product_page.out_of_stock'),
          //"OUT OF STOCK",
          style: Theme.of(context).textTheme.subtitle2?.copyWith(
                color: AppColorScheme.onBlack.withOpacity(0.5),
                fontWeight: FontWeight.w400,
                fontSize: 10,
              ),
        ),
      ),
    );
  }
}
