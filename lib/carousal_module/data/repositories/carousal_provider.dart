import 'package:flutter/material.dart';

import '../../../base_module/data/entity/graphql_service.dart';
import '../../../base_module/data/entity/models/data_response.dart';
import '../../domain/models/banners.dart';
import '../schemas/carousal_schema.dart';

class CarousalProvider {
  final _carousalSchema = CarousalSchema();
  Future<DataResponse> getBanners({
    required bool reFetch,
  }) async {
    final _queryOptions = GraphQLService().makeQueryOptions(
        query: _carousalSchema.getAllBanners, networkOnly: reFetch);

    final _graphQLResponse =
        await graphQLService.performQuery(queryOptions: _queryOptions);

    if (_graphQLResponse.hasData) {
      // debugPrint("carousal provider data ${_graphQLResponse.data}");
      return DataResponse(
          data: Banners.fromJson(_graphQLResponse.data["getAllBanners"]));
    } else {
      final errorInfo = _graphQLResponse.error;
      debugPrint("getPromotions error:${errorInfo?.message}");
      return DataResponse(
        error: errorInfo?.type,
      );
    }
  }
}
