import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../base_module/data/entity/models/error_info.dart';
import '../../../../../data/entity/input_models/wish_list_input.dart';
import '../../../../../data/repository/wish_list_provider.dart';
import '../../../../../domain/models/wish_list.dart';
import '../../../../../domain/wish_list_data.dart';

part 'customer_wishlist_event.dart';
part 'customer_wishlist_state.dart';

class CustomerWishlistBloc
    extends Bloc<CustomerWishlistEvent, CustomerWishlistState> {
  CustomerWishlistBloc() : super(CustomerWishlistInitialState());

  final _wishListProvider = WishListProvider();

  List<WishList> _wishList = [];

  List<WishList> get wishList => _wishList;

  Map<String, Map<String, String>> get map => WishListData.map;

  @override
  Stream<CustomerWishlistState> mapEventToState(CustomerWishlistEvent event) async* {
    if (event is CustomerWishListAddEvent) {

      yield CustomerWishlistLoadingState(wishList: wishList);
      try {

        final result = await _wishListProvider.addToWishList(
            wishlistInput: event.wishListInput,lat: event.lat,lng: event.lng);
        if (result.hasData) {

          yield CustomerWishlistMutationSuccessState(
              wishList: _wishList, isAdd: true);
        } else {

          yield CustomerWishlistFailedState(
              error: ErrorType.SOME_ERROR.replaceAll("_", " "));
        }
      } catch (e) {

        yield CustomerWishlistFailedState(error: e.toString());
      }
    };

    if (event is CustomerWishListResetEvent) {
      _wishList = [];
      WishListData.map = {};
      yield CustomerWishlistInitialState();
    }

    if (event is CustomerWishListRemoveEvent) {
      yield CustomerWishlistLoadingState(wishList: _wishList);
      try {
        final result = await _wishListProvider.deleteWishList(
          wishListId: event.wishListId,
        );
        if (result.hasData) {
          yield CustomerWishlistMutationSuccessState(
              wishList: _wishList, isAdd: false);
        } else {
          yield CustomerWishlistFailedState(
              error: ErrorType.SOME_ERROR.replaceAll("_", " "));
        }
      } catch (e) {
        yield CustomerWishlistFailedState(error: e.toString());
      }
    };

    if (event is CustomerWishListFetchEvent) {
      yield CustomerWishlistLoadingState(wishList: _wishList);
      try {
        final result = await _wishListProvider.getWishLists(
            deviceId: event.deviceId,
            // pinCode: event.pinCode,
            reFetch: event.reFetch,
          lat: event.lat,
          lng:event.lng
        );
        if (result.hasData) {
          List data = result.data["wishLists"] ?? [];
          _wishList = [];
          data.forEach((element) {
            _wishList.add(WishList.fromJson(element));
          });
          WishListData.map = {};
          _wishList.forEach((element) {
            if (element.product?.productId != null &&
                element.variant?.variantId != null &&
                element.id != null) {
              if (WishListData.map.containsKey(element.product?.productId)) {
                Map<String, String> map = {
                  element.variant!.variantId!: element.id!
                };
                WishListData.map[element.product!.productId]!.addAll(map);
              } else {
                WishListData.map[element.product!.productId!] = {
                  element.variant!.variantId!: element.id!
                };
              }
              ;
            }
          });
          yield CustomerWishlistFetchSuccessState(wishList: _wishList);
        } else {
          yield CustomerWishlistFailedState(
              error: ErrorType.SOME_ERROR.replaceAll("_", " "));
        }
      } catch (e) {
        yield CustomerWishlistFailedState(error: e.toString());
      }
    }
  }
}
