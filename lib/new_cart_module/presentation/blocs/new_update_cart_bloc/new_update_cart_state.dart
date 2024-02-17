import 'package:equatable/equatable.dart';

import '../../../domain/new_cart_model.dart';

abstract class NewUpdateCartState extends Equatable {
  const NewUpdateCartState();

  @override
  List<Object?> get props => [];
}

class UpdateCartInitial extends NewUpdateCartState {
  @override
  List<Object?> get props => [];
}

class UpdateCartLoading extends NewUpdateCartState {
  @override
  List<Object?> get props => [];
}

class UpdateCartLoaded extends NewUpdateCartState {
  final int? quantity;

  UpdateCartLoaded({this.quantity});

  @override
  List<Object?> get props => [quantity];
}

class UpdateCartLoadingFailed extends NewUpdateCartState {
  @override
  List<Object?> get props => [];
}

class DeleteCartInProgress extends NewUpdateCartState {}

class DeleteCartSuccess extends NewUpdateCartState {
  final Cart cart;

  DeleteCartSuccess({required this.cart});

  @override
  List<Object> get props => [cart];
}

class DeleteCartFailed extends NewUpdateCartState {
  final String message;

  DeleteCartFailed({required this.message});

  @override
  List<Object?> get props => [message];
}
