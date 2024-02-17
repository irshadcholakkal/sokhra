import 'package:equatable/equatable.dart';

abstract class NewAddToCartState extends Equatable {
  const NewAddToCartState();
}

class AddToCartButtonInitial extends NewAddToCartState{
  @override
  List<Object?> get props => [];
}

class AddToCartButtonLoading extends NewAddToCartState {
  @override
  List<Object?> get props => [];
}

class AddToCartButtonLoaded extends NewAddToCartState{
  @override
  List<Object?> get props => [];
}

class AddToCartButtonLoadingFailed extends NewAddToCartState {
  @override
  List<Object?> get props => [];
}
