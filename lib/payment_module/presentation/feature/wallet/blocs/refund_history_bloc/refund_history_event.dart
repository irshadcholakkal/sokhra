part of 'refund_history_bloc.dart';

abstract class RefundHistoryEvent extends Equatable {
  const RefundHistoryEvent();
}

class RefundHistoryFetchEvent extends RefundHistoryEvent {
  final String? type;
  final bool? reFetch;

  RefundHistoryFetchEvent({this.type = "REFUND", this.reFetch});

  @override
  List<Object?> get props => [type, reFetch];
}
