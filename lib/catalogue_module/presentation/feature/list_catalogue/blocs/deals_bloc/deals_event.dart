part of 'deals_bloc.dart';

abstract class DealsEvent extends Equatable {
  const DealsEvent();
}

class DealsFetchEvent extends DealsEvent {
  final bool reFetch;
  final SortInput? sortInput;
  final String pincode;
  final double ? lat;
  final double ? lng;

  DealsFetchEvent({
    this.reFetch = false,
    this.sortInput,
    this.pincode = "",
    this.lat,
    this.lng
  });
  @override
  List<Object?> get props => [reFetch, sortInput, pincode, lat, lng];
}
