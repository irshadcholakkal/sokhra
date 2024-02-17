import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_notification.freezed.dart';

part 'app_notification.g.dart';

@freezed
class AppNotification with _$AppNotification {
  @JsonSerializable(includeIfNull: false)
  const factory AppNotification({
    @JsonKey(name: '_id') final String? id,
    final String? title,
    final String? description,
    final String? createdDate,
  }) = _AppNotification;

  factory AppNotification.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationFromJson(json);
}
