import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../../base_module/data/entity/models/data_response.dart';
import '../../../../../../catalogue_module/domain/catalogue_data.dart';
import '../../../../../data/repository/cart_provider.dart';
import '../../../../../domain/models/cart.dart';
import '../../../../../domain/models/cart_list.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartProvider _cartProvider = CartProvider();

  CartBloc() : super(ListInitial());

  CartList _cartList = CartList(cartList: []);
  CartList get cartList => _cartList;

  double? _minimumPurchaseAmount;
  double get minimumPurchaseAmount => _minimumPurchaseAmount ?? 0;
  double? _deliveryCharge;
  double get deliveryCharge => _deliveryCharge ?? 0;


  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is CartFetchEvent) {
      yield ListLoading(
          previousCart: cartList,
          minimumPurchaseAmount: minimumPurchaseAmount,
          deliveryCharge: deliveryCharge);
      final DataResponse _response = await _cartProvider.getCart(
          reFetch: event.reFetch,
          deviceId: event.deviceId,
          // pinCode: event.pinCode ?? userData.pinCode,
        lat: event.lat,
        lng: event.lng

        // lat: event.lat ??  ,
        // lng: event.lng ??

      );
      // debugPrint("app device id is ${event.deviceId}");

      if (_response.hasData) {
        _cartList = _response.data as CartList;
        // debugPrint("cart fetch ${_list.toString()}");
        List<Cart> _cart = _cartList.cartList ?? [];

        if (_cart.isNotEmpty) {
          /*
                                         * for each item in cartList whether item has a non null choice is checked.
                                         * if yes,checks whether the CatalogueData.map contains a key with the product id.
                                         *   if yes,a new map key with choice is created with a value of map,which has two key:value pair(cartId and quantity).
                                         *   if no,a new map is created with productId as key and a map with choice as key and another map as value which contains two key:value pair(cartId and quantity).
                                         * ================structure======================================
                                         * CatalogueData.map={
                                         * productId1:{
                                         *            choiceId1:{
                                         *                       cartId:"cartIdValue"
                                         *                       quantity:2
                                         *                       },
                                         *            choiceId2:{
                                         *                       cartId:"cartIdValue"
                                         *                       quantity:42
                                         *                       },
                                         * },
                                         * productId2:{
                                         *            choiceId1:{
                                         *                       cartId:"cartIdValue"
                                         *                       quantity:2
                                         *                       },
                                         *            choiceId2:{
                                         *                       cartId:"cartIdValue"
                                         *                       quantity:42
                                         *                       },
                                         * },
                                         * }
                                         * */
          _cart.forEach((item) {
            if (item.minimumPurchaseAmount != null) {
              _minimumPurchaseAmount = item.minimumPurchaseAmount;
              debugPrint("minimum :${item.minimumPurchaseAmount}");
            }
            if (item.deliveryCharge != null) {
              _deliveryCharge = item.deliveryCharge;
              debugPrint("delivery :${item.deliveryCharge}");
            }
            if (item.variant != null) {
              if (CatalogueData.map.containsKey(item.product?.productId)) {
                CatalogueData.map[item.product?.productId]![
                    item.variant!.variantId ?? ""] = {
                  "cartId": item.cartId,
                  "quantity": item.quantity
                };
              } else {
                CatalogueData.map[item.product?.productId ?? ""] = {
                  item.variant!.variantId!: {
                    "cartId": item.cartId,
                    "quantity": item.quantity
                  }
                };
              }
            }
          });
        } else {
          CatalogueData.map = {};
        }

        yield ListLoaded(
            carts: cartList,
            minimumPurchaseAmount: minimumPurchaseAmount,
            deliveryCharge: deliveryCharge
            // products: cartModel.products,
            );

        // }
      }
    }
    if (event is CartResetEvent) {
      CatalogueData.map = {};
      _cartList = CartList(cartList: []);
      _minimumPurchaseAmount = 0;
      _deliveryCharge = 0;
      yield ListInitial();
    }

    if (event is CartDeleteEvent) {
      // yield ListLoading();
      final result = await _cartProvider.deleteCart(cartid: event.cartId);
      if (result.hasData) {
        if (CatalogueData.map.containsKey(event.productId)) {
          if (CatalogueData.map[event.productId]!.containsKey(event.choiceId)) {
            CatalogueData.map[event.productId]!.remove(event.choiceId);
          }
          if (CatalogueData.map[event.productId]!.isEmpty) {
            CatalogueData.map.remove(event.productId);
          }
        }
        yield DeleteCartSuccess(
          message: "Item Deleted",
        );
      }
    }
    if (event is CartUpdateEvent) {
      // yield ListLoading();
      final result = await _cartProvider.updateCart(
          // pincode: event.pincode,
          cartId: event.cartId,
          quantity: event.quantity);
      if (result.hasData) {
        yield UpdateCartSuccess(
          message: "Item Updated",
        );
      }
    }
  }
}
