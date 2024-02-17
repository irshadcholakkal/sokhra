
import '../../../base_module/data/entity/graphql_service.dart';
import '../../../base_module/data/entity/models/data_response.dart';
import '../../../base_module/data/entity/models/page_input.dart';
import '../../../base_module/domain/entity/app.dart';
import '../../../user_module/domain/user_data.dart';
import '../../domain/models/order_list.dart';
import '../entities/models/order_filter.dart';
import '../schemas/orders_schema.dart';

class OrderProvider {
  final _orderSchema = OrderSchema();

  Future<DataResponse> getOrders({
    required bool reFetch,
    required PageInput pageInput,
    required OrderFilter? filterInput,
  }) async {
    final _queryOptions = GraphQLService().makeQueryOptions(
      query: _orderSchema.getOrders,
      variables: {
        "input": pageInput,
        "filter": filterInput,
      },
      networkOnly: reFetch,
    );

    final _graphQLResponse = await graphQLService.performQuery(
      queryOptions: _queryOptions,
    );

    if (_graphQLResponse.hasData) {
      return DataResponse(
        data: OrderList.fromJson(_graphQLResponse.data["orders"]),
      );
    }

    final errorInfo = _graphQLResponse.error;
    return DataResponse(error: errorInfo?.type);
  }

  Future<DataResponse> repeatPurchase({
    required String orderId,
    // required String pinCode,
    required double? lat,
    required double? lng,
  }) async {
    final _mutationOptions = GraphQLService().makeMutationOptions(
      query: _orderSchema.repeatPurchase,
      variables: {
        "id": orderId,
        "pinCode": userData.pinCode,
        "deviceId": app.deviceId,
      },
    );

    final _graphQLResponse = await graphQLService.performMutation(
      mutationOptions: _mutationOptions,
    );

    if (_graphQLResponse.hasData) {
      return DataResponse(data: _graphQLResponse.data);
    }

    final errorInfo = _graphQLResponse.error;
    return DataResponse(error: errorInfo?.type);
  }
}
