part of 'google_places_cubit.dart';

abstract class GooglePlacesState extends Equatable {
  const GooglePlacesState();
}

class GooglePlacesInitialState extends GooglePlacesState {
  @override
  List<Object?> get props => [];
}

class GooglePlacesLoadedState extends GooglePlacesState {
  final String ? pinCode;
  final String place;
  final double lat;
  final double lng;

  // GooglePlacesLoadedState({required this.pinCode});
  GooglePlacesLoadedState({required this.place, required this.lat, required this.lng, this.pinCode});

  @override
  List<Object?> get props => [place, lat, lng, pinCode];
}

class GooglePlacesFailedState extends GooglePlacesState {
  final String error;

  GooglePlacesFailedState({required this.error});
  @override
  List<Object?> get props => [this.error];
}
