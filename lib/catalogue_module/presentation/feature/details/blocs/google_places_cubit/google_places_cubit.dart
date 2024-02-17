import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:places_service/places_service.dart';

import '../../../../../../main.dart';

part 'google_places_state.dart';

class GooglePlacesCubit extends Cubit<GooglePlacesState> {
  GooglePlacesCubit() : super(GooglePlacesInitialState());

  final _placesService = PlacesService()..initialize(apiKey: kGoogleApiKey);
  double? _lat;

  double get lat => _lat ?? 0.0;

  double? _lng;

  double get lng => _lng ?? 0.0;

  String? _place;

  String get place => _place ?? '';
  String? _pin;

  String get pin => _pin ?? '';

  checkPlace(String? placeId, String? desc) async {
    try {
      final detail = await _placesService.getPlaceDetails(placeId ?? "");

      log("placeId is ${placeId} ${detail.state} ${detail.zip}");
      if (detail.zip != null || detail.zip != "") {
        _lat = detail.lat!;
        _lng = detail.lng!;
        _place = detail.city ?? desc ?? '';
        _pin = detail.zip ?? '';

        emit(GooglePlacesLoadedState(
          place: detail.city ?? desc ?? '',
          lat: detail.lat ?? 0.0,
          lng: detail.lng ?? 0.0,
          pinCode: detail.zip,
        ));
      } else {
        emit(GooglePlacesFailedState(error: "Unable to fetch pin code fail"));
      }
    } catch (e) {
      emit(GooglePlacesFailedState(error: "Unable to fetch pin code catch"));
    }
  }
}
