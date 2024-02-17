part of 'customer_wishlist_bloc.dart';

abstract class CustomerWishlistState extends Equatable {
  const CustomerWishlistState();
}

class CustomerWishlistInitialState extends CustomerWishlistState {
  @override
  List<Object> get props => [];
}

class CustomerWishlistLoadingState extends CustomerWishlistState {
  final List<WishList> wishList;

  CustomerWishlistLoadingState({required this.wishList});
  @override
  List<Object> get props => [wishList];
}

class CustomerWishlistFetchSuccessState extends CustomerWishlistState {
  final List<WishList> wishList;

  CustomerWishlistFetchSuccessState({required this.wishList});
  @override
  List<Object> get props => [wishList];
}

class CustomerWishlistMutationSuccessState extends CustomerWishlistState {
  final List<WishList> wishList;
  final bool isAdd;

  CustomerWishlistMutationSuccessState(
      {required this.wishList, required this.isAdd});
  @override
  List<Object> get props => [wishList, isAdd];
}

class CustomerWishlistFailedState extends CustomerWishlistState {
  final String error;

  CustomerWishlistFailedState({required this.error});

  @override
  List<Object> get props => [error];
}
