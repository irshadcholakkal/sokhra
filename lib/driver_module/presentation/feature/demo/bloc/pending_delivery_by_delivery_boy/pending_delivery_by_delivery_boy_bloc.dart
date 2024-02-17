import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../base_module/data/entity/models/page_input.dart';
import '../../../../../../orders_module/domain/models/order_list.dart';
import '../../../../../data/repository/delivery_provider.dart';

part 'pending_delivery_by_delivery_boy_event.dart';
part 'pending_delivery_by_delivery_boy_state.dart';

class PendingDeliveryByDeliveryBoyBloc extends Bloc<PendingDeliveryByDeliveryBoyEvent, PendingDeliveryByDeliveryBoyState> {
  final _deliveryProvider = DeliveryProvider();
  PendingDeliveryByDeliveryBoyBloc() : super(PendingDeliveryByDeliveryBoyLoading());

  Stream<PendingDeliveryByDeliveryBoyState>mapEventToState(PendingDeliveryByDeliveryBoyEvent event) async* {
    if (event is GetPendingDeliveryByDeliveryBoy) {
      yield PendingDeliveryByDeliveryBoyLoading();
      try {
        final deliveryDetailsByDeliveryBoyResponse = await _deliveryProvider
            .getDeliveryDetailsByDeliveryBoy(
            input: event.pageInput!, orderStatus: event.orderStatus!);
        if (deliveryDetailsByDeliveryBoyResponse.hasData) {
          yield PendingDeliveryByDeliveryLoad(
              orderList: deliveryDetailsByDeliveryBoyResponse.data as OrderList
          );
        } else {
          yield PendingDeliveryByDeliveryBoyFail(
              message: deliveryDetailsByDeliveryBoyResponse.error
          );
        }
      } catch (e) {
        yield PendingDeliveryByDeliveryBoyFail(message: "Some_Error");
      }
    }
  }



}
