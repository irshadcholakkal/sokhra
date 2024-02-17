import 'package:flutter/material.dart';
import '../../../base_module/data/entity/graphql_service.dart';
import '../../../base_module/data/entity/models/data_response.dart';
import '../../../base_module/data/entity/models/error_info.dart';
import '../../../user_module/domain/user_data.dart';
import '../schemas/list_products_by_subcategory_schema.dart';
class ListFeaturedProductsProvider {
  ListProductsBySubCategorySchema _productsBySubCategorySchema =
      ListProductsBySubCategorySchema();

  Future<DataResponse> listAllFeaturedProducts(
      {String? pincode, double? lat, double? lng}) async {
    try {
      final queryOptions = GraphQLService().makeQueryOptions(
        query: _productsBySubCategorySchema.listProductsBySubCategory,
        variables: {
          "input": {"limit": 0, "skip": 0},
          "filter": {
           // "featured": true,
            },
          "pinCode": userData.pinCode,
          // "lat":userData.lat,
          // "lng":userData.lng,
        },
        networkOnly: true,
      );

      final graphQLResponse = await GraphQLService().performQuery(
        queryOptions: queryOptions,
      );
      print("ListFeaturedProductsProvider :====: ${graphQLResponse.data}");
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

  Future<DataResponse> getRecentOrderedProducts() async {
    try {
      final queryOptions = GraphQLService().makeQueryOptions(
        query: _productsBySubCategorySchema.listProductsBySubCategory,
        variables: {
          "filter": {"orderAgain": true},
          "pinCode": userData.pinCode,
        },
        networkOnly: true,
      );

      final graphQLResponse = await GraphQLService().performQuery(
        queryOptions: queryOptions,
      );

      if (graphQLResponse.hasData) {
        return DataResponse(data: graphQLResponse.data);
      } else {
        return DataResponse(error: graphQLResponse.error?.message);
      }
    } catch (e) {
      debugPrint(
        "ListProductsBySubcategoryProvider:getRecentOrderedProducts:exception:" +
            e.toString(),
      );
    }

    return DataResponse(error: ErrorType.SOME_ERROR);
  }
}
