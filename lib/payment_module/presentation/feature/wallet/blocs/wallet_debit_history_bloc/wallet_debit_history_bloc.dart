import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../data/repositories/payment_provider.dart';
import '../../../../../domain/entity/models/customer_wallet_list.dart';

part 'wallet_debit_history_event.dart';
part 'wallet_debit_history_state.dart';

class WalletDebitHistoryBloc
    extends Bloc<WalletDebitHistoryEvent, WalletDebitHistoryState> {
  WalletDebitHistoryBloc() : super(WalletDebitHistoryLoading());
  final _paymentProvider = PaymentProvider();

  @override
  Stream<WalletDebitHistoryState> mapEventToState(
      WalletDebitHistoryEvent event) async* {
    if (event is WalletDebitHistoryFetchEvent) {
      yield WalletDebitHistoryLoading();
      final dataResponse = await _paymentProvider.getCustomerWallet(
          type: event.type, reFetch: event.reFetch);
      if (dataResponse.hasData) {
        yield WalletDebitHistoryFetchSuccess(
            walletList: dataResponse.data as CustomerWalletList);
      } else if (dataResponse.hasError) {
        yield WalletDebitHistoryFetchFailed(
            error:
                dataResponse.error?.replaceAll(" ", "_").toUpperCase() ?? "");
      }
    }
  }
}
