import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

import '../../../base_module/data/entity/graphql_service.dart';
import '../../../base_module/data/entity/models/data_response.dart';
import '../../../base_module/data/entity/models/error_info.dart';
import '../../../user_module/domain/entity/authentication.dart';
import '../../../user_module/domain/user_data.dart';
import '../../domain/entity/models/app_data.dart';
import '../schemas/app_data_schema.dart';

class AppDataProvider {
  final _appDataSchema = AppDataSchema();

  Future<DataResponse> getAppData({
    required bool reFetch,
  }) async {
    try {
      final queryOptions = graphQLService.makeQueryOptions(
        query: _appDataSchema.getAppData,
        networkOnly: reFetch,
        cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      );

      final graphQLResponse = await graphQLService.performQuery(
        queryOptions: queryOptions,
      );

      if (graphQLResponse.hasData) {
        debugPrint(
            "app data provider get userdata response:${graphQLResponse.data}"); 
        final appData = AppData.fromJson(
          graphQLResponse.data["customerProfile"] as Map<String, dynamic>,
        );
        debugPrint(
            "id is ${appData.id} userid is ${appData.user?.id} user role is ${appData.user?.role}");
        await userData.setCustomerId(customerId: appData.id ?? "");
        if (authentication.isAuthenticated) {
          await authentication.saveAuthenticatedUser(
            authenticatedUser: authentication.authenticatedUser?.copyWith(
              user: appData.user,
            ),
          
          );
          print("userData.setCustomerId :-${appData.user}---");

          final shippingAddress = appData.addressDetails?.firstWhereOrNull(
            (element) => element.isDefault == true,
          );

          // if (shippingAddress != null &&
          //     userData.defaultShippingAddress != null) {
          //   await userData.saveDefaultShippingAddress(
          //     shippingAddress,
          //     emit: false,
          //   );
          // }
        }

        // dateTimeHelper.setCurrentDateTime(appData.currentDateTime);

        return DataResponse(
          data: appData,
        );
      } else {
        final errorInfo = graphQLResponse.error!;

        // debugPrint(
        //   "AppDataProvider.getAppData:Error:${errorInfo.message}",
        // );

        return DataResponse(
          error: errorInfo.type,
        );
      }
    } catch (e) {
      debugPrint(
        "AppDataProvider.getAppData:Exception:$e",
      );
    }

    return DataResponse(
      error: ErrorType.SOME_ERROR,
    );
  }

  Future<DataResponse> getConfigurations({
    required bool reFetch,
  }) async {
    try {
      final queryOptions = graphQLService.makeQueryOptions(
        query: _appDataSchema.getConfigurations,
        networkOnly: reFetch,
        cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      );

      final graphQLResponse = await graphQLService.performQuery(
        queryOptions: queryOptions,
      );

      if (graphQLResponse.hasData) {
        return DataResponse(data: graphQLResponse.data["getConfigurations"]);
      } else {
        final errorInfo = graphQLResponse.error!;

        // debugPrint(
        //   "AppDataProvider.getAppData:Error:${errorInfo.message}",
        // );

        return DataResponse(
          error: errorInfo.type,
        );
      }
    } catch (e) {
      log(
        "AppDataProvider getConfigurations:Exception:$e",
      );
    }

    return DataResponse(
      error: ErrorType.SOME_ERROR,
    );
  }
}
