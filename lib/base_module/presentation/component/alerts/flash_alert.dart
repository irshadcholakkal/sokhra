import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import '../../../domain/entity/translation.dart';

import '../../core/values/app_constants.dart';
import '../../util/responsive.dart';
import '../padding/app_padding.dart';

class FlashAlert extends StatelessWidget {
  final FlashController flashController;
  final Alignment? alignment;
  final Color? color;
  final IconData? iconData;
  final String? message;

  const FlashAlert({
    Key? key,
    required this.flashController,
    this.alignment,
    this.color,
    this.iconData,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flash(
      controller: flashController,
      alignment: alignment ?? Alignment.bottomCenter,
      backgroundColor: color ?? Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(AppConstants.cornerRadius),
      margin: EdgeInsets.symmetric(
        horizontal: Responsive.isMobile(context)
            ? AppConstants.defaultPadding
            : MediaQuery.of(context).size.width / 4,
        vertical: AppConstants.defaultPadding,
      ),
      //reduced width for bigger screens
      borderColor: color ?? Theme.of(context).colorScheme.primary,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(
          AppConstants.defaultPadding,
        ),
        child: Row(
          children: [
            Icon(
              iconData ?? Icons.message,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            const AppPadding(dividedBy: 2),
            Expanded(
              child: Text(
                message ?? "",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showSuccessFlash({
  required BuildContext context,
  String? message,
}) {
  showFlash(
    context: context,
    duration: const Duration(seconds: 2),
    builder: (_, controller) {
      return FlashAlert(
        flashController: controller,
        color: Colors.green,
        iconData: Icons.done,
        message: message ?? "",
      );
    },
  );
}

void showErrorFlash({
  required BuildContext context,
  String? message,
}) {
  showFlash(
    context: context,
    duration: const Duration(seconds: 2),
    builder: (_, controller) {
      return FlashAlert(
        flashController: controller,
        color: Colors.red,
        iconData: Icons.error,
        message: message ?? translation.of("something_went_wrong"),
      );
    },
  );
}

void showWarningFlash({
  required BuildContext context,
  String? message,
}) {
  showFlash(
    context: context,
    duration: const Duration(seconds: 2),
    builder: (_, controller) {
      return FlashAlert(
        flashController: controller,
        color: Colors.yellow,
        iconData: Icons.warning,
        message: message ?? translation.of("something_went_wrong"),
      );
    },
  );
}

void showInfoFlash({
  required BuildContext context,
  String? message,
}) {
  showFlash(
    context: context,
    duration: const Duration(seconds: 2),
    builder: (_, controller) {
      return FlashAlert(
        flashController: controller,
        color: Theme.of(context).colorScheme.secondary,
        iconData: Icons.info,
        message: message ?? "",
      );
    },
  );
}
