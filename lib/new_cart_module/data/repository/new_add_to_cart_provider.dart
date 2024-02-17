import 'package:flutter/material.dart';

import '../../../base_module/data/entity/graphql_service.dart';
import '../../../base_module/data/entity/models/data_response.dart';
import '../../../base_module/data/entity/models/error_info.dart';
import '../../../user_module/domain/user_data.dart';
import '../schemas/new_add_to_cart_schema.dart';

class NewAddToCartProvider {
  NewAddToCartSchema _newAddToCartSchema = NewAddToCartSchema();

  Future<DataResponse> addToCart(
      {String? productId,
      String? choiceId,
      int? quantity,
      String? deviceId,
      String? variantChoiceId,
      String? pincode}) async {
    print(
        "${productId}-${choiceId}-${quantity}-${deviceId}-${variantChoiceId}-${pincode}");
    try {
      final mutationOptions = GraphQLService().makeMutationOptions(
        query: _newAddToCartSchema.addToCart,
        variables: {
          'input': {
            "product": productId,
            // "choice": choiceId,
            "quantity": quantity,
            // "variantChoice":variantChoiceId,
            "variant": variantChoiceId,
            "deviceId": deviceId,
          },
          "pinCode": userData.pinCode,
        },
      );

      final graphQLResponse = await GraphQLService().performMutation(
        mutationOptions: mutationOptions,
      );
      print("NewAddToCartProvider  :${graphQLResponse.data}");

      if (graphQLResponse.hasData) {
        return DataResponse(data: graphQLResponse.data);
      } else {
        return DataResponse(
          error: graphQLResponse.error!.message,
        );
      }
    } catch (e) {
      debugPrint("NewAddToCartProvider : " + e.toString());
    }
    return DataResponse(
      error: ErrorType.SOME_ERROR,
    );
  }
}
