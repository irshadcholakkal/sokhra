import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../user_module/domain/entity/models/user.dart';

part 'subscribed_user.freezed.dart';
part 'subscribed_user.g.dart';

@freezed
class SubscribedUser with _$SubscribedUser {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory SubscribedUser({final User? user, final String? token}) =
      _SubscribedUser;

  factory SubscribedUser.fromJson(Map<String, dynamic> json) =>
      _$SubscribedUserFromJson(json);
}
