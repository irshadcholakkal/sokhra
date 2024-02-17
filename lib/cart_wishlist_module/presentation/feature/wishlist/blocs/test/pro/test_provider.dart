
import 'package:flutter/cupertino.dart';
import '../../../../../../../base_module/data/entity/graphql_service.dart';
import '../../../../../../../base_module/data/entity/models/data_response.dart';
import '../../../../../../data/entity/input_models/wish_list_input.dart';
import '../../../../../../data/schemas/wish_list_schema.dart';



class TestProvider {
  WishListSchema _wishListSchema = WishListSchema();

  Future<DataResponse> getWishLists(
      {required String? deviceId,
        // required String? pinCode,
        required bool? reFetch,
        required double? lat,
        required double? lng,

      }) async {
    // try {
    final queryOptions = GraphQLService().makeQueryOptions(
      query: _wishListSchema.getWishLists,
      networkOnly: reFetch ?? false,
      variables: {"devid": deviceId,
        // "pinCode": pinCode,
        "lat":lat, "lng":lng
      },
    );

    final _graphQLResponse = await GraphQLService().performQuery(
      queryOptions: queryOptions,
    );

    if (_graphQLResponse.hasData) {
      // print("cart provider response:${_graphQLResponse.data}");
      return DataResponse(data: _graphQLResponse.data["wishLists"]);
    } else {
      return DataResponse(error: _graphQLResponse.error?.message);
    }
    // } catch (e) {
    //   debugPrint("CartProvider get cart" + e.toString());
    // }
    // return DataResponse(error: "SOME ERROR");
  }

  Future<DataResponse> addToWishList({
    required WishListInput? wishlistInput,
    required double? lat,
    required double? lng,
  }) async {
    try {

      // print("zzzzzzzzz");
      // print(wishlistInput?.product);
      // print(wishlistInput?.variant);
      // print(wishlistInput?.deviceId);
      // print(wishlistInput?.product);
      // print(lat);
      // print(lng);
      final mutationOptions = GraphQLService().makeMutationOptions(
        query: _wishListSchema.addToWishList,

        variables: {
          'input': wishlistInput,
          'lat':lat,
          'lng':lng
        },
      );
      // debugPrint(
      //     "cart provider->addtocart choiceId:${addToCartInput.choiceId} productId:${addToCartInput.productId}  deviceId:${addToCartInput.deviceId}  pincode:${pincode}");

      final graphQLResponse = await GraphQLService().performMutation(
        mutationOptions: mutationOptions,
      );

      if (graphQLResponse.hasData) {
        // debugPrint("add to cart response ${graphQLResponse.data}");
        return DataResponse(data: graphQLResponse.data);
      } else {
        return DataResponse(error: graphQLResponse.error?.message);
      }
    } catch (e) {
      debugPrint("addtowishlist provider" + e.toString());
    }
    return DataResponse(error: "SOME ERROR");
  }

  Future<DataResponse> deleteWishList({
    required String? wishListId,
  }) async {
    try {
      final mutationOptions = GraphQLService().makeMutationOptions(
        query: _wishListSchema.deleteWishList,
        variables: {
          'id': wishListId,
        },
      );
      // debugPrint(
      //     "cart provider->addtocart choiceId:${addToCartInput.choiceId} productId:${addToCartInput.productId}  deviceId:${addToCartInput.deviceId}  pincode:${pincode}");

      final graphQLResponse = await GraphQLService().performMutation(
        mutationOptions: mutationOptions,
      );

      if (graphQLResponse.hasData) {
        // debugPrint("add to cart response ${graphQLResponse.data}");
        return DataResponse(data: graphQLResponse.data);
      } else {
        return DataResponse(error: graphQLResponse.error?.message);
      }
    } catch (e) {
      debugPrint("delete wishlist provider" + e.toString());
    }
    return DataResponse(error: "SOME ERROR");
  }
}
