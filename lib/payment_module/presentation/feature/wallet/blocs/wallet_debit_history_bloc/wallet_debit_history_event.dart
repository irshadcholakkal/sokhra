part of 'wallet_debit_history_bloc.dart';

abstract class WalletDebitHistoryEvent extends Equatable {
  const WalletDebitHistoryEvent();
}

class WalletDebitHistoryFetchEvent extends WalletDebitHistoryEvent {
  final String? type;
  final bool? reFetch;

  WalletDebitHistoryFetchEvent({this.type = "ORDER", this.reFetch});

  @override
  List<Object?> get props => [type, reFetch];
}
