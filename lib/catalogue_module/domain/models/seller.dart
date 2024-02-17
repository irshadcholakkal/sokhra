import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../user_module/domain/entity/models/user.dart';
import 'commission_type.dart';
import 'subscribed_user.dart';

part 'seller.freezed.dart';
part 'seller.g.dart';

@freezed
class Seller with _$Seller {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory Seller({
    @JsonKey(name: "_id") final String? id,
    final String? descriptionEn,
    final String? descriptionAr,
    final String? contactPerson,
    final String? contactEmail,
    final String? ibanId,
    final int? commission,
    final CommissionType? commissionType,
    final int? order,
    final User? user,
    final List<SubscribedUser>? subscribedUsers,
  }) = _Seller;

  factory Seller.fromJson(Map<String, dynamic> json) => _$SellerFromJson(json);
}
