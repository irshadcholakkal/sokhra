import 'package:flutter/material.dart';

import '../../../base_module/data/entity/graphql_service.dart';
import '../../../base_module/data/entity/models/data_response.dart';
import '../../../base_module/data/entity/models/error_info.dart';
import '../../../user_module/domain/user_data.dart';
import '../schemas/list_products_by_subcategory_schema.dart';

class ListProductsBySearchProvider {
  ListProductsBySubCategorySchema _listProductsBySubCategorySchema =
      ListProductsBySubCategorySchema();
  Future<DataResponse> listProductsBySearch(
      {String? searchKey, String? subcategoryId, String? pincode}) async {
    try {
      final queryOptions = GraphQLService().makeQueryOptions(
        query: _listProductsBySubCategorySchema.listProductsBySubCategory,
        variables: {
          "filter": {
            "name": searchKey ?? "",
            "subCategory": subcategoryId ?? "",
          },
          "pinCode": userData.pinCode,
        },
        networkOnly: true,
      );

      final graphQLResponse = await GraphQLService().performQuery(
        queryOptions: queryOptions,
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
      debugPrint("ListProductsBySubcategoryProvider : " + e.toString());
    }
    return DataResponse(
      error: ErrorType.SOME_ERROR,
    );
  }
}
