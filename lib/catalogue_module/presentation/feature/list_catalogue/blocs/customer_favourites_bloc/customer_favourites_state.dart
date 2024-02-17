part of 'customer_favourites_bloc.dart';

abstract class CustomerFavouritesState extends Equatable {
  const CustomerFavouritesState();
  @override
  List<Object> get props => [];
}

class CustomerFavouritesLoading extends CustomerFavouritesState {}

class CustomerFavouritesFetchSuccess extends CustomerFavouritesState {
  final ProductList productList;

  CustomerFavouritesFetchSuccess({required this.productList});
  @override
  List<Object> get props => [productList];
}

class CustomerFavouritesFetchFailed extends CustomerFavouritesState {
  final String error;

  CustomerFavouritesFetchFailed({required this.error});

  @override
  List<Object> get props => [error];
}
