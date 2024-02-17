import 'package:freezed_annotation/freezed_annotation.dart';

import 'app_version.dart';
import 'whatsapp_config.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

@freezed
class Settings with _$Settings {
  const factory Settings({
    @JsonKey(name: "_id") final String? id,
    final WhatsappConfig? whatsappSettings,
    final AppVersion? appVersion,
    final String? defaultPincode,
  }) = _Settings;

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);
}
