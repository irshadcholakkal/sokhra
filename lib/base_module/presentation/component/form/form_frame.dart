import 'package:flutter/material.dart';

import '../../../domain/entity/app_theme_singleton.dart';
import '../../core/values/app_constants.dart';
import '../../util/responsive.dart';
import '../padding/app_padding.dart';

class FormFrame extends StatefulWidget {
  final Widget? formBuilder;
  final List<Widget>? actions;
  final List<Widget>? footerActions;
  final String? title;

  const FormFrame(
      {Key? key,
      this.formBuilder,
      required this.title,
      this.actions,
      this.footerActions})
      : super(key: key);

  @override
  _FormFrameState createState() => _FormFrameState();
}

class _FormFrameState extends State<FormFrame> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxWidth: Responsive.mobileBreakPoint.toDouble()),
      child: Card(
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: appTheme.isDark
                    ? Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5)
                    : Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppConstants.cornerRadius),
                  topRight: Radius.circular(AppConstants.cornerRadius),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding / 2,
                vertical: AppConstants.defaultPadding / 2,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: AppConstants.defaultPadding / 2),
                      child: Text(
                        widget.title ?? "",
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ),
                  ),
                  if (widget.actions != null)
                    ...widget.actions!
                  else
                    const AppPadding()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppConstants.defaultPadding / 2),
              child: widget.formBuilder,
            ),
            if (widget.footerActions != null) const Divider(),
            if (widget.footerActions != null)
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.defaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: widget.footerActions!,
                ),
              )
            else
              const AppPadding(),
            const AppPadding(dividedBy: 2)
          ],
        ),
      ),
    );
  }
}
