part of 'manage_location_bloc.dart';

abstract class ManageLocationEvent extends Equatable {
  const ManageLocationEvent();

  @override
  List<Object?> get props => [];
}

class ChangeLocation extends ManageLocationEvent {
  // final PickedLocation? pickedLocation;
  // final PickResult? pickedLocation;
  final Geometry ?geometry;
  final String ?address;

  const ChangeLocation({
    // required this.pickedLocation,
required this.geometry,
    required this.address,
  });

  @override
  List<Object?> get props => [geometry, address];
}
