import 'package:flutter/material.dart';

import '../../../base_module/data/entity/graphql_service.dart';
import '../../../base_module/data/entity/models/data_response.dart';
import '../../../base_module/data/entity/models/error_info.dart';
import '../../domain/entity/models/notification_list.dart';
import '../schemas/notification_schema.dart';

class NotificationProvider {
  final _notificationSchema = NotificationSchema();

  Future<DataResponse> getNotifications({
    required bool reFetch,
  }) async {
    try {
      final queryOptions = graphQLService.makeQueryOptions(
        query: _notificationSchema.getNotifications,
        networkOnly: reFetch,
      );

      final graphQLResponse = await graphQLService.performQuery(
        queryOptions: queryOptions,
      );
      debugPrint(
        "Notfication provider getNotification:response :${graphQLResponse.data}",
      );
      if (graphQLResponse.hasData) {
        debugPrint(
          "Notfication provider getNotification:response :${graphQLResponse.data}",
        );
        return DataResponse(
          data: NotificationList.fromJson(
            graphQLResponse.data["getNotificationOfCurrentUser"]
                as Map<String, dynamic>,
          ),
        );
      } else {
        final errorInfo = graphQLResponse.error!;

        debugPrint(
          "NotificationProvider.getNotifications:Error:${errorInfo.message}",
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

  Future<DataResponse> getAllNotifications() async {
    try {
      final queryOptions = GraphQLService().makeQueryOptions(
          query: _notificationSchema.getAllNotifications,
          variables: {
            'input': {'limit': 0, 'skip': 0}
          });

      final graphQLResponse =
          await graphQLService.performQuery(queryOptions: queryOptions);
      print(graphQLResponse.data);
      if (graphQLResponse.hasData) {
        return DataResponse(
            data: NotificationList.fromJson(
          graphQLResponse.data["getAllNotifications"] as Map<String, dynamic>,
        ));
      }
    } catch (e) {
      debugPrint("NotificationProvider.getNotifications:Exception:>>$e");
    }
    return DataResponse(
      error: ErrorType.SOME_ERROR,
    );
  }
}
