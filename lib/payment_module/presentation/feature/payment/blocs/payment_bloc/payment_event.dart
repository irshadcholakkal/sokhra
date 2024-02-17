part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();
}

class PaymentInitiateEvent extends PaymentEvent {
  final InitiatePaymentInput input;

  PaymentInitiateEvent({required this.input});

  @override
  List<Object?> get props => [input];
}

class PaymentCreateEvent extends PaymentEvent {
  final CreatePaymentInput input;

  PaymentCreateEvent({required this.input});

  @override
  List<Object?> get props => [input];
}

class PaymentErrorEvent extends PaymentEvent {
  final String error;

  PaymentErrorEvent({required this.error});

  @override
  List<Object?> get props => [error];
}
