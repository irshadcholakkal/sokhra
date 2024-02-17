import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../base_module/data/entity/models/data_response.dart';
import '../../../../../data/repositories/carousal_provider.dart';
import '../../../../../domain/models/banners.dart';

part 'carousal_event.dart';
part 'carousal_state.dart';

class CarousalBloc extends Bloc<CarousalEvent, CarousalState> {
  CarousalBloc() : super(CarousalLoading());
  final _carousalProvider = CarousalProvider();

  @override
  Stream<CarousalState> mapEventToState(
    CarousalEvent event,
  ) async* {
    if (event is CarousalFetchEvent) {
      yield* _mapFetchCarousalEventToState(
          currentSate: state, reFetch: event.reFetch);
    }
  }

  Stream<CarousalState> _mapFetchCarousalEventToState(
      {required CarousalState currentSate, required bool reFetch}) async* {
    final DataResponse _dataResponse =
        await _carousalProvider.getBanners(reFetch: reFetch);

    if (_dataResponse.hasData) {
      final _promotionList = _dataResponse.data as Banners;
      yield CarousalLoadedSuccess(banners: _promotionList);
    } else {
      yield CarousalLoadedFailed(
          error: _dataResponse.error?.replaceAll(" ", "_").toUpperCase() ?? "");
    }
  }
}
