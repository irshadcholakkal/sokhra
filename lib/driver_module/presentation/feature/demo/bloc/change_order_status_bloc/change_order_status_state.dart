part of 'change_order_status_bloc.dart';

abstract class ChangeOrderStatusState extends Equatable {
  const ChangeOrderStatusState();
}

class ChangeOrderStatusInitial extends ChangeOrderStatusState {
  @override
  List<Object> get props => [];
}
class ChangeOrderStatusSuccess extends ChangeOrderStatusState {
  final Order ?order;
  ChangeOrderStatusSuccess({this.order});
  @override
  List<Object> get props => [order!];
}
class ChangeOrderStatusFail extends ChangeOrderStatusState {
  final String ? message;
  ChangeOrderStatusFail({this.message});
  @override
  List<Object> get props => [message!];
}
