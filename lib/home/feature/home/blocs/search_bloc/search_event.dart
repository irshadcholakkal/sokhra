part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchResultFetchEvent extends SearchEvent {
  final String name;
  final bool reFetch;
  final SortInput? sortInput;
  final String? categoryId;
  // final String? pinCode;
  final double? lat;
  final double? lng;

  SearchResultFetchEvent(
      {required this.name,
      this.reFetch = true,
      this.sortInput = const SortInput(),
      this.categoryId,
      // this.pinCode,
     this.lat,
     this.lng
      });

  @override
  List<Object?> get props => [name, reFetch, sortInput, categoryId,];
}
