import 'package:equatable/equatable.dart';

import '../../../../../domain/models/cart_list.dart';

abstract class CartState extends Equatable {
  const CartState();
  @override
  List<Object?> get props => [];
}

class ListInitial extends CartState {}

class ListLoading extends CartState {
  final CartList previousCart;
  final double? deliveryCharge, minimumPurchaseAmount;

  ListLoading(
      {required this.previousCart,
      required this.deliveryCharge,
      required this.minimumPurchaseAmount});
  @override
  List<Object?> get props => [this.previousCart];
}

class ListLoaded extends CartState {
  final CartList carts;
  final double? deliveryCharge, minimumPurchaseAmount;

  ListLoaded(
      {required this.carts,
      required this.deliveryCharge,
      required this.minimumPurchaseAmount});
  @override
  List<Object?> get props => [carts, deliveryCharge, minimumPurchaseAmount];
}

class ListLoadingFailed extends CartState {
  final String message;
  ListLoadingFailed({required this.message});

  @override
  List<Object?> get props => [message];
}

class DeleteCartSuccess extends CartState {
  final String message;

  DeleteCartSuccess({
    required this.message,
  });

  @override
  List<Object?> get props => [this.message];
}

class DeleteCartFailed extends CartState {
  final String message;

  DeleteCartFailed({
    required this.message,
  });

  @override
  List<Object?> get props => [this.message];
}

class UpdateCartSuccess extends CartState {
  final String message;

  UpdateCartSuccess({
    required this.message,
  });

  @override
  List<Object?> get props => [this.message];
}

class UpdateCartFailed extends CartState {
  final String message;

  UpdateCartFailed({
    required this.message,
  });

  @override
  List<Object?> get props => [this.message];
}
