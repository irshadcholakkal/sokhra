part of 'list_catalogue_bloc.dart';

abstract class ListCatalogueState extends Equatable {
  const ListCatalogueState();

  @override
  List<Object> get props => [];
}

class ListCatalogueLoading extends ListCatalogueState {}

class ListCatalogueFetchSuccess extends ListCatalogueState {
  final CategoryList data;

  ListCatalogueFetchSuccess({required this.data});

  @override
  List<Object> get props => [data];
}

class ListCatalogueFetchFailed extends ListCatalogueState {
  final String error;

  ListCatalogueFetchFailed({required this.error});

  @override
  List<Object> get props => [error];
}
