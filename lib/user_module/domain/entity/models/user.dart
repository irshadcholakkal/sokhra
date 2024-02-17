import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../catalogue_module/domain/models/email_token.dart';
import '../../../../catalogue_module/domain/models/seller.dart';
import 'role.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory User({
    @JsonKey(name: '_id') final String? id,
    final String? name,
    final String? lastname,
    final String? email,
    final String? phone,
    final Role? role,
    final Seller? seller,
    final EmailToken? emailToken,
    // @JsonKey(name: 'firebaseToken', defaultValue: [])
    //     final List<String>? firebaseTokenList,
    // @JsonKey(name: 'deviceId', defaultValue: [])
    //     final List<String>? deviceIdList,
    final bool? active,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
