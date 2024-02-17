part of 'payment_bloc.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();
  @override
  List<Object> get props => [];
}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class InitiatePaymentSuccess extends PaymentState {
  final InitiatePaymentResponse response;

  InitiatePaymentSuccess({required this.response});
  @override
  List<Object> get props => [response];
}

class InitiatePaymentFailed extends PaymentState {
  final String message;

  InitiatePaymentFailed({required this.message});
  @override
  List<Object> get props => [message];
}

class CreatePaymentSuccess extends PaymentState {
  final Order response;

  CreatePaymentSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

class CreatePaymentFailed extends PaymentState {
  final String message;

  CreatePaymentFailed({required this.message});

  @override
  List<Object> get props => [message];
}
