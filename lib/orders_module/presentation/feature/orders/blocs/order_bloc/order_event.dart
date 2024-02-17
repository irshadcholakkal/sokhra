part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();
}

class FetchOrders extends OrderEvent {
  final bool reFetch;
  final OrderFilter? filterInput;

  FetchOrders({
    required this.reFetch,
    this.filterInput,
  });

  @override
  List<Object?> get props => [reFetch, filterInput];
}
