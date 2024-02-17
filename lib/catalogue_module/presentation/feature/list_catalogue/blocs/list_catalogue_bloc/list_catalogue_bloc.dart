import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../base_module/data/entity/models/data_response.dart';
import '../../../../../data/repositories/catalogue_provider.dart';
import '../../../../../domain/models/category_list.dart';

part 'list_catalogue_event.dart';
part 'list_catalogue_state.dart';

class ListCatalogueBloc extends Bloc<ListCatalogueEvent, ListCatalogueState> {
  ListCatalogueBloc() : super(ListCatalogueLoading());

  @override
  Stream<ListCatalogueState> mapEventToState(
    ListCatalogueEvent event,
  ) async* {
    if (event is ListCatalogueFetchEvent) {
      yield* _mapFetchListCatalogueEventToState(
          state: state, reFetch: event.reFetch);
    }
  }
}

Stream<ListCatalogueState> _mapFetchListCatalogueEventToState(
    {required ListCatalogueState state, required bool reFetch}) async* {
  if (reFetch) {
    yield ListCatalogueLoading();
  }
  final DataResponse _dataResponse =
      await CatalogueProvider().getCategories(reFetch: reFetch);
  if (_dataResponse.hasData) {
    yield ListCatalogueFetchSuccess(data: _dataResponse.data as CategoryList);
  } else {
    yield ListCatalogueFetchFailed(
        error: _dataResponse.error?.replaceAll(" ", "_").toUpperCase() ?? "");
  }
}
