import 'package:flutter/material.dart';

import '../../../base_module/data/entity/graphql_service.dart';
import '../../../base_module/data/entity/models/data_response.dart';
import '../../../base_module/data/entity/models/error_info.dart';
import '../../../user_module/domain/user_data.dart';
import '../schemas/list_products_by_subcategory_schema.dart';

class ListProductsBySubCategoryProvider {
  ListProductsBySubCategorySchema _listProductsBySubCategorySchema =
      ListProductsBySubCategorySchema();

  Future<DataResponse> listProductsBySubCategory({
    required String searchKey,
    String? subcategoryId,
    required String pincode, 
    String? categoryId, 
    String? SortByPrice,
    
  }) async {
    print("sorted:${SortByPrice}");
    print("subcategory${subcategoryId}");
    try {
      final queryOptions = GraphQLService().makeQueryOptions(
        query: _listProductsBySubCategorySchema.listProductsBySubCategory,
        variables: {
          "input": {"limit": 0, "skip": 0},
          "filter": {
            "subCategory": subcategoryId,
            "name": searchKey,
            "category":categoryId
          },
          "sort":{
            "price":SortByPrice.toString().split('.').last


          },
          "pinCode": userData.pinCode,
        },
        networkOnly: true,
      );

      final graphQLResponse = await GraphQLService().performQuery(
        queryOptions: queryOptions,
      );
      print("listProductsBySubCategory:${graphQLResponse.data}");

      if (graphQLResponse.hasData) {
        return DataResponse(data: graphQLResponse.data);
      } else {
        return DataResponse(error: graphQLResponse.error!.message);
      }
    } catch (e) {
      debugPrint("ListProductsBySubcategoryProvider : " + e.toString());
    }

    return DataResponse(error: ErrorType.SOME_ERROR);
  }
}
