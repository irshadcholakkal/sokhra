part of 'manage_location_bloc.dart';

abstract class ManageLocationState extends Equatable {
  const ManageLocationState();

  @override
  List<Object?> get props => [];
}

class ChangeLocationInProgress extends ManageLocationState {}

class ChangeLocationSuccess extends ManageLocationState {
  // final PickedLocation? pickedLocation;
  // final PickResult? pickedLocation;
  final String ?address;
  final Geometry ? geometry;

  const ChangeLocationSuccess({
    required this.address,
    required this.geometry
    // required this.pickedLocation,
  });

  @override
  List<Object?> get props => [address, geometry];
}
