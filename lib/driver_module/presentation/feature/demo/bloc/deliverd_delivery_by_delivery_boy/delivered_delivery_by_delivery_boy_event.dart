part of 'delivered_delivery_by_delivery_boy_bloc.dart';

abstract class DeliveredDeliveryByDeliveryBoyEvent extends Equatable {
  const DeliveredDeliveryByDeliveryBoyEvent();
}

class GetDeliveredDeliveryByDeliveryBoy
    extends DeliveredDeliveryByDeliveryBoyEvent {
  final PageInput? pageInput;
  final String? orderStatus;

  GetDeliveredDeliveryByDeliveryBoy({this.pageInput, this.orderStatus});

  @override
  List<Object?> get props => [pageInput, orderStatus];
}
