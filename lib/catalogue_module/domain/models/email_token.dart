import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_token.freezed.dart';
part 'email_token.g.dart';

@freezed
class EmailToken with _$EmailToken {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory EmailToken({
    final String? value,
  }) = _EmailToken;

  factory EmailToken.fromJson(Map<String, dynamic> json) =>
      _$EmailTokenFromJson(json);
}
