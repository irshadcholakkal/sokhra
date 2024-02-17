part of 'tset_bloc.dart';

abstract class TsetState extends Equatable {
  const TsetState();
}

class TestInitial extends TsetState {
  @override
  List<Object> get props => [];
}

class TestLoadingState extends TsetState {
  // final List<WishList> wishList;

  // CustomerWishlistLoadingState({required this.wishList});
  @override
  List<Object> get props => [];
}

class TestFetchSuccessState extends TsetState {
  final List<WishList> wishList;

  TestFetchSuccessState({required this.wishList});
  @override
  List<Object> get props => [wishList];
}

class TestMutationSuccessState extends TsetState {
  // final List<WishList> wishList;
  // final bool isAdd;

  // CustomerWishlistMutationSuccessState(
      // {required this.wishList, required this.isAdd});
  @override
  List<Object> get props => [
    // wishList, isAdd
  ];
}

class TestFailedState extends TsetState {
  final String error;

  TestFailedState({required this.error});

  @override
  List<Object> get props => [error];
}
