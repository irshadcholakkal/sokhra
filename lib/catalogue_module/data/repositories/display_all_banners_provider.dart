import 'package:flutter/material.dart';

import '../../../base_module/data/entity/graphql_service.dart';
import '../../../base_module/data/entity/models/data_response.dart';
import '../schemas/display_all_banners_schema.dart';

class DisplayAllBannersProvider {
  DisplayAllAppBannersSchema _displayAllAppBannersSchema =
      DisplayAllAppBannersSchema();
  Future<DataResponse> displayAllBanners() async {
    try {
      final queryOptions = GraphQLService().makeQueryOptions(
        query: _displayAllAppBannersSchema.customerGetAllBanners,
        variables: {},
        networkOnly: true,
      );

      final graphQLResponse = await GraphQLService().performQuery(
        queryOptions: queryOptions,
      );
      debugPrint("DisplayAllBannersProvider : ${graphQLResponse.data}");
       
      if (graphQLResponse.hasData) {
              debugPrint("DisplayAllBannersProvider : ${graphQLResponse.data}");

        return DataResponse(data: graphQLResponse.data);
      } else {
        return DataResponse(
          error: graphQLResponse.error!.message,
        );
      }
    } catch (e) {
      debugPrint("DisplayAllBannersProvider : " + e.toString());
    }
    return DataResponse(
      error: "SOME ERROR",
    );
  }
}
