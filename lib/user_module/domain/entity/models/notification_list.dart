import 'package:freezed_annotation/freezed_annotation.dart';

import 'app_notification.dart';

part 'notification_list.freezed.dart';
part 'notification_list.g.dart';

@freezed
class NotificationList with _$NotificationList {
  @JsonSerializable(explicitToJson: true,includeIfNull: false)

  const factory NotificationList({
    @JsonKey(defaultValue: [])
    required final List<AppNotification>? notifications,

    required final int? totalCount,
  }) = _NotificationList;

  factory NotificationList.fromJson(Map<String, dynamic> json) =>
      _$NotificationListFromJson(json);
}

