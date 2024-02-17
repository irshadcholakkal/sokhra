import 'package:flutter/material.dart';

import '../../../base_module/data/entity/graphql_service.dart';
import '../../../base_module/data/entity/models/data_response.dart';
import '../../../base_module/data/entity/models/error_info.dart';
import '../../../user_module/domain/user_data.dart';
import '../../domain/new_cart_model.dart';
import '../schemas/new_update_cart_schema.dart';

class NewUpdateCartProvider {
  NewUpdateCartSchema _updateCartSchema = NewUpdateCartSchema();

  Future<DataResponse> updateCartItemValue({
    String? cartItemId,
    int? quantity,
    String? pincode,
  }) async {
    try {
      final mutationOptions = GraphQLService().makeMutationOptions(
        query: _updateCartSchema.updateCartItemValue,
        variables: {
          "cartItemId": cartItemId,
          "quantity": quantity,
          "pinCode": userData.pinCode,
          
        },
      );

      final graphQLResponse = await GraphQLService().performMutation(
        mutationOptions: mutationOptions,
      );

      if (graphQLResponse.hasData) {
        return DataResponse(
          data: graphQLResponse.data,
        );
      } else {
        return DataResponse(
          error: graphQLResponse.error!.message,
        );
      }
    } catch (e) {
      debugPrint("NewUpdateCartProvider : " + e.toString());
    }
    return DataResponse(
      error: ErrorType.SOME_ERROR,
    );
  }

  Future<DataResponse> deleteCart({required String cartItemId}) async {
    try {
      final mutationOptions = GraphQLService().makeMutationOptions(
        query: _updateCartSchema.deleteCart,
        variables: {"id": cartItemId},
      );

      final graphQLResponse = await GraphQLService().performMutation(
        mutationOptions: mutationOptions,
      );

      if (graphQLResponse.hasData) {
        return DataResponse(data: Cart(id: cartItemId));
      } else {
        return DataResponse(error: graphQLResponse.error?.message);
      }
    } catch (e) {
      debugPrint("NewUpdateCartProvider:deleteCart:exception" + e.toString());
    }

    return DataResponse(error: ErrorType.SOME_ERROR);
  }
}
