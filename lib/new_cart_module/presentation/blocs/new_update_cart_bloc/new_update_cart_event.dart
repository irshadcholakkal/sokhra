import 'package:equatable/equatable.dart';

abstract class NewUpdateCartEvent extends Equatable {
  const NewUpdateCartEvent();
}

class IncrementCartItemValue extends NewUpdateCartEvent {
  final String? cartItemId;
  final int? quantity;
  final String? pincode;

  IncrementCartItemValue({
    this.cartItemId,
    this.quantity,
    this.pincode,
  });

  @override
  List<Object?> get props => [
        cartItemId,
        quantity,
        pincode,
      ];
}

class DecrementCartItemValue extends NewUpdateCartEvent {
  final String? cartItemId;
  final int? quantity;
  final String? pincode;

  DecrementCartItemValue({
    this.cartItemId,
    this.quantity,
    this.pincode,
  });

  @override
  List<Object?> get props => [
        cartItemId,
        quantity,
        pincode,
      ];
}

class DeleteCartItem extends NewUpdateCartEvent {
  final String cartItemId;

  DeleteCartItem({required this.cartItemId});

  @override
  List<Object> get props => [cartItemId];
}
