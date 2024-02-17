part of 'product_details_cubit.dart';

abstract class ProductDetailsState extends Equatable {
  const ProductDetailsState();
  @override
  List<Object> get props => [];
}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsLoadingSuccess extends ProductDetailsState {
  final Product product;

  ProductDetailsLoadingSuccess({required this.product});

  @override
  List<Object> get props => [product];
}

class ProductDetailsLoadingFailed extends ProductDetailsState {
  final String error;

  ProductDetailsLoadingFailed({required this.error});

  @override
  List<Object> get props => [error];
}
