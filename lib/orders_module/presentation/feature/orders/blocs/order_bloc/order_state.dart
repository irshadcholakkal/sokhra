part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  final List<Order>? data;
  final String? error;

  const OrderState({this.data, this.error});

  String get errorMessage => error ?? "";

  @override
  List<Object?> get props => [data, error];
}

class OrdersInitial extends OrderState {}

class FetchOrdersLoading extends OrderState {}

class FetchOrdersSuccess extends OrderState {
  final List<Order> orders;

  FetchOrdersSuccess({required this.orders}) : super(data: orders);

  @override
  List<Object> get props => [orders];
}

class FetchOrdersFailed extends OrderState {
  final String message;

  FetchOrdersFailed({required this.message}) : super(error: message);

  @override
  List<Object> get props => [message];
}
