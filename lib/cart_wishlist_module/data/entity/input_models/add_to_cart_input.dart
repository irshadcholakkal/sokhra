import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_to_cart_input.freezed.dart';
part 'add_to_cart_input.g.dart';

@Freezed()
class AddToCartInput with _$AddToCartInput {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory AddToCartInput({
    @JsonKey(name: "_id") required final String? productId,
    required final int quantity,
    required final String? choiceId,
    required final String? deviceId,
    final String? variantChoice,

  }) = _AddToCartInput;

  factory AddToCartInput.fromJson(Map<String, dynamic> json) =>
      _$AddToCartInputFromJson(json);
}
