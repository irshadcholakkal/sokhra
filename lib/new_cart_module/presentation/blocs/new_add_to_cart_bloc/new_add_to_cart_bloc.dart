import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/new_add_to_cart_provider.dart';
import 'new_add_to_cart_event.dart';
import 'new_add_to_cart_state.dart';

class NewAddToCartBloc extends Bloc<NewAddToCartEvent, NewAddToCartState> {
  NewAddToCartProvider _newAddToCartProvider = NewAddToCartProvider();
  NewAddToCartBloc() : super(AddToCartButtonInitial());

  @override
  Stream<NewAddToCartState> mapEventToState(NewAddToCartEvent event) async* {
    if (event is AddItemToCart) {
      yield AddToCartButtonLoading();
      final dataResponse = await _newAddToCartProvider.addToCart(
          choiceId: event.choiceId,
          deviceId: event.deviceId,
          pincode: event.pincode,
          productId: event.productId,
          quantity: event.quantity,
          variantChoiceId: event.variantChoiceId);
      print("ChoiceID${event.choiceId}");
      print("ProductID${event.productId}");
      print("VarientID${event.variantChoiceId}");

      if (dataResponse.hasData) {
        print("NewAddToCartBloc :${dataResponse.data}");
        yield AddToCartButtonLoaded();
      } else {
        yield AddToCartButtonLoadingFailed();
      }
    }
  }
}
