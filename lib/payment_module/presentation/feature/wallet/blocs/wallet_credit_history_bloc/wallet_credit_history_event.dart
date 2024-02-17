part of 'wallet_credit_history_bloc.dart';

abstract class WalletCreditHistoryEvent extends Equatable {
  const WalletCreditHistoryEvent();
}

class WalletCreditHistoryFetchEvent extends WalletCreditHistoryEvent {
  final String? type;
  final bool? reFetch;

  WalletCreditHistoryFetchEvent({this.type = "RECHARGE", this.reFetch});

  @override
  List<Object?> get props => [type, reFetch];
}
