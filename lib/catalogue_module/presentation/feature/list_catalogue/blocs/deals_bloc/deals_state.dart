part of 'deals_bloc.dart';

abstract class DealsState extends Equatable {
  const DealsState();
  @override
  List<Object> get props => [];
}

class DealsFetchLoading extends DealsState {}

class DealsFetchSuccess extends DealsState {
  final ProductList productList;

  DealsFetchSuccess({required this.productList});
  @override
  List<Object> get props => [productList];
}

class DealsFetchFailed extends DealsState {
  final String error;

  DealsFetchFailed({required this.error});

  @override
  List<Object> get props => [error];
}
