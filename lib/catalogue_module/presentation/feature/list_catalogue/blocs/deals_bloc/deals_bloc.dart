import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../base_module/data/entity/models/data_response.dart';
import '../../../../../../base_module/data/entity/models/sort_input.dart';
import '../../../../../data/repositories/catalogue_provider.dart';
import '../../../../../domain/models/product_list.dart';

part 'deals_event.dart';
part 'deals_state.dart';

class DealsBloc extends Bloc<DealsEvent, DealsState> {
  DealsBloc() : super(DealsFetchLoading());
  final _featuredProvider = CatalogueProvider();

  @override
  Stream<DealsState> mapEventToState(DealsEvent event) async* {
    if (event is DealsFetchEvent) {
      try {
        final DataResponse _dataResponse = await _featuredProvider.getDeals(
            reFetch: event.reFetch,
            sortInput: event.sortInput,
            // pinCode: event.pincode,
          lng: event.lng,
          lat: event.lat

        );

        if (_dataResponse.hasData) {
          // debugPrint("featured response ${_dataResponse.data}");
          final _products = _dataResponse.data as ProductList;
          yield DealsFetchSuccess(
            productList: _products,
          );
        } else {
          yield DealsFetchFailed(
              error: _dataResponse.error?.replaceAll("_", " ").toUpperCase() ??
                  "");
        }
      } catch (e) {
        yield DealsFetchFailed(
            error: "Error response from server".toUpperCase());
      }
    }
  }
}
