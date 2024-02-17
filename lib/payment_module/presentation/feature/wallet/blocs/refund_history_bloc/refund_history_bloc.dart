import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../data/repositories/payment_provider.dart';
import '../../../../../domain/entity/models/customer_wallet_list.dart';

part 'refund_history_event.dart';
part 'refund_history_state.dart';

class RefundHistoryBloc extends Bloc<RefundHistoryEvent, RefundHistoryState> {
  RefundHistoryBloc() : super(RefundHistoryLoading());
  final _paymentProvider = PaymentProvider();

  @override
  Stream<RefundHistoryState> mapEventToState(RefundHistoryEvent event) async* {
    if (event is RefundHistoryFetchEvent) {
      yield RefundHistoryLoading();
      final dataResponse = await _paymentProvider.getCustomerWallet(
          type: event.type, reFetch: event.reFetch);
      if (dataResponse.hasData) {
        yield RefundHistoryFetchSuccess(
            walletList: dataResponse.data as CustomerWalletList);
      } else if (dataResponse.hasError) {
        yield RefundHistoryFetchFailed(
            error:
                dataResponse.error?.replaceAll(" ", "_").toUpperCase() ?? "");
      }
    }
  }
}
