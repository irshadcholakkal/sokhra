// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppNotification _$$_AppNotificationFromJson(Map<String, dynamic> json) =>
    _$_AppNotification(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      createdDate: json['createdDate'] as String?,
    );

Map<String, dynamic> _$$_AppNotificationToJson(_$_AppNotification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('createdDate', instance.createdDate);
  return val;
}
