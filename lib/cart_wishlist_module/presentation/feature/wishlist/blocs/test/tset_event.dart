part of 'tset_bloc.dart';

abstract class TsetEvent extends Equatable {
  const TsetEvent();
}

class TestAddEvent extends TsetEvent {
  final WishListInput? wishListInput;
  final double? lat;
  final double? lng;

  TestAddEvent({
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

class TestRemoveEvent extends TsetEvent {
  final String? wishListId;

  TestRemoveEvent({required this.wishListId});

  @override
  List<Object?> get props => [wishListId];
}

class TestFetchEvent extends TsetEvent {
  final bool? reFetch;
  // final String? pinCode;
  final String? deviceId;
  final double ? lat;
  final double ? lng;

  TestFetchEvent(
      {this.reFetch = false,
        // required this.pinCode,
        this.deviceId,
        this.lng, this.lat
      });

  @override
  List<Object?> get props => [reFetch, deviceId, lat, lng];
}

class TestResetEvent extends TsetEvent {
  @override
  List<Object?> get props => [];
}
