import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../orders_module/domain/models/order.dart';
import '../../../../../data/repository/delivery_provider.dart';

part 'change_order_status_event.dart';
part 'change_order_status_state.dart';

class ChangeOrderStatusBloc extends Bloc<ChangeOrderStatusEvent, ChangeOrderStatusState> {
  final _deliveryProvider = DeliveryProvider();

  ChangeOrderStatusBloc() : super(ChangeOrderStatusInitial());
  Stream<ChangeOrderStatusState>mapEventToState(ChangeOrderStatusEvent event) async* {
    if(event is GetChangeOrderStatus){
      yield ChangeOrderStatusInitial();
      try{
        final changeOrderStatusResponse = await _deliveryProvider.updateOrderStatus(id: event.id, status: event.status, deliveryText: event.deliveryText);
        if(changeOrderStatusResponse.hasData){
          yield ChangeOrderStatusSuccess(order: changeOrderStatusResponse.data as Order);
        }else{
          yield ChangeOrderStatusFail(
            message: changeOrderStatusResponse.error
          );
        }

      }catch(e){
        yield ChangeOrderStatusFail(message: "some_error");
      }


    }

  }

  }
