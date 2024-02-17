import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_version.freezed.dart';
part 'app_version.g.dart';

@freezed
class AppVersion with _$AppVersion {
  const factory AppVersion({
    final String? version,
    final bool? isUpdateRequired,
  }) = _AppVersion;

  factory AppVersion.fromJson(Map<String, dynamic> json) =>
      _$AppVersionFromJson(json);
}
