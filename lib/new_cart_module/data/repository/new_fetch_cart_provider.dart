import 'package:flutter/material.dart';

import '../../../base_module/data/entity/graphql_service.dart';
import '../../../base_module/data/entity/models/data_response.dart';
import '../../../base_module/data/entity/models/error_info.dart';
import '../../../base_module/domain/entity/app.dart';
import '../../../user_module/domain/user_data.dart';
import '../schemas/new_fetch_cart_schema.dart';

class FetchCartProvider {
  FetchCartSchema _fetchCartSchema = FetchCartSchema();

  Future<DataResponse> fetchCartItemsFromServer({
    required String pincode,
  }) async {
    try {
      final queryOptions = GraphQLService().makeQueryOptions(
        query: _fetchCartSchema.fetchCartItemsFromServer,
        variables: {
          "pinCode": userData.pinCode,
        },
        networkOnly: true,
      );

      final graphQLResponse = await GraphQLService().performQuery(
        queryOptions: queryOptions,
      ); 
      print("fetchCartItemsFromServer :${graphQLResponse.data}");

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
      debugPrint("FetchCartProvider :- " + e.toString());
    }
    return DataResponse(
      error: ErrorType.SOME_ERROR,
    );
  }
}
