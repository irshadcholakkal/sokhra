part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchResultsLoading extends SearchState {}

class SearchResultsFetchSuccess extends SearchState {
  final ProductList data;

  SearchResultsFetchSuccess({required this.data});
  @override
  List<Object> get props => [data];
}

class SearchResultsFetchFailed extends SearchState {
  final String error;

  SearchResultsFetchFailed({required this.error});
  @override
  List<Object> get props => [error];
}
