import 'package:freezed_annotation/freezed_annotation.dart';

import 'zone.dart';

part 'region.freezed.dart';
part 'region.g.dart';

@freezed
class Region with _$Region {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory Region(
      {@JsonKey(name: "_id") final String? regionId,
      final String? name,
      final bool? isActive,
      final bool? hasSameDayDelivery,
      final bool? hasSameDayShipping,
      final String? cutOfTime,
      final List<Zone>? zones}) = _Region;

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
}
