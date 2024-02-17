import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_input.freezed.dart';
part 'sign_in_input.g.dart';

@Freezed()
class SignInInput with _$SignInInput {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory SignInInput({
    required final String? username,
    required final String? password,
  }) = _SignInInput;

  factory SignInInput.fromJson(Map<String, dynamic> json) =>
      _$SignInInputFromJson(json);
}
