import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../base_module/data/entity/models/data_response.dart';
import '../../../../../../base_module/data/entity/models/sort_input.dart';
import '../../../../../data/repositories/catalogue_provider.dart';
import '../../../../../domain/models/product_list.dart';

part 'products_list_event.dart';
part 'products_list_state.dart';

class ProductsListBloc extends Bloc<ProductsListEvent, ProductsListState> {
  ProductsListBloc() : super(ProductsListLoading());
  final _productsProvider = CatalogueProvider();

  @override
  Stream<ProductsListState> mapEventToState(
    ProductsListEvent event,
  ) async* {
    if (event is ProductsListFetchEvent) {

      yield* _mapFetchProductsListEventtoState(
          sortInput: event.sortInput ?? SortInput(),
          subCategoryId: event.subCategoryId,
          pincode: event.pincode,
          currentState: state,
          reFetch: event.reFetch,
          categoryId: event.categoryId,
      lat: event.lat,
        lng: event.lng
      );
    }
  }

  Stream<ProductsListState> _mapFetchProductsListEventtoState(
      {required ProductsListState currentState,
      required String? subCategoryId,
      required bool reFetch,
      required String categoryId,
      required SortInput sortInput,
      required String pincode,
      required double lat,
      required double lng

      }) async* {

    yield ProductsListLoading();
    // final pageInput = PageInput(
    //   limit: 50,
    //   skip: !reFetch && currentState is ProductsListFetchSuccess
    //       ? currentState.pageInput.skip
    //       : 0,
    // );
    final DataResponse _dataResponse = await _productsProvider.getProducts(
        subCategoryId: subCategoryId,
        reFetch: reFetch,
        categoryId: categoryId,
        // pinCode: pincode,
        sortInput: sortInput,
    lng: lng,
      lat: lat
    );

    // print("bbbbbbb");
    // print(_dataResponse.data.toString());
    if (_dataResponse.hasData) {
      final _products = _dataResponse.data as ProductList;
      yield ProductsListFetchSuccess(
          // data: !reFetch && currentState is ProductsListFetchSuccess
          //     ? currentState.data.copyWith(
          //         products: currentState.data.products + _products.products,
          //         totalCount: _products.totalCount,
          //       )
          //     : _products,
          data: _products,
          // pageInput: pageInput.copyWith(
          //     skip: pageInput.skip + _products.products.length),
          hasReachedMax: _products.products.isEmpty);
    }
    else {
      yield ProductsListFetchFailed(
          error: _dataResponse.error?.replaceAll(" ", "_").toUpperCase() ?? "");
    }
  }
}
