import 'package:freezed_annotation/freezed_annotation.dart';

import 'settings.dart';

part 'settings_list.freezed.dart';
part 'settings_list.g.dart';

@freezed
class SettingsList with _$SettingsList {
  const factory SettingsList({
    @JsonKey(name: "Settings") final List<Settings>? settings,
    final int? totalCount,
  }) = _SettingsList;

  factory SettingsList.fromJson(Map<String, dynamic> json) =>
      _$SettingsListFromJson(json);
}
