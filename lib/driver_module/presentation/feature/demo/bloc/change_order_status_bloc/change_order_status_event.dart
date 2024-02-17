part of 'change_order_status_bloc.dart';

abstract class ChangeOrderStatusEvent extends Equatable {
  const ChangeOrderStatusEvent();
}
class GetChangeOrderStatus extends ChangeOrderStatusEvent{
  final String ? id;
  final String ? status;
  final String ? deliveryText;

  GetChangeOrderStatus({this.id, this.status, this.deliveryText});

  @override
  List<Object?> get props => [id, status, deliveryText];

}