import 'package:freezed_annotation/freezed_annotation.dart';

import 'user.dart';

part 'authenticated_user.freezed.dart';
part 'authenticated_user.g.dart';

@freezed
class AuthenticatedUser with _$AuthenticatedUser {
  @JsonSerializable(explicitToJson: true,includeIfNull: false)
  const factory AuthenticatedUser({
    final User? user,
    final String? token
  }) = _AuthenticatedUser;

  factory AuthenticatedUser.fromJson(Map<String, dynamic> json) =>
      _$AuthenticatedUserFromJson(json);
}



