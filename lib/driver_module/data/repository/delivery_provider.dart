
import 'package:flutter/material.dart';

import '../../../base_module/data/entity/graphql_service.dart';
import '../../../base_module/data/entity/models/data_response.dart';
import '../../../base_module/data/entity/models/page_input.dart';
import '../../../orders_module/domain/models/order.dart';
import '../../../orders_module/domain/models/order_list.dart';
import '../schema/delivery_schema.dart';


class DeliveryProvider{
  DeliverySchema _deliverySchema = DeliverySchema();

  Future<DataResponse> getDeliveryDetailsByDeliveryBoy({
    required PageInput input,
    required String orderStatus,

  }) async {
    final _queryOptions = GraphQLService().makeQueryOptions(
        query: _deliverySchema.getAllDeliveriesByDeliveryBoy,
        variables: {
          "input": input,
          "orderStatus": orderStatus
        },
        networkOnly: true);

    final _graphQLResponse =
    await graphQLService.performQuery(queryOptions: _queryOptions);
    // debugPrint("getOrders response is $_graphQLResponse ");

    if (_graphQLResponse.hasData) {
      debugPrint("getOrders response" + _graphQLResponse.data.toString());
      return DataResponse(

          data: OrderList.fromJson(_graphQLResponse.data["getAllDeliveriesByDeliveryBoy"]));
    } else {
      final errorInfo = _graphQLResponse.error;
      // debugPrint("catalogue provider getFeatured error:${errorInfo?.message}");
      return DataResponse(
        error: errorInfo?.type,
      );
    }
  }




  Future<DataResponse> updateOrderStatus({
    required String ? id,
    required String ? status,
    required String ? deliveryText,

  }) async {
    final _queryOptions = GraphQLService().makeMutationOptions(
      query: _deliverySchema.updateOrderStatus,
      variables: {
        "id":id,
        "status":status,
        "deliveryText": deliveryText
      },
    );
    // debugPrint("payment provider->initiate payment $initiatePaymentInput");

    final _graphQLResponse = await graphQLService.performMutation(
      mutationOptions: _queryOptions,
    );

    if (_graphQLResponse.hasData) {

      return DataResponse(
          data: Order.fromJson(
              _graphQLResponse.data["updateOrderStatus"]));
    } else {
      final errorInfo = _graphQLResponse.error;
      return DataResponse(
        error: errorInfo?.type,
      );
    }
  }


}