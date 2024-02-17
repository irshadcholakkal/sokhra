import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'sign_up_input.freezed.dart';
part 'sign_up_input.g.dart';

@Freezed()
class SignUpInput with _$SignUpInput {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory SignUpInput({
    required final String? name,
    required final String? phone,
    required final String? email,
    required final String? password,
    final String? otp,
     @JsonKey(includeFromJson: false, includeToJson: false) XFile? avatar,
    final String? lastName,
  }) = _SignUpInput;

  factory SignUpInput.fromJson(Map<String, dynamic> json) =>
      _$SignUpInputFromJson(json);
}
