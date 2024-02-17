import 'package:flutter/material.dart';
import '../../../domain/entity/translation.dart';

class LoadingOrErrorIndicator extends StatelessWidget {
  final EdgeInsets? padding;
  final bool isLoading;
  final String? error;
  final void Function()? onRetry;

  const LoadingOrErrorIndicator({
    Key? key,
    this.padding,
    this.isLoading = false,
    this.error,
    this.onRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isLoading) ...[
              const CircularProgressIndicator()
            ] else ...[
              Text(
                error ?? translation.of('some_error'),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
                textAlign: TextAlign.center,
              ),
              InkWell(
                onTap: onRetry,
                child: Text(
                  translation.of('retry'),
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
