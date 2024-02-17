part of 'location_check_cubit.dart';

abstract class LocationCheckState extends Equatable {
  const LocationCheckState();

  @override
  List<Object> get props => [];
}

class LocationCheckInitial extends LocationCheckState {}

class LocationCheckInProgress extends LocationCheckState {}

class LocationCheckSuccess extends LocationCheckState {
  final LocationDetails locationDetails;

  LocationCheckSuccess({required this.locationDetails});

  @override
  List<Object> get props => [locationDetails];
}

class LocationCheckFailed extends LocationCheckState {
  final String message;

  LocationCheckFailed({required this.message});

  @override
  List<Object> get props => [message];
}
