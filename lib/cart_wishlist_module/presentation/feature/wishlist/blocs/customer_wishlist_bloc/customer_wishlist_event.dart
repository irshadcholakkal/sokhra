part of 'customer_wishlist_bloc.dart';

abstract class CustomerWishlistEvent extends Equatable {
  const CustomerWishlistEvent();
}

class CustomerWishListAddEvent extends CustomerWishlistEvent {
  final WishListInput? wishListInput;
  final double? lat;
  final double? lng;

  CustomerWishListAddEvent({
    required this.wishListInput,
    required this.lat,
    required this.lng
  });

  @override
  List<Object?> get props => [
        wishListInput,
    lat, lng
      ];
}

class CustomerWishListRemoveEvent extends CustomerWishlistEvent {
  final String? wishListId;

  CustomerWishListRemoveEvent({required this.wishListId});

  @override
  List<Object?> get props => [wishListId];
}

class CustomerWishListFetchEvent extends CustomerWishlistEvent {
  final bool? reFetch;
  // final String? pinCode;
  final String? deviceId;
  final double ? lat;
  final double ? lng;

  CustomerWishListFetchEvent(
      {this.reFetch = false,
        // required this.pinCode,
        this.deviceId,
      this.lng, this.lat
      });

  @override
  List<Object?> get props => [reFetch, deviceId, lat, lng];
}

class CustomerWishListResetEvent extends CustomerWishlistEvent {
  @override
  List<Object?> get props => [];
}
