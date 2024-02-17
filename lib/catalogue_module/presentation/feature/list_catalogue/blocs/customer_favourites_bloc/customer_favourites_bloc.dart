import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../base_module/data/entity/models/sort_input.dart';
import '../../../../../domain/models/product_list.dart';

part 'customer_favourites_event.dart';
part 'customer_favourites_state.dart';

class CustomerFavouritesBloc
    extends Bloc<CustomerFavouritesEvent, CustomerFavouritesState> {
  CustomerFavouritesBloc() : super(CustomerFavouritesLoading());

  @override
  Stream<CustomerFavouritesState> mapEventToState(
      CustomerFavouritesEvent event) async* {
    if (event is CustomerFavouritesFetchEvent) {
      yield CustomerFavouritesFetchSuccess(
          productList:
              ProductList(products: [], totalCount: 0)); //todo add connection
    }
    ;
  }
}
