part of 'pending_delivery_by_delivery_boy_bloc.dart';

abstract class PendingDeliveryByDeliveryBoyState extends Equatable {
  const PendingDeliveryByDeliveryBoyState();
}

class PendingDeliveryByDeliveryBoyLoading extends PendingDeliveryByDeliveryBoyState {
  @override
  List<Object> get props => [];
}
class PendingDeliveryByDeliveryLoad extends PendingDeliveryByDeliveryBoyState {
  final OrderList? orderList;
  PendingDeliveryByDeliveryLoad({this.orderList});
  @override
  List<Object> get props => [orderList!];
}
class PendingDeliveryByDeliveryBoyFail extends PendingDeliveryByDeliveryBoyState {
  final String ? message;
  PendingDeliveryByDeliveryBoyFail({this.message});
  @override
  List<Object> get props => [message!];
}
