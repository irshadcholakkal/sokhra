import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../base_module/data/entity/models/page_input.dart';
import '../../../../../../orders_module/domain/models/order_list.dart';
import '../../../../../data/repository/delivery_provider.dart';

part 'delivered_delivery_by_delivery_boy_event.dart';
part 'delivered_delivery_by_delivery_boy_state.dart';

class DeliveredDeliveryByDeliveryBoyBloc extends Bloc<
    DeliveredDeliveryByDeliveryBoyEvent, DeliveredDeliveryByDeliveryBoyState> {
  final _deliveryProvider = DeliveryProvider();

  DeliveredDeliveryByDeliveryBoyBloc()
      : super(DeliveredDeliveryByDeliveryBoyInitial());

  Stream<DeliveredDeliveryByDeliveryBoyState> mapEventToState(
      DeliveredDeliveryByDeliveryBoyEvent event) async* {
    if (event is GetDeliveredDeliveryByDeliveryBoy) {
      yield DeliveredDeliveryByDeliveryBoyInitial();
      try {
        final deliveryDetailsByDeliveryBoyResponse =
            await _deliveryProvider.getDeliveryDetailsByDeliveryBoy(
                input: event.pageInput!, orderStatus: event.orderStatus!);
        if (deliveryDetailsByDeliveryBoyResponse.hasData) {
          yield DeliveredDeliveryByDeliveryBoySuccess(
              orderList:
                  deliveryDetailsByDeliveryBoyResponse.data as OrderList);
        } else {
          yield DeliveredDeliveryByDeliveryBoyFail(
              message: deliveryDetailsByDeliveryBoyResponse.error);
        }
      } catch (e) {
        yield DeliveredDeliveryByDeliveryBoyFail(message: "Some_Error");
      }
    }
  }
}
