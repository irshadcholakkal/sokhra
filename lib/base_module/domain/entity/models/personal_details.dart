import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'personal_details.freezed.dart';

part 'personal_details.g.dart';

@freezed
class PersonalDetails with _$PersonalDetails {
  @JsonSerializable(includeIfNull: false)
  const factory PersonalDetails({
    final String? name,
    final String? email,
    final String? phone,
    final String? address,
  }) = _PersonalDetails;

  factory PersonalDetails.fromJson(Map<String, dynamic> json) =>
      _$PersonalDetailsFromJson(json);
}
