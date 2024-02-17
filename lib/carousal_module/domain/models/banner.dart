import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner.freezed.dart';
part 'banner.g.dart';

@freezed
class Banner with _$Banner {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory Banner({
    @JsonKey(name: "_id") final String? id,
    final String? name,
    final String? subHeader,
    final String?type,
    final String? avatar,
    final int? sortOrder,
    final bool? isActive,
  }) = _Banner;

  factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);
}
