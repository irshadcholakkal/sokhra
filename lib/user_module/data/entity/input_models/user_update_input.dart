import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_update_input.freezed.dart';
part 'user_update_input.g.dart';

@Freezed()
class UserUpdateInput with _$UserUpdateInput {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory UserUpdateInput({
    final String? name,
    final String? lastname,
    final String? email,
    final String? phone,
    final bool? active,
  }) = _UserUpdateInput;

  factory UserUpdateInput.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateInputFromJson(json);
}
