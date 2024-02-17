import 'package:flutter/material.dart';

import '../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../base_module/presentation/core/values/app_constants.dart';

class AddedMoneyStatus extends StatelessWidget {
  final String transactionDate;
  final String transactionStatus;
  final String transactionId;
  final String transactionAmount;
  final bool? isCredit;
  const AddedMoneyStatus(
      {Key? key,
      required this.isCredit,
      required this.transactionDate,
      required this.transactionStatus,
      required this.transactionId,
      required this.transactionAmount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: AppConstants.defaultPadding * 0.15,
          left: AppConstants.defaultPadding * 0.4,
          right: AppConstants.defaultPadding * 0.4,
          bottom: AppConstants.defaultPadding * 0.15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${transactionDate}"),
          AppPadding(
            dividedBy: 6,
          ),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    children: [
                      Icon(
                        isCredit == null
                            ? Icons.warning
                            : isCredit == true
                                ? Icons.add
                                : Icons.remove,
                        color: isCredit == null
                            ? Colors.yellow
                            : isCredit == true
                                ? Colors.green
                                : Colors.red,
                        size: 40,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "STATUS: $transactionStatus",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(0.5)),
                            ),
                            Text(
                              "#${transactionId}",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      "₹${transactionAmount}",
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Divider(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
            ),
          )
        ],
      ),
    );
  }
}
