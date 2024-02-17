part of 'delivered_delivery_by_delivery_boy_bloc.dart';

abstract class DeliveredDeliveryByDeliveryBoyState extends Equatable {
  const DeliveredDeliveryByDeliveryBoyState();
}

class DeliveredDeliveryByDeliveryBoyInitial extends DeliveredDeliveryByDeliveryBoyState {
  @override
  List<Object> get props => [];
}
class DeliveredDeliveryByDeliveryBoySuccess extends DeliveredDeliveryByDeliveryBoyState {
  final OrderList? orderList;
  DeliveredDeliveryByDeliveryBoySuccess({this.orderList});
  @override
  List<Object> get props => [orderList!];
}
class DeliveredDeliveryByDeliveryBoyFail extends DeliveredDeliveryByDeliveryBoyState {
  final String ? message;
  DeliveredDeliveryByDeliveryBoyFail({this.message});

  @override
  List<Object> get props => [message!];
}
