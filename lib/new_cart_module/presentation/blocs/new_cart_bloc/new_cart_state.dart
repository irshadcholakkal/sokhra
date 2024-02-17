import 'package:equatable/equatable.dart';

import '../../../domain/new_cart_model.dart';

abstract class NewCartState extends Equatable {
  const NewCartState();
}

class CartInitial extends NewCartState {
  @override
  List<Object?> get props => [];
}

class CartLoading extends NewCartState {
  @override
  List<Object?> get props => [];
}

class CartLoaded extends NewCartState {
  final List<Cart>? cartList;

  CartLoaded({
    this.cartList,
  });

  @override
  List<Object?> get props => [cartList];
}

class CartLoadingFailed extends NewCartState{
  @override
  List<Object?> get props => [];
}
