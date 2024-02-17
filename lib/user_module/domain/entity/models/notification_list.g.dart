// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationList _$$_NotificationListFromJson(Map<String, dynamic> json) =>
    _$_NotificationList(
      notifications: (json['notifications'] as List<dynamic>?)
              ?.map((e) => AppNotification.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      totalCount: json['totalCount'] as int?,
    );

Map<String, dynamic> _$$_NotificationListToJson(_$_NotificationList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'notifications', instance.notifications?.map((e) => e.toJson()).toList());
  writeNotNull('totalCount', instance.totalCount);
  return val;
}
