import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../base_module/data/entity/models/page_input.dart';
import '../../../../../data/entities/models/order_filter.dart';
import '../../../../../data/repositories/order_provider.dart';
import '../../../../../domain/models/order.dart';
import '../../../../../domain/models/order_list.dart';

part 'order_event.dart';

part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrdersInitial());
  final _ordersProvider = OrderProvider();

  List<Order> _orders = [];

  bool _hasReachedMax = false;

  List<Order> get orders => _orders;

  @override
  Stream<OrderState> mapEventToState(OrderEvent event) async* {
    if (event is FetchOrders) {
      final pageInput = PageInput(
        limit: 100,
        skip: event.reFetch == true ? 0 : orders.length,
      );

      if (event.reFetch != true && _hasReachedMax) return;

      if (event.reFetch == true) {
        yield FetchOrdersLoading();
      }

      try {
        final dataResponse = await _ordersProvider.getOrders(
          reFetch: event.reFetch,
          pageInput: pageInput,
          filterInput: event.filterInput,
        );
        print("Orders:${dataResponse.data}");

        if (dataResponse.hasData) {
          final ordersList = (dataResponse.data as OrderList).orders ?? [];
          _hasReachedMax = ordersList.isEmpty;

          pageInput.skip == 0
              ? _orders = ordersList
              : _orders = [..._orders, ...ordersList];

          yield FetchOrdersSuccess(orders: _orders);
        } else if (dataResponse.hasError) {
          yield FetchOrdersFailed(message: dataResponse.error ?? "");
        }
      } catch (e) {
        yield FetchOrdersFailed(message: e.toString());
      }
    }
  }
}
