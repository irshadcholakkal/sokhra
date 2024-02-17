import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../base_module/data/entity/models/page_input.dart';
import '../../../../../../orders_module/domain/models/order_list.dart';
import '../../../../../data/repository/delivery_provider.dart';

part 'not_delivered_delivery_by_delivery_boy_event.dart';
part 'not_delivered_delivery_by_delivery_boy_state.dart';

class NotDeliveredDeliveryByDeliveryBoyBloc extends Bloc<NotDeliveredDeliveryByDeliveryBoyEvent, NotDeliveredDeliveryByDeliveryBoyState> {
  final _deliveryProvider = DeliveryProvider();
  NotDeliveredDeliveryByDeliveryBoyBloc() : super(NotDeliveredDeliveryByDeliveryBoyInitial());

  Stream<NotDeliveredDeliveryByDeliveryBoyState>mapEventToState(NotDeliveredDeliveryByDeliveryBoyEvent event) async* {

    if (event is GetNotDeliveryByDeliveryBoy) {
      yield NotDeliveredDeliveryByDeliveryBoyInitial();
      try {
        final deliveryDetailsByDeliveryBoyResponse = await _deliveryProvider
            .getDeliveryDetailsByDeliveryBoy(
            input: event.pageInput!, orderStatus: event.orderStatus!);
        if (deliveryDetailsByDeliveryBoyResponse.hasData) {
          yield NotDeliveredDeliveryByDeliveryBoyLoad(
              orderList: deliveryDetailsByDeliveryBoyResponse.data as OrderList
          );
        } else {
          yield NotDeliveredDeliveryByDeliveryBoyFail(
              message: deliveryDetailsByDeliveryBoyResponse.error
          );
        }
      } catch (e) {
        yield NotDeliveredDeliveryByDeliveryBoyFail(message: "Some_Error");
      }
    }


  }

}
