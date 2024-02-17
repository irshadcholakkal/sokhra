import 'package:flutter/material.dart';

import '../../../base_module/data/entity/graphql_service.dart';
import '../../../base_module/data/entity/models/data_response.dart';
import '../../../base_module/domain/entity/app.dart';
import '../../../user_module/domain/user_data.dart';
import '../../domain/models/cart_list.dart';
import '../entity/input_models/add_to_cart_input.dart';
import '../schemas/cart_schema.dart';

class CartProvider {
  CartSchema _cartSchema = CartSchema();

  Future<DataResponse> getCart({
    required String? deviceId,
    // required String pinCode,
    required bool? reFetch,
    required double? lat,
    required double? lng,
  }) async {
    // try {
    final queryOptions = GraphQLService().makeQueryOptions(
      query: _cartSchema.getCart,
      variables: {
        "devid": app.deviceId,
        "pinCode": userData.pinCode,
        // "lat": lat,
        // "lng": lng
      },
      networkOnly: true,
    );

    final _graphQLResponse = await GraphQLService().performQuery(
      queryOptions: queryOptions,
    );

    if (_graphQLResponse.hasData) {
      // print("cart provider response:${_graphQLResponse.data}");
      return DataResponse(data: CartList.fromJson(_graphQLResponse.data));
    } else {
      return DataResponse(error: _graphQLResponse.error?.message);
    }
    // } catch (e) {
    //   debugPrint("CartProvider get cart" + e.toString());
    // }
    // return DataResponse(error: "SOME ERROR");
  }

  Future<DataResponse> addToCart({
    required AddToCartInput addToCartInput,
    required String pincode,
  }) async {
    try {
      final mutationOptions = GraphQLService().makeMutationOptions(
        query: _cartSchema.addToCart,
        variables: {
          'input': {
            'choice': addToCartInput.choiceId,
            'product': addToCartInput.productId,
            'quantity': addToCartInput.quantity,
            'deviceId': addToCartInput.deviceId,
            'variantChoice': addToCartInput.variantChoice
          },
          "pinCode": userData.pinCode
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
      debugPrint("addtocartprovider" + e.toString());
    }
    return DataResponse(error: "SOME ERROR");
  }

  Future<DataResponse> updateCart({
    required String? cartId,
    required double? quantity,
    // required String? pincode
  }) async {
    try {
      final mutationOptions = GraphQLService().makeMutationOptions(
        query: _cartSchema.updateCart,
        variables: {
          "id": cartId,
          "quantity": quantity,
          "pinCode": userData.pinCode
        },
      );
      // debugPrint(
      //     "cart provider->update cart cartId:${cartId} quantity:${quantity}   pincode:${pincode}");

      final graphQLResponse = await GraphQLService().performMutation(
        mutationOptions: mutationOptions,
      );

      if (graphQLResponse.hasData) {
        return DataResponse(data: graphQLResponse.data);
      } else {
        return DataResponse(error: graphQLResponse.error?.message);
      }
    } catch (e) {
      debugPrint("deletecartprovider" + e.toString());
    }
    return DataResponse(error: "SOME ERROR");
  }

  //@deprecated
  Future<DataResponse> deleteCart({required String? cartid}) async {
    try {
      final mutationOptions = GraphQLService().makeMutationOptions(
        query: _cartSchema.deleteCart,
        variables: {"id": cartid},
      );

      final graphQLResponse = await GraphQLService().performMutation(
        mutationOptions: mutationOptions,
      );

      if (graphQLResponse.hasData) {
        return DataResponse(data: graphQLResponse.data);
      } else {
        return DataResponse(error: graphQLResponse.error?.message);
      }
    } catch (e) {
      debugPrint("deletecartprovider" + e.toString());
    }
    return DataResponse(error: "SOME ERROR");
  }
}
