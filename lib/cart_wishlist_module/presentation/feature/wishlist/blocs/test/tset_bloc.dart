import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../../base_module/data/entity/models/error_info.dart';
import '../../../../../data/entity/input_models/wish_list_input.dart';
import '../../../../../domain/models/wish_list.dart';

import 'pro/test_provider.dart';

part 'tset_event.dart';
part 'tset_state.dart';

class TsetBloc extends Bloc<TsetEvent, TsetState> {
  TsetBloc() : super(TestInitial());
  final _wishListProvider = TestProvider();
  @override
  Stream<TsetState> mapEventToState(TsetEvent event) async* {

    if (event is TestAddEvent) {

      yield TestInitial();
      try {

        final result = await _wishListProvider.addToWishList(
            wishlistInput: event.wishListInput,lat: event.lat,lng: event.lng);
        if (result.hasData) {

          yield TestMutationSuccessState();
        } else {

          yield TestFailedState(
              error: ErrorType.SOME_ERROR.replaceAll("_", " "));
        }
      } catch (e) {

        yield TestFailedState(error: e.toString());
      }
    };

    if (event is TestResetEvent) {
      // _wishList = [];
      // WishListData.map = {};
      yield TestInitial();
    };

    if (event is TestRemoveEvent) {
      yield TestLoadingState();
      try {
        final result = await _wishListProvider.deleteWishList(
          wishListId: event.wishListId,
        );
        if (result.hasData) {
          yield TestMutationSuccessState(
              // wishList: _wishList, isAdd: false
          );
        } else {
          yield TestFailedState(
              error: ErrorType.SOME_ERROR.replaceAll("_", " "));
        }
      } catch (e) {
        yield TestFailedState(error: e.toString());
      }
    };

    if (event is TestFetchEvent) {
      yield TestInitial();
      try {
        final response = await _wishListProvider.getWishLists(
            deviceId: event.deviceId,
            // pinCode: event.pinCode,
            reFetch: event.reFetch,
            lat: event.lat,
            lng:event.lng
        );


        var resItem = [];
        var result = response.data;
        resItem = result.map((itm) {
          return WishList.fromJson(itm);
        }).toList();
        final wishListDataList =
        List<WishList>.from(resItem);
        yield TestFetchSuccessState(wishList: wishListDataList);




        // if (result.hasData) {
        //   List data = result.data["wishLists"] ?? [];
        //   _wishList = [];
        //   data.forEach((element) {
        //     _wishList.add(WishList.fromJson(element));
        //   });
        //   WishListData.map = {};
        //   _wishList.forEach((element) {
        //     if (element.product?.productId != null &&
        //         element.variant?.variantId != null &&
        //         element.id != null) {
        //       if (WishListData.map.containsKey(element.product?.productId)) {
        //         Map<String, String> map = {
        //           element.variant!.variantId!: element.id!
        //         };
        //         WishListData.map[element.product!.productId]!.addAll(map);
        //       } else {
        //         WishListData.map[element.product!.productId!] = {
        //           element.variant!.variantId!: element.id!
        //         };
        //       }
        //       ;
        //     }
        //   });
        //   yield TestFetchSuccessState(wishList: _wishList);
        // } else {
        //   yield TestFailedState(
        //       error: ErrorType.SOME_ERROR.replaceAll("_", " "));
        // }
      } catch (e) {
        yield TestFailedState(error: e.toString());
      }
    };

  }

}
