import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';


part 'location_check_state.dart';

class LocationDetails {
  final double latitude;
  final double longitude;
  final String name;
  final String pinCode;

  LocationDetails({
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.pinCode,
  });
}

class LocationCheckCubit extends Cubit<LocationCheckState> {
  LocationCheckCubit() : super(LocationCheckInitial());

  Future<LocationDetails?> getPlace(double latitude, double longitude) async {
    try {
      final places = await placemarkFromCoordinates(latitude, longitude);
      final place = places.firstOrNull;

      if (place != null && place.postalCode?.isNotEmpty == true) {
        return LocationDetails(
          latitude: latitude,
          longitude: longitude,
          name: place.thoroughfare ??
              "${place.locality}, ${place.administrativeArea}",
          pinCode: place.postalCode!,
        );
      }
    } catch (e) {
      debugPrint("LocationCheckCubit:getPlace:exception:$e");
    }

    return null;
  }

  //main method of cubit
  void getLocation() async {
    emit(LocationCheckInProgress());

    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied ||
            permission == LocationPermission.deniedForever) {
          emit(LocationCheckFailed(message: "Location permission denied"));
        }
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final locationDetails = await getPlace(
        position.latitude,
        position.longitude,
      );

      if (locationDetails != null) {
        emit(LocationCheckSuccess(locationDetails: locationDetails));
      } else {
        emit(LocationCheckFailed(message: "Failed to fetch your location"));
      }
    } catch (e) {
      emit(LocationCheckFailed(message: "Unable to fetch your location"));
    }
  }
}
