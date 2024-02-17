part of 'recent_ordered_products_bloc.dart';

abstract class RecentOrderedProductsState extends Equatable {
  const RecentOrderedProductsState();

  @override
  List<Object> get props => [];
}

class RecentOrderedProductsLoading extends RecentOrderedProductsState {}

class RecentOrderedProductsLoaded extends RecentOrderedProductsState {
  final List<Product> products;

  RecentOrderedProductsLoaded({required this.products});

  @override
  List<Object> get props => [products];
}

class RecentOrderedProductsLoadingFailed extends RecentOrderedProductsState {
  final String message;

  RecentOrderedProductsLoadingFailed({required this.message});

  @override
  List<Object> get props => [message];
}
