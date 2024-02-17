part of 'not_delivered_delivery_by_delivery_boy_bloc.dart';

abstract class NotDeliveredDeliveryByDeliveryBoyEvent extends Equatable {
  const NotDeliveredDeliveryByDeliveryBoyEvent();
}

class GetNotDeliveryByDeliveryBoy extends NotDeliveredDeliveryByDeliveryBoyEvent{
  final PageInput ? pageInput;
  final String ? orderStatus;
  GetNotDeliveryByDeliveryBoy({this.pageInput, this.orderStatus});

  @override

  List<Object?> get props => [pageInput, orderStatus];

}