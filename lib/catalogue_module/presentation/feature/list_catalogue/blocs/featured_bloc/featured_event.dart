part of 'featured_bloc.dart';

abstract class FeaturedEvent extends Equatable {
  const FeaturedEvent();

  @override
  List<Object?> get props => [];
}

class FeaturedFetchEvent extends FeaturedEvent {
  final bool reFetch;
  final SortInput? sortInput;
  final String pincode;
  final double ?lat;
  final double ?lng;

  FeaturedFetchEvent({this.reFetch = false, this.sortInput, this.pincode = "",this.lng, this.lat});
  @override
  List<Object?> get props => [reFetch, sortInput, pincode, lat, lng];
}
