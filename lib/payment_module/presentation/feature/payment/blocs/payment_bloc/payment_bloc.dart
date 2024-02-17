import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../orders_module/domain/models/order.dart';
import '../../../../../data/entity/models/create_payment_input.dart';
import '../../../../../data/entity/models/initiate_payment_input.dart';
import '../../../../../data/repositories/payment_provider.dart';
import '../../../../../domain/entity/models/initiate_payment_response.dart';

part 'payment_event.dart';

part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial());
  final _paymentProvider = PaymentProvider();

  @override
  Stream<PaymentState> mapEventToState(PaymentEvent event) async* {
    if (event is PaymentInitiateEvent) {
      yield* _mapInitiatePaymentToState(event);
    } else if (event is PaymentCreateEvent) {
      yield* _mapCreatePaymentToState(event);
    } else if (event is PaymentErrorEvent) {
      yield* _mapPaymentErrorToState(event);
    }
  }

  Stream<PaymentState> _mapCreatePaymentToState(
      PaymentCreateEvent event) async* {
    yield PaymentLoading();
    try {
      final dataResponse = await _paymentProvider.createPayment(
        createPaymentInput: event.input,
      );

      if (dataResponse.hasData) {
        yield CreatePaymentSuccess(response: dataResponse.data as Order);
      } else if (dataResponse.hasError) {
        yield CreatePaymentFailed(
          message: dataResponse.error?.replaceAll(" ", "_").toUpperCase() ?? "",
        );
      }
    } catch (e) {
      log("exception paymentbloc create paymen event $e");
      yield CreatePaymentFailed(
        message: e.toString().replaceAll(" ", "_").toUpperCase(),
      );
    }
  }

  Stream<PaymentState> _mapInitiatePaymentToState(
    PaymentInitiateEvent event,
  ) async* {
    yield PaymentLoading();

    try {
      final dataResponse = await _paymentProvider.initiatePayment(
        initiatePaymentInput: event.input,
      );
     print("event.input:${event.input}");
      print("_mapInitiatePaymentToState:${dataResponse.data} ,ERROR:${dataResponse.error}");

      if (dataResponse.hasData) {
        yield InitiatePaymentSuccess(
          response: dataResponse.data as InitiatePaymentResponse,
        );
      } else if (dataResponse.hasError) {
        yield InitiatePaymentFailed(
          message: dataResponse.error?.replaceAll(" ", "_").toUpperCase() ?? "",
        );
      }
    } catch (e) {
      log("exception PaymentBloc PaymentInitiateEvent event $e");

      yield InitiatePaymentFailed(
        message: e.toString().replaceAll(" ", "_").toUpperCase(),
      );
    }
  }

  Stream<PaymentState> _mapPaymentErrorToState(PaymentErrorEvent event) async* {
    yield PaymentLoading();
    log("exception paymentbloc payment error event ${event.error}");
    yield CreatePaymentFailed(message: event.error);
  }
}
