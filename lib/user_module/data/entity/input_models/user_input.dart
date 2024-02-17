import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_input.freezed.dart';
part 'user_input.g.dart';

@freezed
class UserInput with _$UserInput {
  @JsonSerializable(includeIfNull: false)
  const factory UserInput({
    final String? firstName,
    final String? lastName,
    final String? phone,
    final String? email,
    final String? otp,
  }) = _UserInput;

  factory UserInput.fromJson(Map<String, dynamic> json) =>
      _$UserInputFromJson(json);
}
