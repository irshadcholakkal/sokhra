import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_choices.freezed.dart';
part 'sub_choices.g.dart';

@freezed
class SubChoice  with _$SubChoice  {
  @JsonSerializable(explicitToJson: true,includeIfNull: false)
  const factory SubChoice({
    @JsonKey(name: "_id") final String? id,
    final String ?name,
    final double ?choicePrice
  }) = _SubChoice;



  factory SubChoice.fromJson(Map<String, dynamic> json) =>
      _$SubChoiceFromJson(json);
}