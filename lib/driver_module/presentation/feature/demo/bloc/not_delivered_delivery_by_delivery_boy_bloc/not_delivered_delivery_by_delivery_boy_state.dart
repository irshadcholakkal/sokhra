part of 'not_delivered_delivery_by_delivery_boy_bloc.dart';

abstract class NotDeliveredDeliveryByDeliveryBoyState extends Equatable {
  const NotDeliveredDeliveryByDeliveryBoyState();
}

class NotDeliveredDeliveryByDeliveryBoyInitial extends NotDeliveredDeliveryByDeliveryBoyState {
  @override
  List<Object> get props => [];
}
class NotDeliveredDeliveryByDeliveryBoyLoad extends NotDeliveredDeliveryByDeliveryBoyState {
  final OrderList? orderList;
  NotDeliveredDeliveryByDeliveryBoyLoad({this.orderList});

  @override
  List<Object> get props => [];
}
class NotDeliveredDeliveryByDeliveryBoyFail extends NotDeliveredDeliveryByDeliveryBoyState {
  final String ? message;
  NotDeliveredDeliveryByDeliveryBoyFail({this.message});
  @override
  List<Object> get props => [];
}
