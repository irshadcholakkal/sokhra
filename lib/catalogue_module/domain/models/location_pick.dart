import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_pick.freezed.dart';
part 'location_pick.g.dart';

@freezed
class PickedLocation with _$PickedLocation {
  @JsonSerializable(explicitToJson: true,includeIfNull: false)
  const factory PickedLocation({
   final double ? lat,
   final double ? lng,

  }) = _PickedLocation;



  factory PickedLocation.fromJson(Map<String, dynamic> json) =>
      _$PickedLocationFromJson(json);
}