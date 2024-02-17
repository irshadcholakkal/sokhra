import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_cart_input.freezed.dart';
part 'update_cart_input.g.dart';

@freezed
class UpdateCartInput with _$UpdateCartInput {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory UpdateCartInput({
    @JsonKey(name: "_id") required final String cartId,
    required final int quantity,
  }) = _UpdateCartInput;

  factory UpdateCartInput.fromJson(Map<String, dynamic> json) =>
      _$UpdateCartInputFromJson(json);
}
