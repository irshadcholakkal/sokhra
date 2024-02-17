part of 'pending_delivery_by_delivery_boy_bloc.dart';

abstract class PendingDeliveryByDeliveryBoyEvent extends Equatable {
  const PendingDeliveryByDeliveryBoyEvent();
}

class GetPendingDeliveryByDeliveryBoy extends PendingDeliveryByDeliveryBoyEvent{
  final PageInput ? pageInput;
  final String ? orderStatus;
  GetPendingDeliveryByDeliveryBoy({this.pageInput, this.orderStatus});

  @override

  List<Object?> get props => [pageInput, orderStatus];

}