part of 'customer_favourites_bloc.dart';

abstract class CustomerFavouritesEvent extends Equatable {
  const CustomerFavouritesEvent();
}

class CustomerFavouritesFetchEvent extends CustomerFavouritesEvent {
  final bool reFetch;
  final SortInput sortInput;
  final String pincode;

  CustomerFavouritesFetchEvent({
    this.reFetch = false,
    this.sortInput = const SortInput(),
    this.pincode = "",
  });
  @override
  List<Object?> get props => [reFetch, sortInput, pincode];
}
