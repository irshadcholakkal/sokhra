import 'package:freezed_annotation/freezed_annotation.dart';

import 'otp_type.dart';

part 'otp_input.freezed.dart';
part 'otp_input.g.dart';

@Freezed()
class OtpInput with _$OtpInput {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory OtpInput({
    final String? email,
    final String? phone,
    required final OtpType otpType,
  }) = _OtpInput;

  factory OtpInput.fromJson(Map<String, dynamic> json) =>
      _$OtpInputFromJson(json);
}
