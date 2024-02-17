import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../data/repositories/payment_provider.dart';
import '../../../../../domain/entity/models/customer_wallet_list.dart';

part 'wallet_credit_history_event.dart';
part 'wallet_credit_history_state.dart';

class WalletCreditHistoryBloc
    extends Bloc<WalletCreditHistoryEvent, WalletCreditHistoryState> {
  WalletCreditHistoryBloc() : super(WalletCreditHistoryLoading());
  final _paymentProvider = PaymentProvider();

  @override
  Stream<WalletCreditHistoryState> mapEventToState(
      WalletCreditHistoryEvent event) async* {
    if (event is WalletCreditHistoryFetchEvent) {
      yield WalletCreditHistoryLoading();
      final dataResponse = await _paymentProvider.getCustomerWallet(
          type: event.type, reFetch: event.reFetch);
      if (dataResponse.hasData) {
        yield WalletCreditHistoryFetchSuccess(
            walletList: dataResponse.data as CustomerWalletList);
      } else if (dataResponse.hasError) {
        yield WalletCreditHistoryFetchFailed(
            error:
                dataResponse.error?.replaceAll(" ", "_").toUpperCase() ?? "");
      }
    }
  }
}
