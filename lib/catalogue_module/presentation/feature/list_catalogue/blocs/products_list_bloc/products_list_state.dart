part of 'products_list_bloc.dart';

abstract class ProductsListState extends Equatable {
  const ProductsListState();

  @override
  List<Object> get props => [];
}

class ProductsListLoading extends ProductsListState {}

class ProductsListFetchSuccess extends ProductsListState {
  final ProductList data;
  // final PageInput pageInput;
  final bool hasReachedMax;

  ProductsListFetchSuccess({
    required this.data,
    required this.hasReachedMax,
  });

  @override
  List<Object> get props => [data, hasReachedMax];
}

class ProductsListFetchFailed extends ProductsListState {
  final String error;

  ProductsListFetchFailed({required this.error});

  @override
  List<Object> get props => [error];
}
