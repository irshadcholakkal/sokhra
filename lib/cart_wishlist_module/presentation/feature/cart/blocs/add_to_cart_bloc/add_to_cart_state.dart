import 'package:equatable/equatable.dart';

import '../../../../../domain/models/cart.dart';

abstract class AddToCartState extends Equatable {
  const AddToCartState();
}

class AddToCartLoading extends AddToCartState {
  @override
  List<Object> get props => [];
}

class AddToCartSuccess extends AddToCartState {
  final List<Cart> carts;
  AddToCartSuccess({required this.carts});
  @override
  List<Object> get props => [carts];

  // final String message;

  // ListLoaded({required this.message});
  // @override
  // List<Object> get props => [this.message];
}

class AddToCartFailed extends AddToCartState {
  final String message;
  AddToCartFailed({required this.message});

  @override
  List<Object> get props => [message];
}
