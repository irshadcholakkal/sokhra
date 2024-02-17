import 'package:flutter/material.dart';

import '../../../component/cards/statistics_card.dart';
import '../../../component/padding/app_padding.dart';

class StatisticsCardDemo extends StatelessWidget {
  const StatisticsCardDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppPadding(multipliedBy: 2),
        const Text('StatisticsCard'),
        const AppPadding(dividedBy: 2),
        StatisticsCard(
          cardItems: [
            StatisticsCardDataModel(
              title: "Sales",
              value: "234",
              color: Theme.of(context).colorScheme.primary,
              illustration: Icon(
                Icons.grade,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            StatisticsCardDataModel(
              title: "Users",
              value: "4234",
              color: Colors.greenAccent,
              illustration: const Icon(
                Icons.person,
                color: Colors.greenAccent,
              ),
            ),
            StatisticsCardDataModel(
              title: "Products",
              value: "42",
              color: Colors.redAccent.withOpacity(0.7),
              illustration: Icon(
                Icons.grade,
                color: Colors.redAccent.withOpacity(0.7),
              ),
            ),
            StatisticsCardDataModel(
              title: "Products",
              value: "42",
              color: Colors.redAccent.withOpacity(0.7),
              illustration: Icon(
                Icons.grade,
                color: Colors.redAccent.withOpacity(0.7),
              ),
            ),
          ],
        )
      ],
    );
  }
}
