import 'package:freezed_annotation/freezed_annotation.dart';

import 'banner.dart';

part 'banners.freezed.dart';
part 'banners.g.dart';

@freezed
class Banners with _$Banners {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory Banners({
    @Default([]) final List<Banner>? banners,
  }) = _Banners;

  factory Banners.fromJson(Map<String, dynamic> json) =>
      _$BannersFromJson(json);
}
