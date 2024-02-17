import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../catalogue_module/domain/models/product.dart';
import '../../../catalogue_module/domain/models/variant.dart';
import '../../../user_module/domain/entity/models/user.dart';

part 'wish_list.freezed.dart';
part 'wish_list.g.dart';

@freezed
class WishList with _$WishList {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory WishList({
    @JsonKey(name: "_id") final String? id,
    final Product? product,
    final Variant? variant,
    final User? user,
    final String? deviceId,
  }) = _WishList;

  factory WishList.fromJson(Map<String, dynamic> json) =>
      _$WishListFromJson(json);
}
