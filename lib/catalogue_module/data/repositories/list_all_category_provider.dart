import 'package:flutter/material.dart';

import '../../../base_module/data/entity/graphql_service.dart';
import '../../../base_module/data/entity/models/data_response.dart';
import '../../../base_module/data/entity/models/error_info.dart';
import '../../../user_module/domain/user_data.dart';
import '../schemas/list_all_category_schema.dart';

class ListAllCategoryProvider {
  ListAllCategorySchema _listAllCategorySchema = ListAllCategorySchema();

  Future<DataResponse> listAllCategories(
    
    //{required String pincode}
    ) async {
    try {
      final queryOptions = GraphQLService().makeQueryOptions(
        query: _listAllCategorySchema.listAllCategory,
        networkOnly: true,
        // variables: {
        //   "pincode": 
        //  userData.pinCode,
        // },
      );

      final graphQLResponse = await GraphQLService().performQuery(
        queryOptions: queryOptions,
      );

      if (graphQLResponse.hasData) {
              debugPrint("ListAllCategoryProvider : ${graphQLResponse.data}");

        return DataResponse(
          data: graphQLResponse.data,
        );
      } else {
        return DataResponse(
          error: graphQLResponse.error!.message,
        );
      }
    } catch (e) {
      debugPrint("ListAllCategoryProvider : " + e.toString());
    }
    return DataResponse(
      error: ErrorType.SOME_ERROR,
    );
  }
}
