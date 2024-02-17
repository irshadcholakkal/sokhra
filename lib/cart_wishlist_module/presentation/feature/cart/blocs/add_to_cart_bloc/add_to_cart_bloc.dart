import 'package:bloc/bloc.dart';

import '../../../../../data/repository/cart_provider.dart';
import '../../../../../domain/models/cart_list.dart';
import 'add_to_cart_event.dart';
import 'add_to_cart_state.dart';

class AddToCartBloc extends Bloc<LoadAddToCartEvent, AddToCartState> {
  CartProvider _cartProvider = CartProvider();
  AddToCartBloc() : super(AddToCartLoading());

  @override
  Stream<AddToCartState> mapEventToState(LoadAddToCartEvent event) async* {
    if (event is AddToCartEvent) {
      yield AddToCartLoading();
      final result = await _cartProvider.addToCart(
          addToCartInput: event.addToCartInput, pincode: event.pincode);

      if (result.hasData) {
        CartList _response = CartList.fromJson(result.data);
        // if (cartModel != null) {
        yield AddToCartSuccess(carts: _response.cartList ?? []);
        //   message: "Item Added",
        // );
      }
    }
  }
}
