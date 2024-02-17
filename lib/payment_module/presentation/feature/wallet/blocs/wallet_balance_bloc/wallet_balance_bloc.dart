import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../data/repositories/payment_provider.dart';
import '../../../../../domain/entity/models/wallet_balance.dart';

part 'wallet_balance_event.dart';
part 'wallet_balance_state.dart';

class WalletBalanceBloc extends Bloc<WalletBalanceEvent, WalletBalanceState> {
  WalletBalanceBloc() : super(WalletBalanceLoading());
  final _walletProvider = PaymentProvider();

  @override
  Stream<WalletBalanceState> mapEventToState(WalletBalanceEvent event) async* {
    if (event is WalletBalanceFetchEvent) {
      yield WalletBalanceLoading();
      final dataResponse =
          await _walletProvider.getWalletBalance(reFetch: event.reFetch);
      if (dataResponse.hasData) {
        yield WalletBalanceFetchSuccess(
            walletBalance: dataResponse.data as WalletBalance);
      } else if (dataResponse.hasError) {
        yield WalletBalanceFetchFailed(
            error:
                dataResponse.error?.replaceAll(" ", "_").toUpperCase() ?? "");
      }
    }
  }
}
