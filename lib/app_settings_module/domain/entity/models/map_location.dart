import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_location.freezed.dart';
part 'map_location.g.dart';

@freezed
class MapLocation with _$MapLocation {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory MapLocation({
    final double? latitude,
    final double? longitude,
  }) = _MapLocation;

  factory MapLocation.fromJson(Map<String, dynamic> json) =>
      _$MapLocationFromJson(json);
}
