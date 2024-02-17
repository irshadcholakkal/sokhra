import 'package:flutter/material.dart';

import '../../../domain/entity/translation.dart';
import '../../core/values/app_constants.dart';
import '../padding/app_padding.dart';

class StatisticsCard extends StatefulWidget {
  final List<StatisticsCardDataModel>? cardItems;

  const StatisticsCard({
    Key? key,
    required this.cardItems,
  }) : super(key: key);

  @override
  _StatisticsCardState createState() => _StatisticsCardState();
}

class _StatisticsCardState extends State<StatisticsCard> {
  @override
  Widget build(BuildContext context) {
    final List<StatisticsCardDataModel> _cardItems = widget.cardItems ?? [];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(translation.of('theme.statistics')),
            const AppPadding(dividedBy: 2),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                // spacing: AppConstants.defaultPadding,
                // runSpacing: AppConstants.defaultPadding,
                children: _cardItems
                    .map(
                      (item) => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (item.illustration != null)
                            CircleAvatar(
                              backgroundColor: (item.color ??
                                      Theme.of(context).colorScheme.primary)
                                  .withOpacity(0.2),
                              child: item.illustration,
                            ),
                          if (item.illustration != null)
                            const AppPadding(dividedBy: 2),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.value!,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(color: item.color),
                              ),
                              Text(
                                item.title!,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ],
                          ),
                          const AppPadding(),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatisticsCardDataModel {
  final String? title, value;
  final Widget? illustration;
  final Color? color;

  StatisticsCardDataModel(
      {this.color, this.title, this.value, this.illustration});
}
