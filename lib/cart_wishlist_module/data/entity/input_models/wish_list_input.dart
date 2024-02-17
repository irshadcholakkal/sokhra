import 'package:freezed_annotation/freezed_annotation.dart';

part 'wish_list_input.freezed.dart';
part 'wish_list_input.g.dart';

@freezed
class WishListInput with _$WishListInput {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory WishListInput(
      {final String? product,
      final String? variant,
      final String? deviceId,
      final String? pinCode,
      }) = _WishListInput;

  factory WishListInput.fromJson(Map<String, dynamic> json) =>
      _$WishListInputFromJson(json);
}
