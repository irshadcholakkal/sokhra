import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/new_update_cart_provider.dart';
import '../../../domain/new_cart_model.dart';
import '../../../domain/update_cart_model.dart';

import 'new_update_cart_event.dart';
import 'new_update_cart_state.dart';

class NewUpdateCartBloc extends Bloc<NewUpdateCartEvent, NewUpdateCartState> {
  NewUpdateCartProvider _updateCartProvider = NewUpdateCartProvider();

  NewUpdateCartBloc() : super(UpdateCartInitial());

  @override
  Stream<NewUpdateCartState> mapEventToState(NewUpdateCartEvent event) async* {
    if (event is IncrementCartItemValue) {
      yield UpdateCartLoading();

      final dataResponse = await _updateCartProvider.updateCartItemValue(
        cartItemId: event.cartItemId,
        pincode: event.pincode,
        quantity: event.quantity,
      );
      if (dataResponse.hasData) {
        UpdateCart updateCart = UpdateCart.fromJson(
          dataResponse.data['updateCart'],
        );

        yield UpdateCartLoaded(quantity: updateCart.quantity);
      } else {
        yield UpdateCartLoadingFailed();
      }
    } else if (event is DecrementCartItemValue) {
      yield UpdateCartLoading();

      final dataResponse = await _updateCartProvider.updateCartItemValue(
        cartItemId: event.cartItemId,
        pincode: event.pincode,
        quantity: event.quantity,
      );

      if (dataResponse.hasData) {
        UpdateCart updateCart = UpdateCart.fromJson(
          dataResponse.data['updateCart'],
        );

        yield UpdateCartLoaded(quantity: updateCart.quantity);
      } else {
        yield UpdateCartLoadingFailed();
      }
    } else if (event is DeleteCartItem) {
      yield DeleteCartInProgress();
      print("----${event.cartItemId}");

      final dataResponse = await _updateCartProvider.deleteCart(
        cartItemId: event.cartItemId,
      );

      if (dataResponse.hasData) {
        yield DeleteCartSuccess(cart: dataResponse.data as Cart);
      } else {
        yield DeleteCartFailed(message: dataResponse.error ?? "");
      }
    }
  }
}
