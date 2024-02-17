import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../../../../base_module/data/entity/models/data_response.dart';
import '../../../../../../base_module/data/entity/models/sort_input.dart';
import '../../../../../data/repositories/catalogue_provider.dart';
import '../../../../../domain/models/product_list.dart';

part 'featured_event.dart';
part 'featured_state.dart';

class FeaturedBloc extends Bloc<FeaturedEvent, FeaturedState> {
  FeaturedBloc() : super(FeaturedLoading());
  final _featuredProvider = CatalogueProvider();

  @override
  Stream<FeaturedState> mapEventToState(
    FeaturedEvent event,
  ) async* {
    if (event is FeaturedFetchEvent) {
      yield* _mapFeaturedFetchEventToState(
        currentState: state,
        event: event,
      );
    }
  }

  Stream<FeaturedState> _mapFeaturedFetchEventToState(
      {required FeaturedState currentState,
      required FeaturedFetchEvent event}) async* {
    try {
      final DataResponse _dataResponse = await _featuredProvider.getFeatured(
          reFetch: event.reFetch,
          sortInput: event.sortInput,
          // pincode: event.pincode,
          lng: event.lng,
          lat: event.lat
      );

      if (_dataResponse.hasData) {
        final _products =
            ProductList.fromJson(_dataResponse.data["customerPoducts"]);
        yield FeaturedLoadedSuccess(
          data: _products,
        );
      } else {
        yield FeaturedLoadedFailed(
            error:
                _dataResponse.error?.replaceAll(" ", "_").toUpperCase() ?? "");
      }
    } catch (e) {
      debugPrint("Error from featured bloc is $e");
      yield FeaturedLoadedFailed(
          error: "Error response from server".toUpperCase());
    }
  }
}
