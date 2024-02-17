part of 'wallet_balance_bloc.dart';

abstract class WalletBalanceEvent extends Equatable {
  const WalletBalanceEvent();
}

class WalletBalanceFetchEvent extends WalletBalanceEvent {
  final bool? reFetch;

  WalletBalanceFetchEvent({this.reFetch});
  List<Object?> get props => [reFetch];
}
