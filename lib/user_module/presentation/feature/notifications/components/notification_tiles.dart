import 'package:flutter/material.dart';

import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/util/date_time_helper.dart';
import '../../../../domain/entity/models/app_notification.dart';

class NotificationTiles extends StatelessWidget {
  final AppNotification? notification;
  const NotificationTiles({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var utcTime = dateTimeHelper.parseDateTimeString(
        dateTime: "${notification?.createdDate}");
    String? localTime = dateTimeHelper.toDateTimeString(utcTime,
        dateFormat: "dd-MM-yyyy hh:mm:ss aaa");

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("${localTime ?? translation.of("n/a")}"),
      ListTile(
        leading: Icon(Icons.notifications,
            color: Theme.of(context).colorScheme.primary),

        //  Container(
        //   height: 50.0,
        //   width: 50.0,
        //   decoration: BoxDecoration(
        //    // image: DecorationImage(image: AssetImage(logo), fit: BoxFit.cover),
        //   ),
        // ),
        title: Text("${notification?.title ?? translation.of("n/a")}",
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: Theme.of(context).colorScheme.primary)),
        subtitle: Container(
            width: double.infinity,
            child: Text("${notification?.description ?? translation.of("n/a")}",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: Theme.of(context).colorScheme.primary))),
        onTap: () {},
      ),
    ]);
  }
}
