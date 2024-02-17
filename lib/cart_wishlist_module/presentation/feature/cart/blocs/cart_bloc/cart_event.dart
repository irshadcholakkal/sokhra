import 'package:equatable/equatable.dart';

import '../../../../../domain/models/cart_list.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class CartFetchEvent extends CartEvent {
  final String? deviceId;
  final String? pinCode;
  final bool? reFetch;
  final CartList? previousCart;
  final double? lat;
  final double? lng;

  CartFetchEvent({
    required this.deviceId,
    this.pinCode,
    this.reFetch = false,
    this.previousCart,
    this.lat,
    this.lng,
  });

  @override
  List<Object?> get props => [
        deviceId,
        pinCode,
        reFetch,
        previousCart,
        lat,
        lng,
      ];
}

class CartDeleteEvent extends CartEvent {
  final String? choiceId;
  final String? productId;
  final String? cartId;

  CartDeleteEvent(
      {required this.cartId, required this.choiceId, required this.productId});

  @override
  List<Object?> get props => [cartId, choiceId, productId];
}

class CartUpdateEvent extends CartEvent {
  final String? cartId;
  final double? quantity;
  final String? pincode;

  CartUpdateEvent(
      {required this.cartId, required this.quantity, this.pincode = ""});

  @override
  List<Object?> get props => [cartId, quantity, pincode];
}

class CartResetEvent extends CartEvent {
  @override
  List<Object?> get props => [];
}
