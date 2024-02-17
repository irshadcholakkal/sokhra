part of 'list_catalogue_bloc.dart';

abstract class ListCatalogueEvent extends Equatable {
  const ListCatalogueEvent();

  @override
  List<Object> get props => [];
}

class ListCatalogueFetchEvent extends ListCatalogueEvent {
  final bool reFetch;

  ListCatalogueFetchEvent({this.reFetch=false});

  @override
  List<Object> get props => [reFetch];
}
