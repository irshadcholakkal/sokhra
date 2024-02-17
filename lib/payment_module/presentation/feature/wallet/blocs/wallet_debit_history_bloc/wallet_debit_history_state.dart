part of 'wallet_debit_history_bloc.dart';

abstract class WalletDebitHistoryState extends Equatable {
  const WalletDebitHistoryState();
  @override
  List<Object?> get props => [];
}

class WalletDebitHistoryLoading extends WalletDebitHistoryState {}

class WalletDebitHistoryFetchSuccess extends WalletDebitHistoryState {
  final CustomerWalletList? walletList;

  WalletDebitHistoryFetchSuccess({required this.walletList});
  @override
  List<Object?> get props => [walletList];
}

class WalletDebitHistoryFetchFailed extends WalletDebitHistoryState {
  final String error;

  WalletDebitHistoryFetchFailed({required this.error});

  @override
  List<Object?> get props => [error];
}
