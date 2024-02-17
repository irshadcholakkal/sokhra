import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../data/repositories/list_featured_products_provider.dart';
import '../../../../../domain/models/products_by_subcategory_model.dart';
import 'featured_products_event.dart';
import 'featured_products_state.dart';

class ListFeaturedProductsBloc extends Bloc<ListFeaturedProductsEvent, ListFeaturedProductsState> {
  ListFeaturedProductsProvider _listFeaturedProductsProvider = ListFeaturedProductsProvider();
  ListFeaturedProductsBloc() : super(FeaturedProductsLoading());

  @override
  Stream<ListFeaturedProductsState> mapEventToState(
      ListFeaturedProductsEvent event) async* {
    if (event is FetchFeaturedProducts) {
      yield FeaturedProductsLoading();
      final dataResponse = await _listFeaturedProductsProvider
          .listAllFeaturedProducts(pincode: event.pincode,lng: event.lng,lat: event.lat);
          print("ListFeaturedProductsBloc :- ${dataResponse.data}");
      if (dataResponse.hasData) {
        print("ListFeaturedProductsBloc : ${dataResponse.data}");
        CustomerPoducts? customerPoducts =
            CustomerPoducts.fromJson(dataResponse.data['customerPoducts']); 

            print("------------------------------------->${customerPoducts.products}");
        if (customerPoducts.products != null) {
          if (customerPoducts.products!.isNotEmpty) {
            yield FeaturedProductsLoaded(
              featuredProducts: customerPoducts.products ?? [],
            );
          } else {
            yield FeaturedProductsLoadingFailed();
          }
        } else {
          yield FeaturedProductsLoadingFailed();
        }
      } else {
        yield FeaturedProductsLoadingFailed();
      }
    }
  }
}
