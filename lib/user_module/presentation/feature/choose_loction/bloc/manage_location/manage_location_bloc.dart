import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_webservice/directions.dart';
import '../../../../../../base_module/domain/entity/app.dart';

part 'manage_location_event.dart';

part 'manage_location_state.dart';

class ManageLocationBloc
    extends Bloc<ManageLocationEvent, ManageLocationState> {
  ManageLocationBloc()
      : super(
          ChangeLocationSuccess(geometry: app.geometry, address: app.address
              // pickedLocation: app.pickedLocation,
              ),
        );

  @override
  Stream<ManageLocationState> mapEventToState(
    ManageLocationEvent event,
  ) async* {
    if (event is ChangeLocation) {
      yield ChangeLocationInProgress();

      // await app.setPickedLocation(event.pickedLocation);
      await app.setLocation(event.geometry!, event.address);
      // await app.setLocation(event.pickedLocation?.geometry, event.pickedLocation?.id, event.pickedLocation?.formattedAddress, event.pickedLocation?.adrAddress);

      yield ChangeLocationSuccess(
          // pickedLocation: app.pickedLocation,
          address: app.address,
          geometry: app.geometry);
    }
  }
}
