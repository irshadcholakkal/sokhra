part of 'product_count_cubit.dart';

abstract class ProductCountState extends Equatable {
  const ProductCountState();
}

class ProductCountInitial extends ProductCountState {
  final int quantity = 1;

  @override
  List<Object> get props => [quantity];
}

class ProductCountLoaded extends ProductCountState {
  final int quantity;

  ProductCountLoaded({required this.quantity});
  @override
  List<Object> get props => [quantity];
}
