import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../data/entity/models/wallet_input.dart';
import '../../../../../data/repositories/payment_provider.dart';
import '../../../../../domain/entity/models/customer_wallet.dart';
import '../../../../../domain/entity/models/initiate_payment_response.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc() : super(WalletLoading());
  final _paymentProvider = PaymentProvider();

  @override
  Stream<WalletState> mapEventToState(WalletEvent event) async* {
    if (event is WalletInitiateEvent) {
      yield* _mapWalletInitiateEventToState(event);
    }
    if (event is WalletCreditEvent) {
      yield WalletLoading();
      final dataResponse =
          await _paymentProvider.addToWallet(input: event.walletInput);
      if (dataResponse.hasData) {
        yield WalletCreditSuccess(customerWallet: dataResponse.data);
      } else if (dataResponse.hasError) {
        yield WalletCreditFailed(
            error:
                dataResponse.error?.replaceAll(" ", "_").toUpperCase() ?? "");
      }
    }
  }

  Stream<WalletState> _mapWalletInitiateEventToState(
      WalletInitiateEvent event) async* {
    yield WalletLoading();
    final dataResponse = await _paymentProvider.initiateCustomerWallet(
        note: event.note, credit: event.credit);
    if (dataResponse.hasData) {
      yield WalletInitiateSuccess(response: dataResponse.data);
    } else if (dataResponse.hasError) {
      yield WalletInitiateFailed(
          error: dataResponse.error?.replaceAll(" ", "_").toUpperCase() ?? "");
    }
  }
}
