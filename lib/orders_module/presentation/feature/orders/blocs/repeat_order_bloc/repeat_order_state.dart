part of 'repeat_order_bloc.dart';

abstract class RepeatOrderState extends Equatable {
  const RepeatOrderState();
  @override
  List<Object> get props => [];
}

class RepeatOrderLoading extends RepeatOrderState {}

class RepeatOrderSuccess extends RepeatOrderState {}

class RepeatOrderFailed extends RepeatOrderState {
  final String error;

  RepeatOrderFailed({required this.error});

  @override
  List<Object> get props => [error];
}
