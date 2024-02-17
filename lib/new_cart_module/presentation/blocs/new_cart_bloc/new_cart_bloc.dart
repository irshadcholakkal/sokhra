import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/new_fetch_cart_provider.dart';
import '../../../domain/new_cart_model.dart';
import 'new_cart_event.dart';
import 'new_cart_state.dart';

class NewCartBloc extends Bloc<NewCartEvent, NewCartState> {
  FetchCartProvider _fetchCartProvider = FetchCartProvider();

  NewCartBloc() : super(CartInitial());

  @override
  Stream<NewCartState> mapEventToState(NewCartEvent event) async* {
    if (event is FetchCartItems) {
      yield CartLoading();

      final dataResponse = await _fetchCartProvider.fetchCartItemsFromServer(
        pincode: event.pincode,
      );

          print("NewCartBloc :${dataResponse.data}");
      if (dataResponse.hasData) {
        RootCartModel rootCartModel = RootCartModel.fromJson(dataResponse.data["cart"]);
                                print("NewCartBloc :${dataResponse.data}");
                                

        if (rootCartModel.cart != null) {
          var cartList = rootCartModel.cart ?? [];

          //@deprecated: not need -> sort fixed in api side
          // cartList.sort((a, b) {
          //   final aDate = int.tryParse(a.createdAt ?? '') ?? 0;
          //   final bDate = int.tryParse(b.createdAt ?? '') ?? 0;
          //   return bDate.compareTo(aDate);
          // });

          yield CartLoaded(cartList: cartList);
                  print("NewCartBloc :${dataResponse.data}");
                  print("rootCartModel${cartList}");

        } else {
          yield CartLoadingFailed();
                  print("NewCartBlocFailed :${dataResponse.error}");

        }
      } else {
        print("NewCartBlocFailed :${dataResponse.error}");
        yield CartLoadingFailed();
      }
    }
  }
}
