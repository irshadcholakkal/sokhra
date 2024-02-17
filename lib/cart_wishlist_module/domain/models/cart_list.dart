import 'package:freezed_annotation/freezed_annotation.dart';
import 'cart.dart';

part 'cart_list.freezed.dart';

part 'cart_list.g.dart';

@freezed
class CartList with _$CartList {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory CartList({
    @JsonKey(defaultValue: [], name: "cart") final List<Cart>? cartList,
  }) = _CartList;

  factory CartList.fromJson(Map<String, dynamic> json) =>
      _$CartListFromJson(json);
}
