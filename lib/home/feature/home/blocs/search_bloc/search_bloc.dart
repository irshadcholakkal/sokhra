import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../base_module/data/entity/models/data_response.dart';
import '../../../../../base_module/data/entity/models/sort_input.dart';
import '../../../../../catalogue_module/data/repositories/catalogue_provider.dart';
import '../../../../../catalogue_module/domain/models/product_list.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial());
  final _productsProvider = CatalogueProvider();

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchResultFetchEvent) {
      yield SearchResultsLoading();
      final DataResponse _dataResponse = await _productsProvider.getProducts(
        lng: event.lng,
          lat: event.lat,
          name: event.name,
          reFetch: event.reFetch,
          categoryId: event.categoryId,
          // pinCode: event.pinCode,
          sortInput: event.sortInput,
          subCategoryId: '');

      if (_dataResponse.hasData) {
        final _products = _dataResponse.data as ProductList;
        yield SearchResultsFetchSuccess(
          data: _products,
        );
      } else {
        yield SearchResultsFetchFailed(
            error:
                _dataResponse.error?.replaceAll(" ", "_").toUpperCase() ?? "");
      }
    }
  }
}
