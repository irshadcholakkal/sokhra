part of 'wallet_credit_history_bloc.dart';

abstract class WalletCreditHistoryState extends Equatable {
  const WalletCreditHistoryState();
  @override
  List<Object?> get props => [];
}

class WalletCreditHistoryLoading extends WalletCreditHistoryState {}

class WalletCreditHistoryFetchSuccess extends WalletCreditHistoryState {
  final CustomerWalletList? walletList;

  WalletCreditHistoryFetchSuccess({required this.walletList});
  @override
  List<Object?> get props => [walletList];
}

class WalletCreditHistoryFetchFailed extends WalletCreditHistoryState {
  final String error;

  WalletCreditHistoryFetchFailed({required this.error});

  @override
  List<Object?> get props => [error];
}
