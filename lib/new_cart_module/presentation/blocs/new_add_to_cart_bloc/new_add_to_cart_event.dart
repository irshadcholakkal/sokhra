import 'package:equatable/equatable.dart';

abstract class NewAddToCartEvent extends Equatable {
  const NewAddToCartEvent();
}

class AddItemToCart extends NewAddToCartEvent {
  final String productId;
  final String choiceId;
  final String deviceId;
  final String pincode;
  final String variantChoiceId;
  final int quantity;

  AddItemToCart( {
    required this.choiceId,
    required this.deviceId,
    required this.pincode,
    required this.productId,
    required this.quantity,
    required this.variantChoiceId,
  });

  @override
  List<Object?> get props => [
        choiceId,
        deviceId,
        pincode,
        productId,
        quantity,
        variantChoiceId
      ];
}
