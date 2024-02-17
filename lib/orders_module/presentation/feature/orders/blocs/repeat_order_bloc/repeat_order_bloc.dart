import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../../../data/repositories/order_provider.dart';
import '../../../../../domain/models/repeat_purchase_response.dart';

part 'repeat_order_event.dart';
part 'repeat_order_state.dart';

class RepeatOrderBloc extends Bloc<RepeatOrderEvent, RepeatOrderState> {
  RepeatOrderBloc() : super(RepeatOrderLoading());
  final _ordersProvider = OrderProvider();

  @override
  Stream<RepeatOrderState> mapEventToState(RepeatOrderEvent event) async* {
    if (event is RepeatOrderCreateEvent) {
      yield RepeatOrderLoading();
      try {
        final dataResponse = await _ordersProvider.repeatPurchase(
            orderId: event.orderId,
            // pinCode: event.pinCode,
          lat: event.lat,lng: event.lng

        );
        if (dataResponse.hasData) {
          RepeatPurchaseResponse? response = RepeatPurchaseResponse.fromJson(
              dataResponse.data["repeatPurchase"]);
          debugPrint("response is $response");
          yield RepeatOrderSuccess();
        } else if (dataResponse.hasError) {
          yield RepeatOrderFailed(
              error:
                  dataResponse.error?.replaceAll(" ", "_").toUpperCase() ?? "");
        }
      } catch (e) {
        yield RepeatOrderFailed(
            error: e.toString().replaceAll(" ", "_").toUpperCase());
      }
    }
  }
}
