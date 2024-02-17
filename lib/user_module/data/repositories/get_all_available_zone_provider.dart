import 'package:flutter/material.dart';
import '../../../base_module/data/entity/graphql_service.dart';
import '../../../base_module/data/entity/models/data_response.dart';
import '../../../base_module/data/entity/models/error_info.dart';
import '../schemas/get_all_available_zone_schema.dart';

class ZoneProvider{
 ZoneSchema _zoneSchema =ZoneSchema();

  Future<DataResponse> getAllZones(
  ) async {
    try {
      final queryOptions = graphQLService.makeQueryOptions(
        query: _zoneSchema.getAllZones,
        networkOnly: true,
      );

      final graphQLResponse = await graphQLService.performQuery(
        queryOptions: queryOptions,
      );
           debugPrint(
          "getAllZones:response -:${graphQLResponse.data}",
        );
      if (graphQLResponse.hasData) {
        debugPrint(
          "getAllZones:response :${graphQLResponse.data}",
        ); 
        return DataResponse(
          data: graphQLResponse.data
        // GetAllZones.fromJson(
          //   graphQLResponse.data["getAllZones"]
          //       as Map<String, dynamic>,
          // ),
        );
        
          } else {
        final errorInfo = graphQLResponse.error!;

        debugPrint(
          "getAllZones:Error:${errorInfo.message}",
        );

        return DataResponse(
          error: errorInfo.type,
        );
      }
    } catch (e) {
      debugPrint("NotificationProvider.getNotifications:Exception:$e");
    }

    return DataResponse(
      error: ErrorType.SOME_ERROR,
    );
  }
}