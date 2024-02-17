import 'package:freezed_annotation/freezed_annotation.dart';

part 'whatsapp_config.freezed.dart';
part 'whatsapp_config.g.dart';

@freezed
class WhatsappConfig with _$WhatsappConfig {
  const factory WhatsappConfig({
    final String? number,
    final String? message,
  }) = _WhatsappConfig;

  factory WhatsappConfig.fromJson(Map<String, dynamic> json) =>
      _$WhatsappConfigFromJson(json);
}
